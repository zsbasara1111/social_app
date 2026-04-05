import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/supabase_service.dart';
import '../models/match_models.dart';

final matchServiceProvider = Provider<MatchService>((ref) {
  return MatchService();
});

class MatchService {
  final SupabaseClient _client = SupabaseService.client;

  /// 查找匹配用户
  Future<List<MatchUser>> findMatches({
    required String currentUserId,
    required MatchSettings settings,
    int page = 0,
    int pageSize = 20,
  }) async {
    try {
      // 1. 获取当前用户的爱好
      final myHobbies = await _getUserHobbies(currentUserId);

      // 2. 构建查询条件
      var query = _client
          .from('users')
          .select('''
            id, nickname, avatar_url, birthday, city, bio,
            user_photos(photo_url, sort_order),
            user_hobby_items(category_id, item_name)
          ''')
          .neq('id', currentUserId);

      // 3. 应用筛选条件
      if (settings.targetGender != 'all') {
        query = query.eq('gender', settings.targetGender);
      }

      if (settings.locationType == 'same_city' && settings.city != null && settings.city!.isNotEmpty) {
        query = query.eq('city', settings.city!);
      }

      // 4. 获取用户列表
      final response = await query
          .order('last_active_at', ascending: false)
          .range(page * pageSize, (page + 1) * pageSize - 1);

      // 5. 计算匹配值并过滤
      final users = <MatchUser>[];

      for (final userData in response as List) {
        final userId = userData['id'] as String;

        // 跳过已匹配的用户
        final alreadyMatched = await _checkAlreadyMatched(
          currentUserId,
          userId,
        );
        if (alreadyMatched) continue;

        // 计算匹配值
        final matchResult = _calculateMatchScore(
          myHobbies,
          userData['user_hobby_items'] as List<dynamic>? ?? [],
        );

        // 过滤低于阈值的
        if (matchResult.score < settings.minMatchScore) continue;

        // 年龄计算
        final birthday = userData['birthday'] != null
            ? DateTime.parse(userData['birthday'])
            : null;
        final age = birthday != null
            ? DateTime.now().difference(birthday).inDays ~/ 365
            : 25;

        // 年龄筛选
        if (age < settings.minAge || age > settings.maxAge) continue;

        // 获取照片
        final photosData = userData['user_photos'] as List<dynamic>? ?? [];
        final photos = photosData
            .map((p) => p['photo_url'] as String)
            .where((url) => url.isNotEmpty)
            .toList();

        // 如果没有照片，使用默认占位图
        if (photos.isEmpty) {
          photos.add('https://via.placeholder.com/400x600');
        }

        users.add(MatchUser(
          id: userId,
          nickname: userData['nickname'] ?? '匿名用户',
          avatarUrl: userData['avatar_url'],
          age: age,
          city: userData['city'] ?? '未知',
          bio: userData['bio'],
          matchScore: matchResult.score,
          commonHobbies: matchResult.commonItems.take(3).toList(),
          photos: photos,
          lastActiveAt: userData['last_active_at'] != null
              ? DateTime.parse(userData['last_active_at'])
              : null,
        ));
      }

      // 按匹配值排序
      users.sort((a, b) => b.matchScore.compareTo(a.matchScore));

      return users;
    } catch (e) {
      print('Find matches error: $e');
      // 返回模拟数据用于测试
      return _getMockMatchUsers();
    }
  }

  /// 计算匹配值
  MatchResult _calculateMatchScore(
    List<Map<String, dynamic>> myHobbies,
    List<dynamic> theirHobbies,
  ) {
    int score = 0;
    final commonItems = <String>[];
    final matchedCategories = <String, List<String>>{};

    for (final myHobby in myHobbies) {
      final myCategory = myHobby['category_id'] as String;
      final myItem = (myHobby['item_name'] as String).toLowerCase();

      for (final theirHobby in theirHobbies) {
        final theirCategory = theirHobby['category_id'] as String;
        final theirItem = (theirHobby['item_name'] as String).toLowerCase();

        // 同一分类且作品相同
        if (myCategory == theirCategory && myItem == theirItem) {
          score += 1;
          commonItems.add(myHobby['item_name']);

          matchedCategories.putIfAbsent(myCategory, () => []);
          matchedCategories[myCategory]!.add(myHobby['item_name']);
        }
      }
    }

    return MatchResult(
      userId: '',
      score: score,
      commonItems: commonItems,
      matchedCategories: matchedCategories,
    );
  }

  /// 获取用户爱好
  Future<List<Map<String, dynamic>>> _getUserHobbies(String userId) async {
    try {
      final response = await _client
          .from('user_hobby_items')
          .select()
          .eq('user_id', userId);
      return (response as List).cast<Map<String, dynamic>>();
    } catch (e) {
      return [];
    }
  }

  /// 检查是否已经匹配过
  Future<bool> _checkAlreadyMatched(String userId1, String userId2) async {
    try {
      final response = await _client
          .from('matches')
          .select()
          .or('and(user_id_1.eq.$userId1,user_id_2.eq.$userId2),and(user_id_1.eq.$userId2,user_id_2.eq.$userId1)')
          .maybeSingle();
      return response != null;
    } catch (e) {
      return false;
    }
  }

  /// 处理滑动操作
  Future<void> handleSwipe({
    required String currentUserId,
    required String targetUserId,
    required SwipeDirection direction,
  }) async {
    final isLike = direction == SwipeDirection.right ||
                   direction == SwipeDirection.up;

    // 1. 保存匹配记录
    await _client.from('matches').insert({
      'user_id_1': currentUserId,
      'user_id_2': targetUserId,
      'status': isLike ? 'liked' : 'rejected',
      'is_super_like': direction == SwipeDirection.up,
    });

    // 2. 如果是喜欢，检查是否互赞
    if (isLike) {
      final mutualLike = await _checkMutualLike(currentUserId, targetUserId);
      if (mutualLike) {
        // 更新双方记录为已匹配
        await _client
            .from('matches')
            .update({'status': 'matched'})
            .or('and(user_id_1.eq.$currentUserId,user_id_2.eq.$targetUserId),and(user_id_1.eq.$targetUserId,user_id_2.eq.$currentUserId)');

        // TODO: 发送匹配成功通知
      }
    }
  }

  /// 检查是否互赞
  Future<bool> _checkMutualLike(String userId1, String userId2) async {
    try {
      final response = await _client
          .from('matches')
          .select()
          .eq('user_id_1', userId2)
          .eq('user_id_2', userId1)
          .eq('status', 'liked')
          .maybeSingle();
      return response != null;
    } catch (e) {
      return false;
    }
  }

  /// 获取匹配设置
  Future<MatchSettings> getMatchSettings(String userId) async {
    try {
      final response = await _client
          .from('match_settings')
          .select()
          .eq('user_id', userId)
          .maybeSingle();

      if (response != null) {
        return MatchSettings.fromJson(response);
      }
    } catch (e) {
      print('Get match settings error: $e');
    }

    return MatchSettings.defaultSettings();
  }

  /// 更新匹配设置
  Future<void> updateMatchSettings({
    required String userId,
    required MatchSettings settings,
  }) async {
    await _client.from('match_settings').upsert({
      'user_id': userId,
      'min_match_score': settings.minMatchScore,
      'target_gender': settings.targetGender,
      'min_age': settings.minAge,
      'max_age': settings.maxAge,
      'location_type': settings.locationType,
      'city': settings.city,
    });
  }

  /// 模拟匹配用户数据（用于测试）
  List<MatchUser> _getMockMatchUsers() {
    return [
      MatchUser(
        id: 'user1',
        nickname: '小雨',
        age: 24,
        city: '北京',
        matchScore: 5,
        commonHobbies: ['三体', '周杰伦', '原神'],
        photos: [
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=400',
          'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=400',
        ],
      ),
      MatchUser(
        id: 'user2',
        nickname: '阿杰',
        age: 26,
        city: '上海',
        matchScore: 3,
        commonHobbies: ['星际穿越', '陈奕迅'],
        photos: [
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400',
        ],
      ),
      MatchUser(
        id: 'user3',
        nickname: '思琪',
        age: 23,
        city: '广州',
        matchScore: 7,
        commonHobbies: ['Taylor Swift', '老友记', '美食'],
        photos: [
          'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=400',
          'https://images.unsplash.com/photo-1523264939339-c89f9dadde2e?w=400',
          'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=400',
        ],
      ),
    ];
  }
}
