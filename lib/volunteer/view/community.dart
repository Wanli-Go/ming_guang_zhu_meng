import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../model/article.dart';
import '../components/article_list.dart';

class ArticlesBody extends StatelessWidget {
  const ArticlesBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: ArticleCarousel(),
        ),
        const SizedBox(height: 10),
        const Text(
          '————文章推荐————',
          style: TextStyle(
            color: Color.fromARGB(255, 139, 49, 43), // 设置你想要的颜色
            fontSize: 18, //大小
          ),
        ),
        Expanded(child: ArticleListPage()),
        //底部导航栏
      ],
    );
  }
}

class ArticleCarousel extends StatelessWidget {
  final List<Article> article = articles;

  ArticleCarousel({super.key});
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: articles.length,
      itemBuilder: (context, index, realIndex) {
        return ArticleCard(article: articles[index]);
      },
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
      ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(article.imageURL),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 10,
            bottom: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                article.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
