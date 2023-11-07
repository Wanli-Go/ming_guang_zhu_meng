import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/model/articleBrief.dart';
import 'package:ming_guang/volunteer/model/comment.dart';
import 'package:ming_guang/volunteer/themes/community_theme.dart';
import '../model/articleDetail.dart';
import '../components/article_comments.dart';

class ArticleDetailPage extends StatelessWidget {
  const ArticleDetailPage({super.key});

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
          //cart button
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.star,
            ),
          )
        ],
      ),
      body: DetailColumn(),
    );
  }
}

class DetailColumn extends StatelessWidget {
  final ArticleDetail example = detail;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // 第一部分: 文章题目、发布时间和作者昵称
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(example.title,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 139, 49, 43))),
            SizedBox(height: 5),
            Text(
              '发布时间: ${example.publishDate}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '作者: ${detail.author}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      Divider(),

      // 第二部分: 文章的详细内容
      Expanded(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0), // 这是 SingleChildScrollView 的内边距
          child: Padding(
            // 为内部的 Column 添加额外的边距
            padding: const EdgeInsets.only(
                left: 10, right: 10, top: 5, bottom: 8), // 您可以修改这里的值来设置所需的边距
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  example.content,
                  style: TextStyle(
                    fontSize: 17,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 8.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: example.imageUrls.map((url) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 5.0), // 图片之间的垂直间隔
                      child: Center(
                        // 使用Center来水平居中Image
                        child: Image.asset(
                          url,
                          width: 250,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                // 如果有更多的内容，继续添加Text和Image小部件

                // 评论标题
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    '评论区',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // 评论列表
                // 这里只是一个静态的示例，实际应用中你可能需要从网络获取评论数据
                // ListView.builder(
                //   shrinkWrap: true, // 使用shrinkWrap使得ListView本身不滚动
                //   physics: NeverScrollableScrollPhysics(), // 禁止ListView滚动
                //   itemCount:
                //       example.comments.length, // 假设example有一个评论列表comments
                //   itemBuilder: (context, index) {
                //     final comment = example.comments[index]; // 获取单个评论
                //     return Padding(
                //       padding: const EdgeInsets.only(bottom: 10.0),
                //       child: Row(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: <Widget>[
                //           ClipOval(
                //             child: Image.asset(
                //               comment.profileUrl, // 替换为评论者的头像URL
                //               width: 55,
                //               height: 55,
                //               fit: BoxFit.cover,
                //             ),
                //           ),
                //           SizedBox(width: 10),
                //           Expanded(
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: <Widget>[
                //                 Text(
                //                   '${comment.username} • ${comment.publishTime}', // 显示评论者ID和时间
                //                   style: TextStyle(
                //                     color: Colors.grey,
                //                     fontSize: 14,
                //                   ),
                //                 ),
                //                 Text(
                //                   comment.comments,
                //                   style: TextStyle(
                //                     fontSize: 15,
                //                   ),
                //                 ), // 显示评论内容
                //               ],
                //             ),
                //           ),
                //         ],
                //       ),
                //     );
                //   },
                // ),

                CommentsList()
              ],
            ),
          ),
        ),
      ),
      Divider(),

      // 第三部分: 评论区域

      Container(
        height: 50,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 13, right: 13, bottom: 5, top: 5),
          child: Row(
            children: <Widget>[
              // 回复输入框
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "写下你的评论...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                  ),
                ),
              ),
              // 发送按钮
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  // TODO: 实现发送评论的逻辑
                },
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
