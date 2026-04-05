// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_topic_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AITopicImpl _$$AITopicImplFromJson(Map<String, dynamic> json) =>
    _$AITopicImpl(
      id: json['id'] as String,
      content: json['content'] as String,
      category: json['category'] as String?,
      isUsed: json['isUsed'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$AITopicImplToJson(_$AITopicImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'category': instance.category,
      'isUsed': instance.isUsed,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$TopicGenerationRequestImpl _$$TopicGenerationRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$TopicGenerationRequestImpl(
      userAId: json['userAId'] as String,
      userBId: json['userBId'] as String,
      userAHobbies: (json['userAHobbies'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      userBHobbies: (json['userBHobbies'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      commonHobbies: (json['commonHobbies'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$TopicGenerationRequestImplToJson(
        _$TopicGenerationRequestImpl instance) =>
    <String, dynamic>{
      'userAId': instance.userAId,
      'userBId': instance.userBId,
      'userAHobbies': instance.userAHobbies,
      'userBHobbies': instance.userBHobbies,
      'commonHobbies': instance.commonHobbies,
    };

_$TopicGenerationResponseImpl _$$TopicGenerationResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TopicGenerationResponseImpl(
      topic: json['topic'] as String,
      explanation: json['explanation'] as String?,
      success: json['success'] as bool? ?? false,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$TopicGenerationResponseImplToJson(
        _$TopicGenerationResponseImpl instance) =>
    <String, dynamic>{
      'topic': instance.topic,
      'explanation': instance.explanation,
      'success': instance.success,
      'error': instance.error,
    };

_$ChatContextImpl _$$ChatContextImplFromJson(Map<String, dynamic> json) =>
    _$ChatContextImpl(
      userId: json['userId'] as String,
      otherUserId: json['otherUserId'] as String,
      otherUserName: json['otherUserName'] as String,
      recentMessages: (json['recentMessages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      lastMessageTime: json['lastMessageTime'] == null
          ? null
          : DateTime.parse(json['lastMessageTime'] as String),
    );

Map<String, dynamic> _$$ChatContextImplToJson(_$ChatContextImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'otherUserId': instance.otherUserId,
      'otherUserName': instance.otherUserName,
      'recentMessages': instance.recentMessages,
      'lastMessageTime': instance.lastMessageTime?.toIso8601String(),
    };
