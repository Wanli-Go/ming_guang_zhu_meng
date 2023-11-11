class ArticleBrief {
  final String id;
  final String title;
  final String articleTime;
  final String content;
  final String contentPic;

  ArticleBrief({required this.id, 
    required this.title,
    required this.articleTime,
    required this.content,
    required this.contentPic,
  });
}

final List<ArticleBrief> briefs = [
  ArticleBrief(
      id: '1',
      title: '1 学习语｜弘扬奉献、友爱、互助、进步的志愿精神',
      articleTime: '2022/12/05',
      content: '今天是第37个国际志愿者日。志愿服务是社会文明进步的重要标志......',
      contentPic: 'assets/images/brief1-1.jpg'),
  ArticleBrief(
      id: '2',
      title: '2 践行志愿精神 贡献智慧力量',
      articleTime: '2021/08/22',
      content: '志愿服务是社会文明进步的重要标志，是广大志愿者奉献爱心的重要渠道......',
      contentPic: 'assets/images/brief2-1.jpg'),
  ArticleBrief(
      id: '3',
      title: '3 学习语｜弘扬奉献、友爱、互助、进步的志愿精神',
      articleTime: '2022/12/05',
      content: '今天是第37个国际志愿者日。志愿服务是社会文明进步的重要标志......',
      contentPic: 'assets/images/brief1-1.jpg'),
  ArticleBrief(
      id: '4',
      title: '4 中国扶贫基金会爱心包裹项目：小包裹，大爱心',
      articleTime: '2020/12/02',
      content: '爱心包裹项目是中国扶贫基金会发起的一项全民公益活动，通过动员......',
      contentPic: 'assets/images/brief3-1.jpg'),
  ArticleBrief(
      id: '5',
      title: '5 学习语｜弘扬奉献、友爱、互助、进步的志愿精神',
      articleTime: '2022/12/05',
      content: '今天是第37个国际志愿者日。志愿服务是社会文明进步的重要标志......',
      contentPic: 'assets/images/brief1-1.jpg'),
];
