import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_theme.dart';
import '../services/ai_topic_service.dart';
import '../widgets/ai_assistant_button.dart';
import '../widgets/topic_suggestion_card.dart';

class ChatDetailScreen extends ConsumerStatefulWidget {
  final String userId;

  const ChatDetailScreen({
    super.key,
    required this.userId,
  });

  @override
  ConsumerState<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends ConsumerState<ChatDetailScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isGeneratingTopic = false;
  String? _currentTopic;
  bool _showTopicCard = false;

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _generateTopic() async {
    setState(() {
      _isGeneratingTopic = true;
      _showTopicCard = false;
    });

    final service = ref.read(aiTopicServiceProvider);

    // 模拟共同爱好数据
    final response = await service.generateTopic(
      userAName: '我',
      userBName: '对方',
      userAHobbies: ['三体', '周杰伦', '原神'],
      userBHobbies: ['三体', '陈奕迅', '美食'],
      commonHobbies: ['三体'],
    );

    setState(() {
      _isGeneratingTopic = false;
      if (response.success) {
        _currentTopic = response.topic;
        _showTopicCard = true;
      }
    });
  }

  void _useTopic(String topic) {
    setState(() {
      _messageController.text = topic;
      _showTopicCard = false;
    });
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    // TODO: 实现发送消息逻辑
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 16.r,
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, size: 20.w, color: Colors.grey[600]),
            ),
            SizedBox(width: 12.w),
            const Text('用户名'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // TODO: 显示更多选项
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // 话题建议卡片
          if (_showTopicCard && _currentTopic != null)
            TopicSuggestionCard(
              topic: _currentTopic!,
              onUse: () => _useTopic(_currentTopic!),
              onRefresh: _generateTopic,
              isLoading: _isGeneratingTopic,
            ),

          // 聊天记录区域
          Expanded(
            child: Center(
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
                    '开始聊天吧',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppTheme.textSecondary,
                        ),
                  ),
                  SizedBox(height: 24.h),
                  AIAssistantButton(
                    onTap: _generateTopic,
                    isLoading: _isGeneratingTopic,
                  ),
                ],
              ),
            ),
          ),

          // 输入框区域
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: SafeArea(
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: () {
                      // TODO: 显示附件选项
                    },
                  ),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: '输入消息...',
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24.r),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                      ),
                      maxLines: null,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  IconButton(
                    icon: Icon(
                      Icons.send,
                      color: AppTheme.primaryColor,
                    ),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
