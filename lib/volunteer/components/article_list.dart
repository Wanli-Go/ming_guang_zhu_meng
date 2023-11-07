import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/model/articleDetail.dart';
import '../model/articleBrief.dart';
import '../view/article_page.dart';

class ArticleListPage extends StatelessWidget {
  final List<ArticleBrief> articleBriefs = briefs;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: articleBriefs.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.only(left: 12, right: 12, top: 5, bottom: 5),
            child: BriefCard(abrief: articleBriefs[index]),
          );
        });
  }
}

class BriefCard extends StatelessWidget {
  final ArticleBrief abrief;

  BriefCard({required this.abrief});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        // GestureDetector允许我们检测到用户的点击事件
        onTap: () {
          // 当用户点击BriefCard时，我们跳转到ArticleDetailPage，并将文章信息传递过去
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ArticleDetailPage(),
            ),
          );
        },
        child: Card(
          elevation: 2.0, // 控制阴影大小
          color: Colors.white.withOpacity(0.9),
          shape: RoundedRectangleBorder(
            // 设置边框样式
            borderRadius: BorderRadius.circular(5), // 边框圆角
            side: BorderSide(
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
                  abrief.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5), // 也可以添加大小不同的间隔
                Text(
                  '发布时间: ${abrief.publishDate}',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 5), // 间隔
                Text(
                  abrief.summary,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Wrap(
                  children: abrief.imageUrls.map((url) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, right: 5.0), // 图片之间的间隔
                      child: Image.asset(
                        url,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ));
  }
}
