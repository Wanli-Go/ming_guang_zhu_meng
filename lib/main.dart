import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/view_model/notifiers.dart';
import 'package:provider/provider.dart';
import './volunteer/my_app.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create:(context) => MessageNotifier(),)
    ],
    builder: (c, ch) => MaterialApp(
      theme: ThemeData(
        fontFamily: "StarRail", // 定义 App 的字体
        iconTheme: const IconThemeData(
            // 定义 图标 的颜色
            color: Colors.indigo),
      ),
  
      home: const MyApp(), // Your widget
    ),
  ));
}