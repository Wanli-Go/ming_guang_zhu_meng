//捐助记录
class Donor {
  String name;
  String donationCount;
  String donationMoney;
  String weekRating;
  String totalRating;
  String description;
  String imageUrl;

  Donor({
    required this.name,
    required this.donationCount,
    required this.donationMoney,
    required this.weekRating,
    required this.totalRating,
    required this.description,
    required this.imageUrl,
  });

  String get _name => name;
  String get _donateCount => donationCount;
  String get _donateMoney => donationMoney;
  String get _weekRating => weekRating;
  String get _totalRating => totalRating;
  String get _description => description;
}

//时间轴
class TimelineItem {
  final String date;
  final String item;
  final String imageUrl;

  TimelineItem({
    required this.date,
    required this.item,
    required this.imageUrl,
  });
}

//孩子详情
class ChildInfo {
  final String imagePath;
  final String name;
  final String school;
  final String age;
  final String detail;
  final String id;

  ChildInfo(
      {required this.imagePath,
      required this.name,
      required this.school,
      required this.age,
      required this.detail,
      required this.id});
}

//孩子近况的钱款用途
class DonationInfo {
  final String date;
  final String amount;
  final String purpose;

  DonationInfo({
    required this.date,
    required this.amount,
    required this.purpose,
  });
}

//捐助类 捐钱捐物
class DonationDetail {
  final String childID;
  final String childName; //或者是项目名称/id
  final String money;
  final String objDescription;

  DonationDetail({
    required this.childID,
    required this.money,
    required this.objDescription,
    required this.childName,
  });
}

//捐助排名单条记录
class DonationRecord {
  final String donationAmount;
  final String donationDate;
  final String childPhotoUrl;

  DonationRecord({
    required this.donationAmount,
    required this.donationDate,
    required this.childPhotoUrl,
  });
}

//选择孩子页面捐助孩子信息单条信息
class DonationChildDetail {
  final String imagePath;
  final String name;
  final String region;
  final String situation;
  final String id;

  DonationChildDetail(
      {required this.imagePath,
      required this.name,
      required this.region,
      required this.situation,
      required this.id});
}

//选择项目页面捐助项目信息单挑信息
class DonationProjectDetail {
  final String imagePath;
  final String title;
  final String description;
  final String id;

  DonationProjectDetail(
      {required this.imagePath,
      required this.title,
      required this.description,
      required this.id});
}

//分享页面 sharePage.dart 里的Student
class StudentInfo {
  final String name;
  final String school;
  final int age;
  final String personalSituation;
  final String photoUrl;

  StudentInfo({
    required this.name,
    required this.school,
    required this.age,
    required this.personalSituation,
    required this.photoUrl,
  });

  static Future<StudentInfo> fetchFromBackend() async {
    await Future.delayed(const Duration(seconds: 2));
    // 这里假设你有一个有效的图片路径，如果是网络图片，请使用网络图片地址
    return StudentInfo(
      name: '王小花',
      school: '振兴路小学',
      age: 8,
      personalSituation: '家里没人，我吃不饱饭，不能给原神充钱，温迪不要我了',
      photoUrl: 'assets/changePic1.png',
    );
  }
}