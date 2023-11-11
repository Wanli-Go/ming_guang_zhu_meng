class KidRecentDto {
  final String name;
  final String photo;
  final String recent;

  KidRecentDto({
    required this.name,
    required this.photo,
    required this.recent,
  });

  factory KidRecentDto.fromJson(Map<String, dynamic> json) {
    return KidRecentDto(
      name: json['name'] as String,
      photo: json['photo'] as String,
      recent: json['recent'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'photo': photo,
      'recent': recent,
    };
  }
}
