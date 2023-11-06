import 'package:flutter/material.dart';

import './volunteer/view/VolunteerChildSituationPage.dart'; // 调整这个路径来决定你的 App 的调试的 Page
//import './volunteer/view/VolunteerHomePage.dart';
//import './volunteer/view/VolunteerPersonPage.dart';
 void main() {

   runApp(

     MaterialApp(

       theme: ThemeData(
         fontFamily: "StarRail", // 定义 App 的字体
         iconTheme: const IconThemeData( // 定义 图标 的颜色
          color: Colors.indigo
         ),
      ),

       home:  ChildSituationPage(), // Your widget

     )

   );
 }
