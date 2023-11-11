import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/login.dart';
import 'package:ming_guang/volunteer/view_model/notifiers/notifier_bottom_nav.dart';
import 'package:ming_guang/volunteer/view_model/notifiers/notifier_message.dart';
import 'package:ming_guang/volunteer/view_model/notifiers/notifier_update_task_info.dart';
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