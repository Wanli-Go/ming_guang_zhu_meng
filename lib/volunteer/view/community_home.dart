import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../model/article.dart';
import '../view/articleList.dart';
import '../view/myfavorite_page.dart';
import '../view/searchResult_page.dart';

class Community_Home extends StatelessWidget {
  const Community_Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //背景颜色
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 139, 49, 43),
        centerTitle: true, // 这将使标题水平居中对齐
        title: const Text(
          "志愿社区",
          style: TextStyle(
              color: Colors.white, // 设置你想要的颜色
              fontSize: 22),
        ),
        actions: [
          //cart button
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Favorite_Page()),
              );
            },
            icon: const Icon(Icons.hotel_class),
          )
        ],

        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70), // 标准的工具栏高度
          child: Container(
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 13, right: 13, bottom: 8, top: 8),
              child: Row(
                children: <Widget>[
                  Expanded(
                    // 使用Expanded来确保TextField可以填充剩余空间
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '搜索......',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // 在这里实现按钮的点击事件，例如进行搜索
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      body: Column(
        children: [
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: ArticleCarousel(),
          ),
          SizedBox(height: 10),
          Text(
            '————文章推荐————',
            style: TextStyle(
              color: const Color.fromARGB(255, 139, 49, 43), // 设置你想要的颜色
              fontSize: 18, //大小
            ),
          ),
          Expanded(child: ArticleListPage()),

          //底部导航栏
          BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),

                label: "主页",
                //backgroundColor: Color.fromARGB(255, 139, 49, 43)
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.task),
                label: "任务批改",
                //backgroundColor: Color.fromARGB(255, 139, 49, 43)
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_library),
                label: "志愿社区",
                //backgroundColor: Color.fromARGB(255, 139, 49, 43)
              )
            ],
          )
        ],
      ),
    );
  }
}

class ArticleCarousel extends StatelessWidget {
  final List<Article> article = articles;
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
      margin: EdgeInsets.all(5),
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
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                article.title,
                style: TextStyle(
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
