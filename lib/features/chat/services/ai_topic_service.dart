import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/ai_topic_models.dart';

// AI话题服务Provider
final aiTopicServiceProvider = Provider<AITopicService>((ref) {
  return AITopicService();
});

class AITopicService {
  /// 生成话题（调用豆包API）
  Future<TopicGenerationResponse> generateTopic({
    required String userAName,
    required String userBName,
    required List<String> userAHobbies,
    required List<String> userBHobbies,
    required List<String> commonHobbies,
  }) async {
    try {
      // 模拟API调用延迟
      await Future.delayed(const Duration(seconds: 1));

      // 基于共同爱好生成话题
      final topic = _generateTopicFromHobbies(
        userAName: userAName,
        userBName: userBName,
        commonHobbies: commonHobbies,
        userAHobbies: userAHobbies,
        userBHobbies: userBHobbies,
      );

      return TopicGenerationResponse(
        topic: topic,
        explanation: '基于你们的共同爱好生成',
        success: true,
      );
    } catch (e) {
      return TopicGenerationResponse(
        topic: '',
        error: e.toString(),
        success: false,
      );
    }
  }

  /// 从爱好生成话题
  String _generateTopicFromHobbies({
    required String userAName,
    required String userBName,
    required List<String> commonHobbies,
    required List<String> userAHobbies,
    required List<String> userBHobbies,
  }) {
    if (commonHobbies.isEmpty) {
      return '你们都喜欢尝试新鲜事物，最近有什么有趣的发现吗？';
    }

    // 获取共同爱好的具体作品
    final commonItems = commonHobbies.take(2).toList();

    // 根据不同类型生成不同风格的话题
    final templates = [
      // 观点型
      '你们都喜欢${commonItems.join('、')}，${commonItems[0]}中最让你印象深刻的是哪一点？',
      // 体验型
      '看到你们都喜欢${commonItems.join('、')}，如果能亲自体验一次相关的场景，你最想去哪里？',
      // 假设型
      '假设你们可以一起${commonItems[0]}，你觉得会发生什么有趣的事情？',
      // 推荐型
      '既然你们都喜欢${commonItems[0]}，有没有特别想推荐给对方的作品？',
      // 深度型
      '${commonItems[0]}对你来说意味着什么？很好奇你的想法~',
      // 轻松型
      '偷偷问一下，${commonItems[0]}里你最喜欢的是哪个？',
    ];

    // 随机选择一个模板
    return templates[DateTime.now().millisecond % templates.length];
  }

  /// 生成深入话题的Prompt（用于真正的AI API调用）
  String buildPrompt({
    required String userAName,
    required String userBName,
    required Map<String, List<String>> userAHobbies,
    required Map<String, List<String>> userBHobbies,
    required Map<String, List<String>> commonHobbies,
  }) {
    final buffer = StringBuffer();

    buffer.writeln('【角色设定】');
    buffer.writeln('你是一个善于引导对话的社交助手，擅长根据两个人的共同爱好生成能引发深入讨论的话题。');
    buffer.writeln();

    buffer.writeln('【$userAName的爱好】');
    userAHobbies.forEach((category, items) {
      buffer.writeln('- $category：${items.join('、')}');
    });
    buffer.writeln();

    buffer.writeln('【$userBName的爱好】');
    userBHobbies.forEach((category, items) {
      buffer.writeln('- $category：${items.join('、')}');
    });
    buffer.writeln();

    buffer.writeln('【共同爱好】');
    commonHobbies.forEach((category, items) {
      buffer.writeln('- $category：${items.join('、')}');
    });
    buffer.writeln();

    buffer.writeln('【任务】');
    buffer.writeln('基于以上共同爱好，生成一个能引发深入讨论的开场话题。要求：');
    buffer.writeln('1. 不是简单提及作品名，而是提出一个有讨论空间的问题');
    buffer.writeln('2. 可以涉及具体情节、观点、体验、偏好等');
    buffer.writeln('3. 语气轻松友好，像朋友聊天');
    buffer.writeln('4. 控制在50字以内');
    buffer.writeln();

    buffer.writeln('【输出格式】');
    buffer.writeln('只输出话题内容，不要有多余解释。');

    return buffer.toString();
  }

  /// 获取话题历史
  Future<List<AITopic>> getTopicHistory(String chatId) async {
    // TODO: 从本地存储或后端获取
    return [];
  }

  /// 保存话题到历史
  Future<void> saveTopicToHistory(String chatId, AITopic topic) async {
    // TODO: 保存到本地存储或后端
  }

  /// 获取更多话题建议
  Future<List<String>> getMoreTopics({
    required List<String> commonHobbies,
    int count = 3,
  }) async {
    final topics = <String>[];

    for (var i = 0; i < count; i++) {
      final response = await generateTopic(
        userAName: 'UserA',
        userBName: 'UserB',
        userAHobbies: commonHobbies,
        userBHobbies: commonHobbies,
        commonHobbies: commonHobbies,
      );

      if (response.success && response.topic.isNotEmpty) {
        topics.add(response.topic);
      }
    }

    return topics;
  }
}
