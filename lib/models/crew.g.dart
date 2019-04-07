// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crew.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CrewModel _$CrewModelFromJson(Map<String, dynamic> json) {
  return CrewModel()
    ..department = json['department'] as String
    ..gender = json['gender'] as int
    ..id = json['id'] as int
    ..job = json['job'] as String
    ..name = json['name'] as String;
}

Map<String, dynamic> _$CrewModelToJson(CrewModel instance) => <String, dynamic>{
      'department': instance.department,
      'gender': instance.gender,
      'id': instance.id,
      'job': instance.job,
      'name': instance.name
    };
