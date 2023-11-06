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

final List<TimelineItem> timelineItems = [
  TimelineItem(
    date: '2023-01-01',
    item: '使用了爱心人士捐款的150元',
    imageUrl: 'assets/boy.png',
  ),
  TimelineItem(
    date: '2023-02-01',
    item: '体育用品',
    imageUrl: 'assets/heart.png',
  ),
  // Add more items...
];
