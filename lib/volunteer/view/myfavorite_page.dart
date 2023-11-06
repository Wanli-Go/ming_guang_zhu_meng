import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../model/article.dart';
import '../view/articleList.dart';

class Favorite_Page extends StatelessWidget {
  const Favorite_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //背景颜色
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 139, 49, 43),
        centerTitle: true, // 这将使标题水平居中对齐
        title: const Text(
          "我的收藏",
          style: TextStyle(
              color: Colors.white, // 设置你想要的颜色
              fontSize: 22),
        ),
      ),

      body: Column(
        children: [
          SizedBox(height: 5),
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
