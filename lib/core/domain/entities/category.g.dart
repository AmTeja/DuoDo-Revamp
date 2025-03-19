// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoCategoryImpl _$$TodoCategoryImplFromJson(Map<String, dynamic> json) =>
    _$TodoCategoryImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      icon: json['icon'] as String,
      color: (json['color'] as num?)?.toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$TodoCategoryImplToJson(_$TodoCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'color': instance.color,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
