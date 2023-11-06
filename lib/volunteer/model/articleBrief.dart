class ArticleBrief {
  final String title;
  final String publishDate;
  final String summary;
  final List<String> imageUrls;

  ArticleBrief({
    required this.title,
    required this.publishDate,
    required this.summary,
    required this.imageUrls,
  });
}

final List<ArticleBrief> briefs = [
  ArticleBrief(
      title: '学习语｜弘扬奉献、友爱、互助、进步的志愿精神',
      publishDate: '2022/12/05',
      summary: '今天是第37个国际志愿者日。志愿服务是社会文明进步的重要标志......',
      imageUrls: [
        'assets/images/brief1-1.jpg',
        'assets/images/brief1-2.jpg',
        'assets/images/brief1-3.jpg'
      ]),
  ArticleBrief(
      title: '践行志愿精神 贡献智慧力量',
      publishDate: '2021/08/22',
      summary: '志愿服务是社会文明进步的重要标志，是广大志愿者奉献爱心的重要渠道......',
      imageUrls: [
        'assets/images/brief2-1.jpg',
        'assets/images/brief2-2.jpg',
      ]),
  ArticleBrief(
      title: '学习语｜弘扬奉献、友爱、互助、进步的志愿精神',
      publishDate: '2022/12/05',
      summary: '今天是第37个国际志愿者日。志愿服务是社会文明进步的重要标志......',
      imageUrls: [
        'assets/images/brief1-1.jpg',
        'assets/images/brief1-2.jpg',
        'assets/images/brief1-3.jpg'
      ]),
  ArticleBrief(
      title: '中国扶贫基金会爱心包裹项目：小包裹，大爱心 ',
      publishDate: '2020/12/02',
      summary: '爱心包裹项目是中国扶贫基金会发起的一项全民公益活动，通过动员......',
      imageUrls: [
        'assets/images/brief3-1.jpg',
        'assets/images/brief3-2.jpg',
      ]),
  ArticleBrief(
      title: '学习语｜弘扬奉献、友爱、互助、进步的志愿精神',
      publishDate: '2022/12/05',
      summary: '今天是第37个国际志愿者日。志愿服务是社会文明进步的重要标志......',
      imageUrls: [
        'assets/images/brief1-1.jpg',
        'assets/images/brief1-2.jpg',
        'assets/images/brief1-3.jpg'
      ]),
  // 更多动态...
];
