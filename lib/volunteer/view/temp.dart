import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/model/articleDetail.dart';
import '../model/articleBrief.dart';

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
    return Card(
      elevation: 2.0, // 控制阴影大小
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
                  padding:
                      const EdgeInsets.only(top: 5.0, right: 5.0), // 图片之间的间隔
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
    );
  }
}
