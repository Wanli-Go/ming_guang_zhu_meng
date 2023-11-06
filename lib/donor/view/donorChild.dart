import 'package:flutter/material.dart';
import 'donorChildShowBox.dart';

class DonarChildPage extends StatelessWidget {
  const DonarChildPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            '明光筑梦',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          centerTitle: true, // 在这里设置 AppBar 的标题
          backgroundColor: const Color.fromARGB(255, 152, 92, 88), // 设置 AppBar 的背景颜色
        ),
        backgroundColor: const Color.fromARGB(255, 239, 229, 229),
        body: const Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: 0, right: 0, top: 3, bottom: 3),
                child: CategorySelector(),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            InfoCard(
              imagePath: 'assets/zuijinjuanzhu.png',
              name: '王小森',
              region: '云南省昌宁县大河完小',
              situation: '父母外出打工，长期独自生活。',
            ),
            SizedBox(
              height: 13,
            ),
            InfoCard(
              imagePath: 'assets/zuijinjuanzhu.png',
              name: '王小哲',
              region: '云南省昌宁县长山完小',
              situation: '家庭特别困难，吃饭都吃不饱。',
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(
            label: '主页',
            icon: Icon(
              Icons.home,
              //color: Color.fromARGB(255, 152, 92, 88),
            ),
          ),
          BottomNavigationBarItem(
            label: '捐赠排行',
            icon: Icon(Icons.sort),
          ),
          BottomNavigationBarItem(
            label: '捐赠记录',
            icon: Icon(Icons.receipt),
          ),
        ], selectedItemColor: const Color.fromARGB(255, 152, 92, 88) // 选中项的颜色
            //unselectedItemColor: Colors.grey, // 未选中项的颜色),
            ));
  }
}
