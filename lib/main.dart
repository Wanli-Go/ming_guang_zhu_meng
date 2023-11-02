import 'package:flutter/material.dart';
import 'donor/view/main_page.dart'; // 调整这个路径来决定你的 App 的调试的 Page
import 'donor/view/donorChild.dart';
import 'donor/view/childDetail.dart';

void main() {

  runApp(

    MaterialApp(

      theme: ThemeData(
        fontFamily: "StarRail", // 定义 App 的字体
        iconTheme: const IconThemeData( // 定义 图标 的颜色
          color: Colors.indigo
        ),
      ),

      //home: const ChildInfoPage(imagePath: 'assets/zuijinjuanzhu.png', name: '王小森', school: '云南省昌宁县长山完小', age: '14', detail: '家庭特别困难，吃饭都吃不饱。家庭特别困难，吃饭都吃不饱。家庭特别困难，吃饭都吃不饱。') 
      //home: const MainPage(),
      home: const DonarChildPage(),

    )

  );
}
