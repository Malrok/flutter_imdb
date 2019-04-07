import 'package:json_annotation/json_annotation.dart';

part 'crew.g.dart';

@JsonSerializable()
class CrewModel {
  String department;
  int gender;
  int id;
  String job;
  String name;

  CrewModel();

  factory CrewModel.fromJson(Map<String, dynamic> json) => _$CrewModelFromJson(json);
}
