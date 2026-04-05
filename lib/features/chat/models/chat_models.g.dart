// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMessageImpl _$$ChatMessageImplFromJson(Map<String, dynamic> json) =>
    _$ChatMessageImpl(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      receiverId: json['receiverId'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      isRead: json['isRead'] as bool? ?? false,
      readAt: json['readAt'] == null
          ? null
          : DateTime.parse(json['readAt'] as String),
      type: json['type'] as String?,
      invitation: json['invitation'] == null
          ? null
          : ChatInvitation.fromJson(json['invitation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChatMessageImplToJson(_$ChatMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'isRead': instance.isRead,
      'readAt': instance.readAt?.toIso8601String(),
      'type': instance.type,
      'invitation': instance.invitation,
    };

_$ChatConversationImpl _$$ChatConversationImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatConversationImpl(
      id: json['id'] as String,
      otherUserId: json['otherUserId'] as String,
      otherUserNickname: json['otherUserNickname'] as String,
      otherUserAvatar: json['otherUserAvatar'] as String?,
      lastMessage: json['lastMessage'] as String?,
      lastMessageTime: json['lastMessageTime'] == null
          ? null
          : DateTime.parse(json['lastMessageTime'] as String),
      unreadCount: (json['unreadCount'] as num?)?.toInt() ?? 0,
      hasMutualHeart: json['hasMutualHeart'] as bool? ?? false,
    );

Map<String, dynamic> _$$ChatConversationImplToJson(
        _$ChatConversationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'otherUserId': instance.otherUserId,
      'otherUserNickname': instance.otherUserNickname,
      'otherUserAvatar': instance.otherUserAvatar,
      'lastMessage': instance.lastMessage,
      'lastMessageTime': instance.lastMessageTime?.toIso8601String(),
      'unreadCount': instance.unreadCount,
      'hasMutualHeart': instance.hasMutualHeart,
    };

_$ChatInvitationImpl _$$ChatInvitationImplFromJson(Map<String, dynamic> json) =>
    _$ChatInvitationImpl(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      receiverId: json['receiverId'] as String,
      status: json['status'] as String? ?? 'pending',
      message: json['message'] as String?,
      proposedTime: json['proposedTime'] == null
          ? null
          : DateTime.parse(json['proposedTime'] as String),
      location: json['location'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      respondedAt: json['respondedAt'] == null
          ? null
          : DateTime.parse(json['respondedAt'] as String),
    );

Map<String, dynamic> _$$ChatInvitationImplToJson(
        _$ChatInvitationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'status': instance.status,
      'message': instance.message,
      'proposedTime': instance.proposedTime?.toIso8601String(),
      'location': instance.location,
      'createdAt': instance.createdAt?.toIso8601String(),
      'respondedAt': instance.respondedAt?.toIso8601String(),
    };
