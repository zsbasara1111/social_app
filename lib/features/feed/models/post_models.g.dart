// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      content: json['content'] as String,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      location: json['location'] as String?,
      visibility: json['visibility'] as String? ?? 'public',
      likeCount: (json['likeCount'] as num?)?.toInt() ?? 0,
      commentCount: (json['commentCount'] as num?)?.toInt() ?? 0,
      isLiked: json['isLiked'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      userNickname: json['userNickname'] as String?,
      userAvatar: json['userAvatar'] as String?,
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'content': instance.content,
      'images': instance.images,
      'location': instance.location,
      'visibility': instance.visibility,
      'likeCount': instance.likeCount,
      'commentCount': instance.commentCount,
      'isLiked': instance.isLiked,
      'createdAt': instance.createdAt?.toIso8601String(),
      'userNickname': instance.userNickname,
      'userAvatar': instance.userAvatar,
    };

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      id: json['id'] as String,
      postId: json['postId'] as String,
      userId: json['userId'] as String,
      content: json['content'] as String,
      parentId: json['parentId'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      userNickname: json['userNickname'] as String?,
      userAvatar: json['userAvatar'] as String?,
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'postId': instance.postId,
      'userId': instance.userId,
      'content': instance.content,
      'parentId': instance.parentId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'userNickname': instance.userNickname,
      'userAvatar': instance.userAvatar,
    };

_$PostLikeImpl _$$PostLikeImplFromJson(Map<String, dynamic> json) =>
    _$PostLikeImpl(
      id: json['id'] as String,
      postId: json['postId'] as String,
      userId: json['userId'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$PostLikeImplToJson(_$PostLikeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'postId': instance.postId,
      'userId': instance.userId,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$CreatePostRequestImpl _$$CreatePostRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreatePostRequestImpl(
      content: json['content'] as String,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      location: json['location'] as String?,
      visibility: json['visibility'] as String? ?? 'public',
    );

Map<String, dynamic> _$$CreatePostRequestImplToJson(
        _$CreatePostRequestImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'images': instance.images,
      'location': instance.location,
      'visibility': instance.visibility,
    };
