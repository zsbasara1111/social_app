// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchUserImpl _$$MatchUserImplFromJson(Map<String, dynamic> json) =>
    _$MatchUserImpl(
      id: json['id'] as String,
      nickname: json['nickname'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      age: (json['age'] as num).toInt(),
      city: json['city'] as String,
      bio: json['bio'] as String?,
      matchScore: (json['matchScore'] as num).toInt(),
      commonHobbies: (json['commonHobbies'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
      lastActiveAt: json['lastActiveAt'] == null
          ? null
          : DateTime.parse(json['lastActiveAt'] as String),
    );

Map<String, dynamic> _$$MatchUserImplToJson(_$MatchUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'avatarUrl': instance.avatarUrl,
      'age': instance.age,
      'city': instance.city,
      'bio': instance.bio,
      'matchScore': instance.matchScore,
      'commonHobbies': instance.commonHobbies,
      'photos': instance.photos,
      'lastActiveAt': instance.lastActiveAt?.toIso8601String(),
    };

_$MatchSettingsImpl _$$MatchSettingsImplFromJson(Map<String, dynamic> json) =>
    _$MatchSettingsImpl(
      minMatchScore: (json['minMatchScore'] as num?)?.toInt() ?? 1,
      targetGender: json['targetGender'] as String? ?? 'all',
      minAge: (json['minAge'] as num?)?.toInt() ?? 18,
      maxAge: (json['maxAge'] as num?)?.toInt() ?? 35,
      locationType: json['locationType'] as String? ?? 'same_city',
      city: json['city'] as String?,
    );

Map<String, dynamic> _$$MatchSettingsImplToJson(_$MatchSettingsImpl instance) =>
    <String, dynamic>{
      'minMatchScore': instance.minMatchScore,
      'targetGender': instance.targetGender,
      'minAge': instance.minAge,
      'maxAge': instance.maxAge,
      'locationType': instance.locationType,
      'city': instance.city,
    };

_$MatchRelationshipImpl _$$MatchRelationshipImplFromJson(
        Map<String, dynamic> json) =>
    _$MatchRelationshipImpl(
      id: json['id'] as String,
      userId1: json['userId1'] as String,
      userId2: json['userId2'] as String,
      matchScore: (json['matchScore'] as num).toInt(),
      status: json['status'] as String? ?? 'pending',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$MatchRelationshipImplToJson(
        _$MatchRelationshipImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId1': instance.userId1,
      'userId2': instance.userId2,
      'matchScore': instance.matchScore,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$MatchResultImpl _$$MatchResultImplFromJson(Map<String, dynamic> json) =>
    _$MatchResultImpl(
      userId: json['userId'] as String,
      score: (json['score'] as num).toInt(),
      commonItems: (json['commonItems'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      matchedCategories:
          (json['matchedCategories'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    );

Map<String, dynamic> _$$MatchResultImplToJson(_$MatchResultImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'score': instance.score,
      'commonItems': instance.commonItems,
      'matchedCategories': instance.matchedCategories,
    };
