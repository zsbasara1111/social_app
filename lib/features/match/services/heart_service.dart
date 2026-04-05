import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/heart_models.dart';

// 红心服务Provider
final heartServiceProvider = Provider<HeartService>((ref) {
  return HeartService();
});

class HeartService {
  /// 发送红心
  Future<HeartRecord?> sendHeart({
    required String senderId,
    required String receiverId,
  }) async {
    try {
      // 模拟网络延迟
      await Future.delayed(const Duration(milliseconds: 500));

      // 检查是否已发送
      final existing = await _getHeartRecord(senderId, receiverId);
      if (existing != null) {
        return existing;
      }

      // 检查对方是否已发送（互点）
      final reverseRecord = await _getHeartRecord(receiverId, senderId);
      final isMutual = reverseRecord != null;

      // 创建红心记录
      final record = HeartRecord(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        senderId: senderId,
        receiverId: receiverId,
        isMutual: isMutual,
        mutualAt: isMutual ? DateTime.now() : null,
        createdAt: DateTime.now(),
      );

      // 如果是互点，更新对方的记录
      if (isMutual) {
        // TODO: 更新数据库中的记录为互点状态
        // 发送匹配成功通知
      }

      return record;
    } catch (e) {
      print('Send heart error: $e');
      return null;
    }
  }

  /// 取消红心
  Future<bool> cancelHeart({
    required String senderId,
    required String receiverId,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      // TODO: 从数据库删除记录
      return true;
    } catch (e) {
      print('Cancel heart error: $e');
      return false;
    }
  }

  /// 获取红心状态
  Future<HeartStatus> getHeartStatus({
    required String userId,
    required String targetUserId,
  }) async {
    try {
      // 检查我是否发送了红心
      final sent = await _getHeartRecord(userId, targetUserId);
      if (sent != null) {
        if (sent.isMutual) {
          return HeartStatus.mutual;
        }
        return HeartStatus.sent;
      }

      // 检查对方是否发送了红心
      final received = await _getHeartRecord(targetUserId, userId);
      if (received != null) {
        return HeartStatus.received;
      }

      return HeartStatus.none;
    } catch (e) {
      print('Get heart status error: $e');
      return HeartStatus.none;
    }
  }

  /// 获取红心记录
  Future<HeartRecord?> _getHeartRecord(String senderId, String receiverId) async {
    // TODO: 从数据库查询
    // 模拟数据：假设某些组合已有记录
    return null;
  }

  /// 获取我发送的红心列表
  Future<List<HeartUserInfo>> getSentHearts(String userId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    // 返回模拟数据
    return [];
  }

  /// 获取我收到的红心列表
  Future<List<HeartUserInfo>> getReceivedHearts(String userId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    // 返回模拟数据
    return [];
  }

  /// 获取互点列表
  Future<List<HeartUserInfo>> getMutualHearts(String userId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    // 返回模拟数据
    return [
      HeartUserInfo(
        userId: 'user1',
        nickname: '小雨',
        avatarUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100',
        hasHeart: true,
        isMutual: true,
      ),
    ];
  }

  // ==================== 约会邀请 ====================

  /// 发送约会邀请
  Future<DateInvitation?> sendDateInvitation({
    required String senderId,
    required String receiverId,
    String? message,
    DateTime? proposedTime,
    String? location,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));

      // 检查是否已互点
      final status = await getHeartStatus(
        userId: senderId,
        targetUserId: receiverId,
      );

      if (status != HeartStatus.mutual) {
        throw Exception('只有互点用户才能发送约会邀请');
      }

      final invitation = DateInvitation(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        senderId: senderId,
        receiverId: receiverId,
        message: message,
        proposedTime: proposedTime,
        location: location,
        createdAt: DateTime.now(),
      );

      return invitation;
    } catch (e) {
      print('Send date invitation error: $e');
      return null;
    }
  }

  /// 回复约会邀请
  Future<bool> respondToInvitation({
    required String invitationId,
    required bool accept,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      // TODO: 更新数据库中的邀请状态
      return true;
    } catch (e) {
      print('Respond to invitation error: $e');
      return false;
    }
  }

  /// 获取待处理的约会邀请
  Future<List<DateInvitation>> getPendingInvitations(String userId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [];
  }
}
