import 'package:flutter/material.dart';

const Color appBarColor = Color.fromARGB(255, 236, 130, 165);
const Color backgroundColor = Color.fromARGB(255, 251, 232, 241);
final Color highlight = Colors.pinkAccent.shade400;

LinearGradient gradientDecoration = const LinearGradient(
  // 线性渐变
  begin: Alignment.topLeft, // 渐变开始的位置
  end: Alignment.bottomRight, // 渐变结束的位置
  colors: [
    Color.fromARGB(255, 255, 161, 200), // 开始颜色
    Colors.white, // 结束颜色
  ],
);
