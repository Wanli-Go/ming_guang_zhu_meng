import 'package:flutter/material.dart';
import 'package:ming_guang/child/model/user.dart';
import 'package:ming_guang/donor/theme/color.dart';

final List<User> users = [
  User(
      name: "Alice",
      imageUrl: 'assets/businesswoman.png',
      comment: 'fadsfdsfasfdsf',
      commentDate: '一天前'),
  User(
      name: "Bob",
      imageUrl: 'assets/businesswoman.png',
      comment: 'fadsfdsfasfdsf',
      commentDate: '两天前')
];

class MyNotification extends StatefulWidget {
  const MyNotification({super.key});

  @override
  State<MyNotification> createState() => _MyNotificationState();
}

class _MyNotificationState extends State<MyNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 248, 129, 178).withOpacity(0.5),
        foregroundColor: Colors.grey[800],
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back,
        ),
        title: const Center(
          child: Text(
            '我的消息',
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(users[index].imageUrl),
              backgroundColor: Colors.blue,
            ),
            title: Text(users[index].name),
            subtitle: Text(users[index].comment),
            trailing: Text(users[index].commentDate),
          );
        },
      ),
    );
  }
}
