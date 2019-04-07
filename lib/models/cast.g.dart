// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastModel _$CastModelFromJson(Map<String, dynamic> json) {
  return CastModel()
    ..castId = json['cast_id'] as int
    ..name = json['name'] as String
    ..character = json['character'] as String
    ..id = json['id'] as int
    ..order = json['order'] as int;
}

Map<String, dynamic> _$CastModelToJson(CastModel instance) => <String, dynamic>{
      'cast_id': instance.castId,
      'name': instance.name,
      'character': instance.character,
      'id': instance.id,
      'order': instance.order
    };
