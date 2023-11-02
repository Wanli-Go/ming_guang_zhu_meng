import 'package:flutter/material.dart';
import './example/my_app.dart'; // 调整这个路径来决定你的 App 的调试的 Page

void main() {

  runApp(

    MaterialApp(

      theme: ThemeData(
        fontFamily: "StarRail", // 定义 App 的字体
        iconTheme: const IconThemeData( // 定义 图标 的颜色
          color: Colors.indigo
        ),
      ),

      home: const MyApp(), // Your widget

    )

  );
}
