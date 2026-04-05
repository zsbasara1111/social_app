import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_models.freezed.dart';
part 'chat_models.g.dart';

/// 聊天消息模型
@freezed
class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String id,
    required String senderId,
    required String receiverId,
    required String content,
    required DateTime createdAt,
    @Default(false) bool isRead,
    DateTime? readAt,
    String? type, // text, image, invitation
    ChatInvitation? invitation,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
}

/// 聊天会话模型
@freezed
class ChatConversation with _$ChatConversation {
  const factory ChatConversation({
    required String id,
    required String otherUserId,
    required String otherUserNickname,
    String? otherUserAvatar,
    String? lastMessage,
    DateTime? lastMessageTime,
    @Default(0) int unreadCount,
    @Default(false) bool hasMutualHeart,
  }) = _ChatConversation;

  factory ChatConversation.fromJson(Map<String, dynamic> json) =>
      _$ChatConversationFromJson(json);
}

/// 聊天邀请（约会邀请）
@freezed
class ChatInvitation with _$ChatInvitation {
  const factory ChatInvitation({
    required String id,
    required String senderId,
    required String receiverId,
    @Default('pending') String status, // pending, accepted, declined
    String? message,
    DateTime? proposedTime,
    String? location,
    DateTime? createdAt,
    DateTime? respondedAt,
  }) = _ChatInvitation;

  factory ChatInvitation.fromJson(Map<String, dynamic> json) =>
      _$ChatInvitationFromJson(json);
}

/// 聊天状态
@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    @Default([]) List<ChatMessage> messages,
    @Default(false) bool isLoading,
    @Default(false) bool isSending,
    String? error,
    @Default(false) bool hasMore,
  }) = _ChatState;

  factory ChatState.initial() => const ChatState();
}

/// 会话列表状态
@freezed
class ConversationState with _$ConversationState {
  const factory ConversationState({
    @Default([]) List<ChatConversation> conversations,
    @Default(false) bool isLoading,
    String? error,
  }) = _ConversationState;

  factory ConversationState.initial() => const ConversationState();
}
