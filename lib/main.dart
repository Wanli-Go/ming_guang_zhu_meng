import 'package:flutter/material.dart';
import 'package:ming_guang/child/view/my_information_page.dart';
import 'package:ming_guang/child/view/my_notification_page.dart';
import 'package:ming_guang/donor/view/rank_page.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: "StarRail", // 定义 App 的字体
      iconTheme: const IconThemeData(
          // 定义 图标 的颜色
          color: Colors.indigo),
    ),

    home: const MyInfomationPage(), // Your widget
  ));
}
