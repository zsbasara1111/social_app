import 'package:freezed_annotation/freezed_annotation.dart';

part 'heart_models.freezed.dart';
part 'heart_models.g.dart';

/// 红心记录模型
@freezed
class HeartRecord with _$HeartRecord {
  const factory HeartRecord({
    required String id,
    required String senderId,
    required String receiverId,
    @Default(false) bool isMutual,
    DateTime? mutualAt,
    DateTime? createdAt,
  }) = _HeartRecord;

  factory HeartRecord.fromJson(Map<String, dynamic> json) =>
      _$HeartRecordFromJson(json);
}

/// 红心状态
enum HeartStatus {
  none,       // 无关系
  sent,       // 已发送红心
  received,   // 收到红心
  mutual,     // 互点红心
}

/// 红心状态模型
@freezed
class HeartState with _$HeartState {
  const factory HeartState({
    @Default(HeartStatus.none) HeartStatus status,
    HeartRecord? record,
    @Default(false) bool isLoading,
    String? error,
  }) = _HeartState;

  factory HeartState.initial() => const HeartState();
}

/// 约会邀请模型
@freezed
class DateInvitation with _$DateInvitation {
  const factory DateInvitation({
    required String id,
    required String senderId,
    required String receiverId,
    @Default('pending') String status, // pending, accepted, declined
    String? message,
    DateTime? proposedTime,
    String? location,
    DateTime? createdAt,
    DateTime? respondedAt,
  }) = _DateInvitation;

  factory DateInvitation.fromJson(Map<String, dynamic> json) =>
      _$DateInvitationFromJson(json);
}

/// 约会邀请状态
enum InvitationStatus {
  pending,    // 待回复
  accepted,   // 已接受
  declined,   // 已拒绝
}

/// 红心用户显示信息
@freezed
class HeartUserInfo with _$HeartUserInfo {
  const factory HeartUserInfo({
    required String userId,
    required String nickname,
    String? avatarUrl,
    @Default(false) bool hasHeart, // 是否已发送红心
    @Default(false) bool isMutual, // 是否互点
  }) = _HeartUserInfo;

  factory HeartUserInfo.fromJson(Map<String, dynamic> json) =>
      _$HeartUserInfoFromJson(json);
}
