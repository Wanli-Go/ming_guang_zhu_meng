import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/themes/community_theme.dart';
import 'package:ming_guang/volunteer/themes/main_theme.dart';
import '../components/article_list.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      //背景颜色
      appBar: AppBar(
        toolbarHeight: width * 0.14,
        backgroundColor: commAppBarColor,
        centerTitle: true, // 这将使标题水平居中对齐
        title: const Text(
          "我的收藏",
        ),
      ),

      body: Column(
        children: [
          const SizedBox(height: 5),
          Expanded(child: ArticleListPage()),
        ],
      ),
    );
  }
}
