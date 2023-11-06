class Article {
  final String title;
  final String imageURL; //存在在assets中的图像资源路径

  Article({
    required this.title,
    required this.imageURL,
  });
}

final List<Article> articles = [
  Article(
    title: '志愿精神：微光可成炬 大爱映苍穹',
    imageURL: 'assets/images/community1.jpg',
  ),
  Article(
    title: '青春志愿行 奉献新时代',
    imageURL: 'assets/images/community2.jpg',
  ),
  // 更多动态...
];
