import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/supabase_service.dart';
import '../models/hobby_models.dart';

final hobbyServiceProvider = Provider<HobbyService>((ref) {
  return HobbyService();
});

class HobbyService {
  final SupabaseClient _client = SupabaseService.client;

  /// 获取所有爱好分类
  Future<List<HobbyCategory>> getCategories() async {
    try {
      final response = await _client
          .from('hobby_categories')
          .select()
          .order('is_preset', ascending: false)
          .order('name');

      return (response as List)
          .map((json) => HobbyCategory.fromJson(json))
          .toList();
    } catch (e) {
      // 如果数据库查询失败，返回预设分类
      return PresetHobbies.categories
          .map((name) => HobbyCategory(
                id: name,
                name: name,
                isPreset: true,
                isCustom: false,
              ))
          .toList();
    }
  }

  /// 获取用户的爱好作品
  Future<List<UserHobbyItem>> getUserHobbies(String userId) async {
    try {
      final response = await _client
          .from('user_hobby_items')
          .select('*, category:hobby_categories(name)')
          .eq('user_id', userId);

      return (response as List).map((json) {
        final categoryName = json['category']?['name'] as String?;
        return UserHobbyItem.fromJson({
          ...json,
          'category_name': categoryName,
        });
      }).toList();
    } catch (e) {
      return [];
    }
  }

  /// 添加用户爱好作品
  Future<UserHobbyItem> addUserHobby({
    required String userId,
    required String categoryId,
    required String itemName,
  }) async {
    final response = await _client
        .from('user_hobby_items')
        .insert({
          'user_id': userId,
          'category_id': categoryId,
          'item_name': itemName,
        })
        .select()
        .single();

    return UserHobbyItem.fromJson(response);
  }

  /// 批量添加用户爱好
  Future<void> addUserHobbies({
    required String userId,
    required Map<String, List<String>> hobbies,
  }) async {
    final items = <Map<String, dynamic>>[];

    for (final entry in hobbies.entries) {
      final categoryId = entry.key;
      final itemNames = entry.value;

      for (final itemName in itemNames) {
        items.add({
          'user_id': userId,
          'category_id': categoryId,
          'item_name': itemName,
        });
      }
    }

    if (items.isNotEmpty) {
      await _client.from('user_hobby_items').insert(items);
    }
  }

  /// 删除用户爱好
  Future<void> deleteUserHobby(String hobbyId) async {
    await _client.from('user_hobby_items').delete().eq('id', hobbyId);
  }

  /// 创建自定义分类
  Future<HobbyCategory> createCustomCategory({
    required String name,
    String? icon,
  }) async {
    final response = await _client
        .from('hobby_categories')
        .insert({
          'name': name,
          'icon': icon,
          'is_custom': true,
          'is_preset': false,
        })
        .select()
        .single();

    return HobbyCategory.fromJson(response);
  }

  /// 获取某个分类的热门作品
  List<String> getPopularItems(String categoryName) {
    return PresetHobbies.popularItems[categoryName] ?? [];
  }

  /// 搜索作品（支持模糊搜索）
  Future<List<String>> searchItems({
    required String categoryId,
    required String query,
  }) async {
    // TODO: 实现后端搜索API
    // 暂时返回预设数据中的匹配项
    final category = await _getCategoryById(categoryId);
    if (category == null) return [];

    final items = PresetHobbies.popularItems[category.name] ?? [];
    return items
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Future<HobbyCategory?> _getCategoryById(String id) async {
    try {
      final response = await _client
          .from('hobby_categories')
          .select()
          .eq('id', id)
          .single();
      return HobbyCategory.fromJson(response);
    } catch (e) {
      // 如果是预设分类，直接返回
      if (PresetHobbies.categories.contains(id)) {
        return HobbyCategory(
          id: id,
          name: id,
          isPreset: true,
          isCustom: false,
        );
      }
      return null;
    }
  }
}
