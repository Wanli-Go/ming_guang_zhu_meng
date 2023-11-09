import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/login.dart';
import 'package:ming_guang/volunteer/view_model/bottom_nav_notifier.dart';
import 'package:ming_guang/volunteer/view_model/message_notifier.dart';
import 'package:ming_guang/volunteer/view_model/task_info_update_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create:(context) => MessageNotifier(),),
      ChangeNotifierProvider(create:(context) => BottomNavNotifier(),),
      ChangeNotifierProvider(create:(context) => TaskInfoUpdateNotifier())
    ],
    builder: (c, ch) => MaterialApp(
      theme: ThemeData(
        fontFamily: "StarRail", // 定义 App 的字体
        iconTheme: const IconThemeData(
            // 定义 图标 的颜色
            color: Colors.indigo),
      ),
  
      home: const LoginPage(), // Your widget
    ),
  ));
}