class PersonalInfo {
  int age;
  String area;
  String birthday;
  int gender;
  String hometown;
  String id;
  String job;
  String name;
  String photo;

  PersonalInfo({
    required this.age,
    required this.area,
    required this.birthday,
    required this.gender,
    required this.hometown,
    required this.id,
    required this.job,
    required this.name,
    required this.photo,
  });

  factory PersonalInfo.fromJson(Map<String, dynamic> json) {
    return PersonalInfo(
      age: json['age'],
      area: json['area'],
      birthday: json['birthday'],
      gender: json['gender'],
      hometown: json['hometown'],
      id: json['id'],
      job: json['job'],
      name: json['name'],
      photo: json['photo'],
    );
  }
}
