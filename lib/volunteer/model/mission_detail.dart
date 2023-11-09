class MissionDetail {
  final String date;
  final String description;
  final int doneNum;
  final String id;
  final String level;
  final int point;
  final String tag;
  final String title;
  final int totalNum;
  final int type;

  MissionDetail({
    required this.date,
    required this.description,
    required this.doneNum,
    required this.id,
    required this.level,
    required this.point,
    required this.tag,
    required this.title,
    required this.totalNum,
    required this.type,
  });

  factory MissionDetail.fromJson(Map<String, dynamic> json) {
    return MissionDetail(
      date: json['date'],
      description: json['description'],
      doneNum: json['doneNum'],
      id: json['id'],
      level: json['level'],
      point: json['point'],
      tag: json['tag'],
      title: json['title'],
      totalNum: json['totalNum'],
      type: json['type'],
    );
  }
}

class UngradedCompletion {
  final String kidId;
  final String kidName;
  final String kidPic;

  UngradedCompletion({
    required this.kidId,
    required this.kidName,
    required this.kidPic,
  });

  factory UngradedCompletion.fromJson(Map<String, dynamic> json) {
    return UngradedCompletion(
      kidId: json['kidId'],
      kidName: json['kidName'],
      kidPic: json['kidPic'],
    );
  }
}
