import 'package:flutter/material.dart';
import 'mainShowBox.dart';

class ChildInfoPage extends StatelessWidget {
  final String imagePath;
  final String name;
  final String school;
  final String age;
  final String detail;

  const ChildInfoPage({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.school,
    required this.age,
    required this.detail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '明光筑梦',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        centerTitle: true, // 在这里设置 AppBar 的标题
        backgroundColor: Color.fromARGB(255, 152, 92, 88), // 设置 AppBar 的背景颜色
      ),
      backgroundColor: Color.fromARGB(255, 243, 240, 239),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            // 第一个部分，图片
            Container(
              width: MediaQuery.of(context).size.width / 1.18, // 设置容器宽度为屏幕宽度
              height: 260.0, // 设置容器高度
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0), // 设置圆角半径
                color: Color.fromARGB(255, 250, 240, 240), // 设置背景颜色为白色
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0), // 设置圆角半径
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover, // 图片填充方式
                ),
              ),
            ),
            // 第二个部分，文本内容
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 13, bottom: 10),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0), // 设置圆角半径
                color: const Color.fromARGB(255, 251, 250, 250), // 设置背景颜色为白色
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '姓名：$name',
                    style: TextStyle(
                      fontSize: 19.0,
                      color: Color.fromARGB(255, 59, 38, 36), // 字体大小
                    ),
                  ),
                  SizedBox(height: 8.0), // 间隔
                  Text(
                    '学校：$school',
                    style: TextStyle(
                      fontSize: 19.0,
                      color: Color.fromARGB(255, 59, 38, 36), // 字体大小
                    ),
                  ),
                  SizedBox(height: 8.0), // 间隔
                  Text(
                    '年龄：$age',
                    style: TextStyle(
                      fontSize: 19.0, // 字体大小
                      color: Color.fromARGB(255, 59, 44, 42),
                    ),
                  ),
                  SizedBox(height: 8.0), // 间隔
                  Text(
                    '详细信息：$detail',
                    style: TextStyle(
                      fontSize: 19.0, height: 1.5,
                      color: Color.fromARGB(255, 59, 38, 36), // 字体大小
                    ),
                  ),
                ],
              ),
            ),
            // 第三个部分，按钮
            SizedBox(
              height: 13,
            ),
            SsdButton(text: '进行捐助', onTap: onTapDonate),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
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
      ], selectedItemColor: Color.fromARGB(255, 152, 92, 88)),
    );
  }

  // 捐款按钮点击回调方法
  void onTapDonate() {
    print('捐款按钮被点击');
    // 在这里添加你的逻辑
  }
}
