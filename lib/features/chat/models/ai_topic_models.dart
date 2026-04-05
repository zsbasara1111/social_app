import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_topic_models.freezed.dart';
part 'ai_topic_models.g.dart';

/// AI话题建议模型
@freezed
class AITopic with _$AITopic {
  const factory AITopic({
    required String id,
    required String content,
    String? category,
    @Default(false) bool isUsed,
    DateTime? createdAt,
  }) = _AITopic;

  factory AITopic.fromJson(Map<String, dynamic> json) =>
      _$AITopicFromJson(json);
}

/// 话题生成请求
@freezed
class TopicGenerationRequest with _$TopicGenerationRequest {
  const factory TopicGenerationRequest({
    required String userAId,
    required String userBId,
    required List<String> userAHobbies,
    required List<String> userBHobbies,
    required List<String> commonHobbies,
  }) = _TopicGenerationRequest;

  factory TopicGenerationRequest.fromJson(Map<String, dynamic> json) =>
      _$TopicGenerationRequestFromJson(json);
}

/// 话题生成响应
@freezed
class TopicGenerationResponse with _$TopicGenerationResponse {
  const factory TopicGenerationResponse({
    required String topic,
    String? explanation,
    @Default(false) bool success,
    String? error,
  }) = _TopicGenerationResponse;

  factory TopicGenerationResponse.fromJson(Map<String, dynamic> json) =>
      _$TopicGenerationResponseFromJson(json);
}

/// 话题类型枚举
enum TopicType {
  opinion,   // 观点型
  experience, // 体验型
  hypothetical, // 假设型
  recommendation, // 推荐型
}

/// AI助手状态
@freezed
class AIAssistantState with _$AIAssistantState {
  const factory AIAssistantState({
    @Default(false) bool isLoading,
    AITopic? currentTopic,
    @Default([]) List<AITopic> topicHistory,
    String? error,
  }) = _AIAssistantState;

  factory AIAssistantState.initial() => const AIAssistantState();
}

/// 对话上下文
@freezed
class ChatContext with _$ChatContext {
  const factory ChatContext({
    required String userId,
    required String otherUserId,
    required String otherUserName,
    @Default([]) List<String> recentMessages,
    DateTime? lastMessageTime,
  }) = _ChatContext;

  factory ChatContext.fromJson(Map<String, dynamic> json) =>
      _$ChatContextFromJson(json);
}
