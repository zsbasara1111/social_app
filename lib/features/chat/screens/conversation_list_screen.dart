import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../models/chat_models.dart';
import '../providers/chat_provider.dart';
import 'chat_screen.dart';

class ConversationListScreen extends ConsumerStatefulWidget {
  const ConversationListScreen({super.key});

  @override
  ConsumerState<ConversationListScreen> createState() =>
      _ConversationListScreenState();
}

class _ConversationListScreenState
    extends ConsumerState<ConversationListScreen> {
  @override
  Widget build(BuildContext context) {
    final conversationState = ref.watch(conversationsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('消息'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: 搜索功能
            },
          ),
        ],
      ),
      body: conversationState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : conversationState.conversations.isEmpty
              ? _buildEmptyView()
              : RefreshIndicator(
                  onRefresh: () async {
                    await ref
                        .read(conversationsProvider.notifier)
                        .loadConversations();
                  },
                  color: AppTheme.primaryColor,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    itemCount: conversationState.conversations.length,
                    separatorBuilder: (context, index) => Divider(
                      height: 1.h,
                      indent: 80.w,
                    ),
                    itemBuilder: (context, index) {
                      final conversation = conversationState.conversations[index];
                      return _buildConversationItem(conversation);
                    },
                  ),
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
            size: 80.w,
            color: AppTheme.textLight,
          ),
          SizedBox(height: 16.h),
          Text(
            '暂无消息',
            style: TextStyle(
              fontSize: 16.sp,
              color: AppTheme.textSecondary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '去匹配页找找有缘人吧~',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppTheme.textLight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConversationItem(ChatConversation conversation) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              otherUserId: conversation.otherUserId,
              otherUserNickname: conversation.otherUserNickname,
              otherUserAvatar: conversation.otherUserAvatar,
              hasMutualHeart: conversation.hasMutualHeart,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          children: [
            // 头像
            Stack(
              children: [
                Container(
                  width: 56.w,
                  height: 56.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: conversation.otherUserAvatar != null
                        ? DecorationImage(
                            image: CachedNetworkImageProvider(
                              conversation.otherUserAvatar!,
                            ),
                            fit: BoxFit.cover,
                          )
                        : null,
                    color: conversation.otherUserAvatar == null
                        ? Colors.grey[200]
                        : null,
                  ),
                  child: conversation.otherUserAvatar == null
                      ? Icon(
                          Icons.person,
                          color: AppTheme.textLight,
                          size: 28.w,
                        )
                      : null,
                ),
                // 互点标记
                if (conversation.hasMutualHeart)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 20.w,
                      height: 20.w,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 12.w,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(width: 12.w),

            // 内容
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          conversation.otherUserNickname,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                      ),
                      if (conversation.lastMessageTime != null)
                        Text(
                          _formatTime(conversation.lastMessageTime!),
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppTheme.textLight,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          conversation.lastMessage ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: conversation.unreadCount > 0
                                ? AppTheme.textPrimary
                                : AppTheme.textSecondary,
                            fontWeight: conversation.unreadCount > 0
                                ? FontWeight.w500
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                      if (conversation.unreadCount > 0) ...[
                        SizedBox(width: 8.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Text(
                            conversation.unreadCount > 99
                                ? '99+'
                                : conversation.unreadCount.toString(),
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final messageDay = DateTime(time.year, time.month, time.day);

    if (messageDay == today) {
      return DateFormat('HH:mm').format(time);
    } else if (messageDay == today.subtract(const Duration(days: 1))) {
      return '昨天';
    } else if (now.difference(time).inDays < 7) {
      final weekdays = ['周一', '周二', '周三', '周四', '周五', '周六', '周日'];
      return weekdays[time.weekday - 1];
    } else {
      return DateFormat('MM/dd').format(time);
    }
  }
}
