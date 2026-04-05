import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatDetailScreen extends ConsumerWidget {
  final String userId;

  const ChatDetailScreen({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('聊天'),
      ),
      body: Center(
        child: Text('Chat with user: $userId'),
      ),
    );
  }
}
