class CastModel {
  int castId;
  String name;
  String character;
  int id;
  int order;

  CastModel();

  CastModel.fromJson(Map<String, dynamic> json)
      : castId = json['cast_id'],
        name = json['name'],
        character = json['character'],
        id = json['id'],
        order = json['order'];
}
