// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'heart_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HeartRecordImpl _$$HeartRecordImplFromJson(Map<String, dynamic> json) =>
    _$HeartRecordImpl(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      receiverId: json['receiverId'] as String,
      isMutual: json['isMutual'] as bool? ?? false,
      mutualAt: json['mutualAt'] == null
          ? null
          : DateTime.parse(json['mutualAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$HeartRecordImplToJson(_$HeartRecordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'isMutual': instance.isMutual,
      'mutualAt': instance.mutualAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$DateInvitationImpl _$$DateInvitationImplFromJson(Map<String, dynamic> json) =>
    _$DateInvitationImpl(
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

Map<String, dynamic> _$$DateInvitationImplToJson(
        _$DateInvitationImpl instance) =>
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

_$HeartUserInfoImpl _$$HeartUserInfoImplFromJson(Map<String, dynamic> json) =>
    _$HeartUserInfoImpl(
      userId: json['userId'] as String,
      nickname: json['nickname'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      hasHeart: json['hasHeart'] as bool? ?? false,
      isMutual: json['isMutual'] as bool? ?? false,
    );

Map<String, dynamic> _$$HeartUserInfoImplToJson(_$HeartUserInfoImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'nickname': instance.nickname,
      'avatarUrl': instance.avatarUrl,
      'hasHeart': instance.hasHeart,
      'isMutual': instance.isMutual,
    };
