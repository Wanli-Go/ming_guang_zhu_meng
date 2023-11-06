class Activity {
  final String name;
  final String publishDate;
  final String activity;
  final String imageURL; //存在在assets中的图像资源路径

  Activity({
    required this.name,
    required this.publishDate,
    required this.activity,
    required this.imageURL,
  });
}

final List<Activity> activities = [
  Activity(
    name: '王小花',
    activity: '完成了《将进酒》的抄写',
    publishDate: '2023/11/01',
    imageURL: 'assets/images/activity1.jpg',
  ),
  Activity(
    name: '蒲星星',
    activity: '完成了一本奥数题.',
    publishDate: '2023/11/02',
    imageURL: 'assets/images/activity2.jpg',
  ),
  Activity(
    name: '韬兜兜',
    activity: '完成了《将进酒》的抄写',
    publishDate: '2023/10/31',
    imageURL: 'assets/images/activity1.jpg',
  ),
  Activity(
    name: '糖葫芦',
    activity: '完成了一本奥数题.',
    publishDate: '2023/10/30',
    imageURL: 'assets/images/activity2.jpg',
  ),
  // 更多动态...
];
