class CrewModel {
  String department;
  int gender;
  int id;
  String job;
  String name;

  CrewModel();

  CrewModel.fromJson(Map<String, dynamic> json)
      : department = json['department'],
        gender = json['gender'],
        id = json['id'],
        job = json['job'],
        name = json['name'];
}
