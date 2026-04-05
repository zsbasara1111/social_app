import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/supabase_service.dart';
import '../models/heart_models.dart';
import '../services/heart_service.dart';

// 红心服务Provider
final heartServiceProvider = Provider<HeartService>((ref) => HeartService());

// 红心状态Provider（针对特定用户）
final heartStatusProvider =
    FutureProvider.family<HeartStatus, String>((ref, targetUserId) async {
  final service = ref.read(heartServiceProvider);
  final userId = SupabaseService.currentUserId;
  if (userId == null) return HeartStatus.none;

  return service.getHeartStatus(
    userId: userId,
    targetUserId: targetUserId,
  );
});

// 红心状态Notifier
final heartStateProvider =
    StateNotifierProvider.family<HeartStateNotifier, HeartState, String>(
  (ref, targetUserId) => HeartStateNotifier(
    ref.read(heartServiceProvider),
    targetUserId,
  ),
);

class HeartStateNotifier extends StateNotifier<HeartState> {
  final HeartService _service;
  final String _targetUserId;

  HeartStateNotifier(this._service, this._targetUserId)
      : super(HeartState.initial()) {
    _loadHeartStatus();
  }

  Future<void> _loadHeartStatus() async {
    final userId = SupabaseService.currentUserId;
    if (userId == null) return;

    final status = await _service.getHeartStatus(
      userId: userId,
      targetUserId: _targetUserId,
    );

    state = state.copyWith(status: status);
  }

  Future<void> sendHeart() async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true, error: null);

    try {
      final userId = SupabaseService.currentUserId;
      if (userId == null) {
        state = state.copyWith(
          isLoading: false,
          error: '用户未登录',
        );
        return;
      }

      final record = await _service.sendHeart(
        senderId: userId,
        receiverId: _targetUserId,
      );

      if (record != null) {
        state = state.copyWith(
          status: record.isMutual ? HeartStatus.mutual : HeartStatus.sent,
          record: record,
          isLoading: false,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          error: '发送失败',
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> cancelHeart() async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true, error: null);

    try {
      final userId = SupabaseService.currentUserId;
      if (userId == null) {
        state = state.copyWith(
          isLoading: false,
          error: '用户未登录',
        );
        return;
      }

      final success = await _service.cancelHeart(
        senderId: userId,
        receiverId: _targetUserId,
      );

      if (success) {
        state = state.copyWith(
          status: HeartStatus.none,
          record: null,
          isLoading: false,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          error: '取消失败',
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  bool get canSendDateInvitation => state.status == HeartStatus.mutual;
}

// 互点用户列表Provider
final mutualHeartsProvider = FutureProvider<List<HeartUserInfo>>((ref) async {
  final service = ref.read(heartServiceProvider);
  final userId = SupabaseService.currentUserId;
  if (userId == null) return [];

  return service.getMutualHearts(userId);
});

// 约会邀请状态Provider
final dateInvitationProvider =
    FutureProvider.family<DateInvitation?, String>((ref, targetUserId) async {
  // TODO: 从后端获取现有的约会邀请
  return null;
});
