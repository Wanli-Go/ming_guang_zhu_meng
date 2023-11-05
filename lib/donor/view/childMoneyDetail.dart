import 'package:flutter/material.dart';
import 'childMoneyShowBox.dart'; // 确保 childMoneyShowBox.dart 中有正确的类定义

class childMoneyDetailPage extends StatelessWidget {
  const childMoneyDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '孩子近况',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 152, 92, 88),
      ),
      backgroundColor: Color.fromARGB(255, 244, 215, 227),
      body: SingleChildScrollView(
        // 使用 SingleChildScrollView
        child: Column(
          children: <Widget>[
            ChildStatusCard(
              imagePaths: [
                'assets/boy.png', // 假设这些图片已经添加到Flutter项目的资源中
                'assets/zuijinjuanzhu.png',
              ],
              donations: [
                DonationInfo(
                    date: '2023-10-05', amount: '100元', purpose: '购买学习用品'),
                DonationInfo(
                    date: '2023-10-12', amount: '150元', purpose: '购买必须的衣物'),
                DonationInfo(date: '2023-10-13', amount: '110元', purpose: '买药'),
                // 更多的捐赠信息...
              ],
              teacherComments: [
                '孩子上课非常认真',
                '总成绩有很大提高',
                '孩子更加积极乐观',
                // 更多的老师评论...
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
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
        ],
      ),
    );
  }
}
