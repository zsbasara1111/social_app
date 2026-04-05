import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';

class ChatListScreen extends ConsumerWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('消息'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Search chats
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 0, // TODO: Load from provider
        itemBuilder: (context, index) {
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Start new chat
        },
        icon: const Icon(Icons.person_add),
        label: const Text('新聊天'),
        backgroundColor: AppTheme.primaryColor,
      ),
    );
  }
}
