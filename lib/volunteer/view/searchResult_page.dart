import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../model/article.dart';
import '../view/articleList.dart';
import '../view/myfavorite_page.dart';

class Result_Page extends StatelessWidget {
  const Result_Page({super.key});

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
          ),
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
