import 'package:flutter/material.dart';
<<<<<<< HEAD

import './child/view/HomeworkComment.dart'; // 调整这个路径来决定你的 App 的调试的 Page

 void main() {

   runApp(

     MaterialApp(

       theme: ThemeData(
         fontFamily: "StarRail", // 定义 App 的字体
         iconTheme: const IconThemeData( // 定义 图标 的颜色
          color: Colors.indigo
         ),
      ),

       home:  MyApp(), // Your widget

     )

   );
 }
=======
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
>>>>>>> b4974ab7949b643fa08505bd22d36fcd3a61f4f3
