import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/theme/app_theme.dart';
import '../../match/models/heart_models.dart';
import '../../match/providers/heart_provider.dart';
import '../../match/widgets/heart_button.dart';
import '../models/chat_models.dart';
import '../providers/chat_provider.dart';
import '../widgets/invitation_card.dart';

class ChatScreen extends ConsumerStatefulWidget {
  final String otherUserId;
  final String otherUserNickname;
  final String? otherUserAvatar;
  final bool hasMutualHeart;

  const ChatScreen({
    super.key,
    required this.otherUserId,
    required this.otherUserNickname,
    this.otherUserAvatar,
    this.hasMutualHeart = false,
  });

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final content = _messageController.text.trim();
    if (content.isEmpty) return;

    ref.read(chatMessagesProvider(widget.otherUserId).notifier).sendMessage(content);
    _messageController.clear();
    _scrollToBottom();
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _showDateInvitationSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DateInvitationSheet(
        targetUserId: widget.otherUserId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatMessagesProvider(widget.otherUserId));
    final heartState = ref.watch(heartStateProvider(widget.otherUserId));

    // 监听新消息自动滚动
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            if (widget.otherUserAvatar != null)
              Container(
                width: 36.w,
                height: 36.w,
                margin: EdgeInsets.only(right: 12.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(widget.otherUserAvatar!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.otherUserNickname,
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (heartState.status == HeartStatus.mutual)
                  Text(
                    '❤️ 互相关注',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ),
          ],
        ),
        actions: [
          HeartButton(
            targetUserId: widget.otherUserId,
            style: HeartButtonStyle.compact,
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: Column(
        children: [
          // 互点提示横幅
          if (heartState.status == HeartStatus.mutual)
            MutualHeartBanner(
              onSendInvitation: _showDateInvitationSheet,
            ),

          // 消息列表
          Expanded(
            child: chatState.isLoading && chatState.messages.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : chatState.messages.isEmpty
                    ? _buildEmptyView()
                    : ListView.builder(
                        controller: _scrollController,
                        padding: EdgeInsets.all(16.w),
                        itemCount: chatState.messages.length,
                        itemBuilder: (context, index) {
                          final message = chatState.messages[index];
                          final isMe = message.senderId != widget.otherUserId;
                          return _buildMessageItem(message, isMe);
                        },
                      ),
          ),

          // 输入框
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildEmptyView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.chat_bubble_outline,
            size: 64.w,
            color: AppTheme.textLight,
          ),
          SizedBox(height: 16.h),
          Text(
            '开始聊天吧',
            style: TextStyle(
              fontSize: 16.sp,
              color: AppTheme.textSecondary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '打个招呼，开启一段美好的缘分~',
            style: TextStyle(
              fontSize: 13.sp,
              color: AppTheme.textLight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageItem(ChatMessage message, bool isMe) {
    // 约会邀请消息
    if (message.type == 'invitation' && message.invitation != null) {
      return InvitationCard(
        invitation: message.invitation!,
        isSentByMe: isMe,
      );
    }

    // 普通文本消息
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(
          bottom: 12.h,
          left: isMe ? 64.w : 0,
          right: isMe ? 0 : 64.w,
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isMe ? AppTheme.primaryColor : Colors.grey[100],
          borderRadius: BorderRadius.circular(20.r).copyWith(
            bottomLeft: isMe ? const Radius.circular(20) : const Radius.circular(4),
            bottomRight: isMe ? const Radius.circular(4) : const Radius.circular(20),
          ),
        ),
        child: Text(
          message.content,
          style: TextStyle(
            fontSize: 15.sp,
            color: isMe ? Colors.white : AppTheme.textPrimary,
            height: 1.4,
          ),
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey[200]!),
        ),
      ),
      child: SafeArea(
        child: Row(
          children: [
            // 约会邀请按钮（仅在互点时显示）
            Consumer(
              builder: (context, ref, child) {
                final heartState = ref.watch(heartStateProvider(widget.otherUserId));
                if (heartState.status != HeartStatus.mutual) {
                  return const SizedBox.shrink();
                }
                return Container(
                  margin: EdgeInsets.only(right: 8.w),
                  child: Material(
                    color: Colors.red.withValues(alpha: 0.1),
                    shape: const CircleBorder(),
                    child: InkWell(
                      onTap: _showDateInvitationSheet,
                      customBorder: const CircleBorder(),
                      child: Container(
                        width: 40.w,
                        height: 40.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 20.w,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            // 输入框
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: '输入消息...',
                    hintStyle: TextStyle(
                      fontSize: 15.sp,
                      color: AppTheme.textLight,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                  maxLines: null,
                  textInputAction: TextInputAction.send,
                  onSubmitted: (_) => _sendMessage(),
                ),
              ),
            ),

            SizedBox(width: 8.w),

            // 发送按钮
            GestureDetector(
              onTap: _sendMessage,
              child: Container(
                width: 44.w,
                height: 44.w,
                decoration: BoxDecoration(
                  gradient: AppTheme.primaryGradient,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.send,
                  color: Colors.white,
                  size: 20.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
