import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/post_models.dart';

// 动态服务Provider
final feedServiceProvider = Provider<FeedService>((ref) {
  return FeedService();
});

class FeedService {
  /// 获取动态列表
  Future<List<Post>> getPosts({
    required PostCategory category,
    int page = 0,
    int pageSize = 20,
  }) async {
    // 模拟数据
    await Future.delayed(const Duration(seconds: 1));

    return _getMockPosts(category);
  }

  /// 创建动态
  Future<Post> createPost(CreatePostRequest request) async {
    // 模拟创建
    await Future.delayed(const Duration(seconds: 1));

    return Post(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: 'current_user',
      content: request.content,
      images: request.images,
      location: request.location,
      visibility: request.visibility,
      createdAt: DateTime.now(),
      userNickname: '我',
    );
  }

  /// 点赞动态
  Future<void> likePost(String postId) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  /// 取消点赞
  Future<void> unlikePost(String postId) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  /// 添加评论
  Future<Comment> addComment({
    required String postId,
    required String content,
    String? parentId,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));

    return Comment(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      postId: postId,
      userId: 'current_user',
      content: content,
      parentId: parentId,
      createdAt: DateTime.now(),
      userNickname: '我',
    );
  }

  /// 获取评论列表
  Future<List<Comment>> getComments(String postId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [];
  }

  /// 删除动态
  Future<void> deletePost(String postId) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  /// 模拟动态数据
  List<Post> _getMockPosts(PostCategory category) {
    final categoryNames = {
      PostCategory.sameCity: '同城',
      PostCategory.friends: '好友',
      PostCategory.recommended: '推荐',
    };

    return [
      Post(
        id: 'post1',
        userId: 'user1',
        userNickname: '小雨',
        userAvatar: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100',
        content: '今天天气真好，去公园散步了～🌸 #${categoryNames[category]}',
        images: [
          'https://images.unsplash.com/photo-1490750967868-88aa4486c946?w=400',
        ],
        location: '北京市',
        likeCount: 24,
        commentCount: 5,
        isLiked: false,
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      Post(
        id: 'post2',
        userId: 'user2',
        userNickname: '阿杰',
        userAvatar: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100',
        content: '刚看完《星际穿越》，太震撼了！诺兰真的是神 🎬\n\n"不要温和地走进那个良夜"',
        images: [
          'https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=400',
          'https://images.unsplash.com/photo-1440404653325-ab127d49abc1?w=400',
        ],
        location: '上海市',
        likeCount: 56,
        commentCount: 12,
        isLiked: true,
        createdAt: DateTime.now().subtract(const Duration(hours: 5)),
      ),
      Post(
        id: 'post3',
        userId: 'user3',
        userNickname: '思琪',
        userAvatar: 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=100',
        content: '周末在家做烘焙，第一次做戚风蛋糕就成功了！🍰\n\n配方：\n- 鸡蛋 5个\n- 低筋面粉 85g\n- 牛奶 50ml\n- 细砂糖 60g',
        images: [
          'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=400',
          'https://images.unsplash.com/photo-1565958011703-44f9829ba187?w=400',
          'https://images.unsplash.com/photo-1571115177098-24ec42ed204d?w=400',
        ],
        likeCount: 128,
        commentCount: 23,
        isLiked: false,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ];
  }
}
