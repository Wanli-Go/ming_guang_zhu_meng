import 'package:flutter/material.dart';
import 'donorChildShowBox.dart';

class DonarChildPage extends StatelessWidget {
  const DonarChildPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('明光筑梦'), // 在这里设置 AppBar 的标题
        backgroundColor: Colors.pink, // 设置 AppBar 的背景颜色
      ),
      backgroundColor: Color.fromARGB(255, 244, 215, 227),
      body: const Column(
        children: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: CategorySelector(),
            ),
          ),
          SizedBox(height: 20,),
          InfoCard(
            imagePath: 'assets/zuijinjuanzhu.png',
            name: '王小森',
            region: '云南省昌宁县大河完小',
            situation: '父母外出打工，长期独自生活。',
          ), 
          SizedBox(height: 20,),
          InfoCard(
            imagePath: 'assets/zuijinjuanzhu.png',
            name: '王小哲',
            region: '云南省昌宁县长山完小',
            situation: '家庭特别困难，吃饭都吃不饱。',
          ), 
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const[
        BottomNavigationBarItem(
          label: '主页',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: '捐赠排行',
          icon: Icon(Icons.sort),
        ),
        BottomNavigationBarItem(
          label: '捐赠记录',
          icon: Icon(Icons.receipt),
        ),
      ]),
    );
  }
}
