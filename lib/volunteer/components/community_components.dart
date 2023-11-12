import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/services/base/base_url.dart';
import 'package:ming_guang/volunteer/themes/community_theme.dart';
import 'package:ming_guang/volunteer/view_model/articles_model.dart';
import '../model/model_article_brief.dart';
import '../view/article_page.dart';

class ArticleListPage extends StatelessWidget {
  final ArticlesModel model;
  final int type; // 0 = all, 1 = favorite, 2 = search
  String? keyWord;

  ArticleListPage(
      {super.key, required this.model, required this.type, this.keyWord});
  @override
  Widget build(BuildContext context) {
    List<Future<List<ArticleBrief>>> functions = [
      model.fetchArticles(),
      model.fetchFavorites(),
      model.search(keyWord)
    ];
    return FutureBuilder<List<ArticleBrief>>(
        future: functions[type],
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                height: 100,
                child: Center(
                  child: CircularProgressIndicator(
                    color: commHighlight,
                  ),
                ),
              ),
            );
          }
          List<ArticleBrief> briefs = snapshot.data!;
          return ListView.builder(
              itemCount: briefs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 5, bottom: 5),
                  child: BriefCard(aBrief: briefs[index]),
                );
              });
        });
  }
}

class BriefCard extends StatelessWidget {
  final ArticleBrief aBrief;

  const BriefCard({super.key, required this.aBrief});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        // GestureDetector允许我们检测到用户的点击事件
        onTap: () {
          // 当用户点击BriefCard时，我们跳转到ArticleDetailPage，并将文章信息传递过去
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ArticleDetailPage(
                articleId: aBrief.id,
              ),
            ),
          );
        },
        child: Card(
          elevation: 2.0, // 控制阴影大小
          color: Colors.white.withOpacity(0.9),
          shape: RoundedRectangleBorder(
            // 设置边框样式
            borderRadius: BorderRadius.circular(5), // 边框圆角
            side: const BorderSide(
              color: Colors.white, // 边框颜色
              width: 0.5, // 边框宽度
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0), // 设置Card内部内容的内边距
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  aBrief.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5), // 也可以添加大小不同的间隔
                Text(
                  '发布时间: ${aBrief.articleTime}',
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5), // 间隔
                Text(
                  aBrief.content,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  maxLines: 4,
                ),
                const SizedBox(height: 5),

                Padding(
                  padding:
                      const EdgeInsets.only(top: 5.0, right: 5.0), // 图片之间的间隔
                  child: Center(
                    child: Image.network(
                      "$baseUrl/pic/${aBrief.contentPic}",
                      headers: {'token': global_token},
                      width: 210,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
