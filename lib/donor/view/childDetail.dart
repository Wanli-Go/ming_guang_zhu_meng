import 'package:flutter/material.dart';
import 'mainShowBox.dart';
import 'collectMainPage.dart';

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
    // 获取屏幕宽度
    double screenWidth = MediaQuery.of(context).size.width;
    
    // 可以根据屏幕宽度调整尺寸和边距
    double padding = screenWidth * 0.05; // 5% of the screen width
    double imageSize = screenWidth * 0.9; // 90% of the screen width
    double topMargin = screenWidth * 0.05;
    double textFontSize = screenWidth * 0.045; // Font size that scales with the screen width

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '明光筑梦',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 152, 92, 88),
      ),
      backgroundColor: Color.fromARGB(255, 243, 240, 239),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: topMargin),
            // Image container with relative size
            Container(
              width: imageSize,
              height: screenWidth * 0.65, // 65% of the screen width
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Color.fromARGB(255, 250, 240, 240),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Text content with relative padding and font size
            Container(
              margin: EdgeInsets.all(padding),
              padding: EdgeInsets.all(padding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color.fromARGB(255, 251, 250, 250),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '姓名：$name',
                    style: TextStyle(
                      fontSize: textFontSize,
                      color: Color.fromARGB(255, 59, 38, 36),
                    ),
                  ),
                  SizedBox(height: padding), // Use the same padding for consistency
                  Text(
                    '学校：$school',
                    style: TextStyle(
                      fontSize: textFontSize,
                      color: Color.fromARGB(255, 59, 38, 36),
                    ),
                  ),
                  SizedBox(height: padding),
                  Text(
                    '年龄：$age',
                    style: TextStyle(
                      fontSize: textFontSize,
                      color: Color.fromARGB(255, 59, 44, 42),
                    ),
                  ),
                  SizedBox(height: padding),
                  Text(
                    '详细信息：$detail',
                    style: TextStyle(
                      fontSize: textFontSize,
                      height: 1.5,
                      color: Color.fromARGB(255, 59, 38, 36),
                    ),
                  ),
                ],
              ),
            ),
            TagWidget(),
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
