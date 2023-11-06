import 'package:flutter/material.dart';
import 'package:ming_guang/donor/view/childDetail.dart';
import 'package:ming_guang/donor/view/childMoneyDetail.dart';
import 'package:ming_guang/donor/view/collectMainPage.dart';
import 'package:ming_guang/donor/view/donorChild.dart';
import 'package:ming_guang/donor/view/main_page.dart';
import 'package:ming_guang/donor/view/projectDetail.dart';
// 调整这个路径来决定你的 App 的调试的 Page

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
      //home: const DonarChildPage(),
      //home: const DonarProjectPage(),
      //home: const ChildMoneyDetailPage(),
      //home: const CollectMainPage(),
      //home: const SharePage(), //Unfound
      //home: const DonationRecordPage(), //Unfound
      //home: const DonatePage(), //Incomplete
    )
  );
}
