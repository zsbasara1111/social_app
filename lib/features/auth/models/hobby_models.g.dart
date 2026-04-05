// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hobby_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HobbyCategoryImpl _$$HobbyCategoryImplFromJson(Map<String, dynamic> json) =>
    _$HobbyCategoryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String?,
      isCustom: json['isCustom'] as bool? ?? false,
      isPreset: json['isPreset'] as bool? ?? true,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$HobbyCategoryImplToJson(_$HobbyCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'isCustom': instance.isCustom,
      'isPreset': instance.isPreset,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$UserHobbyItemImpl _$$UserHobbyItemImplFromJson(Map<String, dynamic> json) =>
    _$UserHobbyItemImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      categoryId: json['categoryId'] as String,
      itemName: json['itemName'] as String,
      categoryName: json['categoryName'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$UserHobbyItemImplToJson(_$UserHobbyItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'categoryId': instance.categoryId,
      'itemName': instance.itemName,
      'categoryName': instance.categoryName,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
