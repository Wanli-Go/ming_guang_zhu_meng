import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/themes/community_theme.dart';
import 'package:ming_guang/volunteer/view_model/article_detail_model.dart';
import '../model/model_article_detail.dart';
import '../components/article_comments.dart';

class ArticleDetailPage extends StatelessWidget {
  final String articleId;
  late final ArticleDetailModel model;

  ArticleDetailPage({super.key, required this.articleId}) {
    model = ArticleDetailModel(id: articleId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: commAppBarColor,
        centerTitle: true, // 这将使标题水平居中对齐
        title: const Text(
          "文章详情",
        ),

        actions: [
          IconButton(
            onPressed: () {
              model.likeArticle(articleId);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('收藏成功'),
                ),
              );
            },
            icon: const Icon(
              Icons.star,
            ),
          )
        ],
      ),
      body: DetailColumn(
        articleId: articleId,
        model: model,
      ),
    );
  }
}

class DetailColumn extends StatelessWidget {
  final String articleId;
  final ArticleDetailModel model;

  DetailColumn({super.key, required this.articleId, required this.model});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticleDetail>(
        future: model.fetchArticleDetail(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return (Center(
              child: CircularProgressIndicator(color: commHighlight),
            ));
          ArticleDetail example = snapshot.data!;
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 第一部分: 文章题目、发布时间和作者昵称
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 5, bottom: 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(example.title,
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 139, 49, 43))),
                      const SizedBox(height: 5),
                      Text(
                        '发布时间: ${example.publishDate}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '作者: ${example.author}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),

                // 第二部分: 文章的详细内容
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(
                        16.0), // 这是 SingleChildScrollView 的内边距
                    child: Padding(
                      // 为内部的 Column 添加额外的边距
                      padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 5,
                          bottom: 8), // 您可以修改这里的值来设置所需的边距
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            example.content,
                            style: const TextStyle(
                              fontSize: 17,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0), // 图片之间的垂直间隔
                            child: Center(
                              // 使用Center来水平居中Image
                              child: Image.asset(
                                example.contentPic,
                                width: 250,
                                height: 250,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // 如果有更多的内容，继续添加Text和Image小部件

                          // 评论标题
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              '评论区',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          CommentsList(
                            comments: example.comments,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const Divider(),

                // 第三部分: 评论区域

                SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 13, right: 13, bottom: 5, top: 5),
                    child: Row(
                      children: <Widget>[
                        // 回复输入框
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "写下你的评论...",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                              ),
                            ),
                          ),
                        ),
                        // 发送按钮
                        IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: () async {
                            await Future.delayed(Duration(milliseconds: 700));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('评论已发送，待审核'),
                              ),
                            );
                            
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ]);
        });
  }
}
