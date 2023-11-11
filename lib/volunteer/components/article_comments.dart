import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/model/comment.dart';

class CommentsList extends StatelessWidget {
  final List<Comment> comments;

  CommentsList({super.key, required this.comments});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
        itemCount: comments.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.only(left: 12, right: 12, top: 5, bottom: 5),
            child: CommentCard(com: comments[index]),
          );
        });
  }
}

class CommentCard extends StatelessWidget {
  final Comment com;

  const CommentCard({super.key, required this.com});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        // 设置边框样式
        borderRadius: BorderRadius.circular(3), // 边框圆角
        side: const BorderSide(
          color: Color.fromARGB(255, 234, 226, 226), // 边框颜色
          width: 0.5, // 边框宽度
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0), // 设置Card内部内容的内边距
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 头像部分
            ClipOval(
              child: Image.asset(
                com.profileUrl, // 替换为头像的URL
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
