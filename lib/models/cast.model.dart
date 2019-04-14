import 'package:json_annotation/json_annotation.dart';

part 'cast.model.g.dart';

@JsonSerializable()
class CastModel {
  @JsonKey(name: 'cast_id')
  int castId;
  String name;
  String character;
  int id;
  int order;

  CastModel();

  factory CastModel.fromJson(Map<String, dynamic> json) => _$CastModelFromJson(json);
}
