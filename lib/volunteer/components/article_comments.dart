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
        borderRadius: BorderRadius.circular(10), // Increased the border radius for a softer look
        side: const BorderSide(
          color: Color.fromARGB(255, 234, 226, 226),
          width: 1,
        ),
      ),
      elevation: 5, // Added elevation for a subtle shadow
      margin: const EdgeInsets.all(10), // Added margin for spacing between cards
      child: Padding(
        padding: const EdgeInsets.all(12), // Adjusted padding for better spacing
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row( // Using Row to layout the avatar and user details horizontally
              children: [
                ClipOval(
                  child: Image.network( // Changed to Image.network for loading images from URLs
                    //com.profileUrl,
                    "https://cdn.pixabay.com/photo/2022/10/24/02/52/child-7542535_1280.jpg",
                    width: 40,
                    height: 40,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(width: 10), // Added a SizedBox for spacing
                Expanded( // Wrapped in Expanded for proper layout
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        com.username,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        com.publishTime,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10), // Added spacing between the header and the comment content
            Text(
              com.comments,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
