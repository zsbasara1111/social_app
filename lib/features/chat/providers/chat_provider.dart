import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/supabase_service.dart';
import '../models/chat_models.dart';

/// 聊天服务Provider
final chatServiceProvider = Provider<ChatService>((ref) => ChatService());

/// 会话列表Provider
final conversationsProvider =
    StateNotifierProvider<ConversationNotifier, ConversationState>(
  (ref) => ConversationNotifier(ref.read(chatServiceProvider)),
);

/// 聊天消息Provider（针对特定用户）
final chatMessagesProvider = StateNotifierProvider.family<
    ChatMessagesNotifier, ChatState, String>(
  (ref, otherUserId) => ChatMessagesNotifier(
    ref.read(chatServiceProvider),
    otherUserId,
  ),
);

/// 会话列表Notifier
class ConversationNotifier extends StateNotifier<ConversationState> {
  final ChatService _service;

  ConversationNotifier(this._service) : super(ConversationState.initial()) {
    loadConversations();
  }

  Future<void> loadConversations() async {
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

      final conversations = await _service.getConversations(userId);
      state = state.copyWith(
        conversations: conversations,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}

/// 聊天消息Notifier
class ChatMessagesNotifier extends StateNotifier<ChatState> {
  final ChatService _service;
  final String _otherUserId;

  ChatMessagesNotifier(this._service, this._otherUserId)
      : super(ChatState.initial()) {
    loadMessages();
  }

  Future<void> loadMessages() async {
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

      final messages = await _service.getMessages(
        userId: userId,
        otherUserId: _otherUserId,
      );

      state = state.copyWith(
        messages: messages,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> sendMessage(String content) async {
    if (content.trim().isEmpty) return;

    state = state.copyWith(isSending: true, error: null);

    try {
      final userId = SupabaseService.currentUserId;
      if (userId == null) {
        state = state.copyWith(
          isSending: false,
          error: '用户未登录',
        );
        return;
      }

      final message = await _service.sendMessage(
        senderId: userId,
        receiverId: _otherUserId,
        content: content,
      );

      if (message != null) {
        state = state.copyWith(
          messages: [...state.messages, message],
          isSending: false,
        );
      } else {
        state = state.copyWith(
          isSending: false,
          error: '发送失败',
        );
      }
    } catch (e) {
      state = state.copyWith(
        isSending: false,
        error: e.toString(),
      );
    }
  }

  Future<void> sendInvitation(ChatInvitation invitation) async {
    state = state.copyWith(isSending: true, error: null);

    try {
      final userId = SupabaseService.currentUserId;
      if (userId == null) {
        state = state.copyWith(
          isSending: false,
          error: '用户未登录',
        );
        return;
      }

      final message = await _service.sendInvitationMessage(
        senderId: userId,
        receiverId: _otherUserId,
        invitation: invitation,
      );

      if (message != null) {
        state = state.copyWith(
          messages: [...state.messages, message],
          isSending: false,
        );
      } else {
        state = state.copyWith(
          isSending: false,
          error: '发送失败',
        );
      }
    } catch (e) {
      state = state.copyWith(
        isSending: false,
        error: e.toString(),
      );
    }
  }
}

/// 聊天服务类
class ChatService {
  /// 获取会话列表
  Future<List<ChatConversation>> getConversations(String userId) async {
    await Future.delayed(const Duration(milliseconds: 500));

    // 模拟数据
    return [
      ChatConversation(
        id: '1',
        otherUserId: 'user1',
        otherUserNickname: '小雨',
        otherUserAvatar:
            'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100',
        lastMessage: '周末有空一起喝咖啡吗？',
        lastMessageTime: DateTime.now().subtract(const Duration(minutes: 5)),
        unreadCount: 2,
        hasMutualHeart: true,
      ),
      ChatConversation(
        id: '2',
        otherUserId: 'user2',
        otherUserNickname: '阿杰',
        otherUserAvatar:
            'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100',
        lastMessage: '我也很喜欢摄影！',
        lastMessageTime: DateTime.now().subtract(const Duration(hours: 2)),
        unreadCount: 0,
        hasMutualHeart: true,
      ),
      ChatConversation(
        id: '3',
        otherUserId: 'user3',
        otherUserNickname: '琳娜',
        otherUserAvatar:
            'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100',
        lastMessage: '好的，谢谢！',
        lastMessageTime: DateTime.now().subtract(const Duration(days: 1)),
        unreadCount: 0,
        hasMutualHeart: false,
      ),
    ];
  }

  /// 获取聊天记录
  Future<List<ChatMessage>> getMessages({
    required String userId,
    required String otherUserId,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));

    // 模拟数据
    return [
      ChatMessage(
        id: '1',
        senderId: otherUserId,
        receiverId: userId,
        content: '你好呀，看到我们有共同的爱好~',
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        isRead: true,
        type: 'text',
      ),
      ChatMessage(
        id: '2',
        senderId: userId,
        receiverId: otherUserId,
        content: '是啊，你发的摄影作品很棒！',
        createdAt: DateTime.now().subtract(const Duration(days: 2, hours: 23)),
        isRead: true,
        type: 'text',
      ),
      ChatMessage(
        id: '3',
        senderId: otherUserId,
        receiverId: userId,
        content: '谢谢！我也很喜欢你的风格。周末有空一起出去拍照吗？',
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
        isRead: true,
        type: 'text',
      ),
    ];
  }

  /// 发送消息
  Future<ChatMessage?> sendMessage({
    required String senderId,
    required String receiverId,
    required String content,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));

    return ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: senderId,
      receiverId: receiverId,
      content: content,
      createdAt: DateTime.now(),
      isRead: false,
      type: 'text',
    );
  }

  /// 发送邀请消息
  Future<ChatMessage?> sendInvitationMessage({
    required String senderId,
    required String receiverId,
    required ChatInvitation invitation,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));

    return ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: senderId,
      receiverId: receiverId,
      content: '发送了一个约会邀请',
      createdAt: DateTime.now(),
      isRead: false,
      type: 'invitation',
      invitation: invitation,
    );
  }
}
