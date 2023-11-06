import 'package:flutter/material.dart';
import 'projectOne.dart';
import 'donorChild.dart';

class collectMainPage extends StatelessWidget {
  const collectMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '我的收藏',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 152, 92, 88),
      ),
      backgroundColor: Color.fromARGB(255, 239, 229, 229),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20),
          CharityProjectCardCollect(
            item: CardItem(
                id: '1',
                imagePath: 'assets/heart.png',
                title: '爱心午餐项目',
                description: '为留守儿童提供营养午餐为留守儿童提供营养午餐为留守儿童提供营养午餐为留守儿童提供营养午餐'),
            onTap: () {
              // 定义点击事件，例如导航到详情页
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    item: CardItem(
                        id: '1',
                        imagePath: 'assets/heart.png',
                        title: '爱心午餐项目',
                        description:
                            '为留守儿童提供营养午餐为留守儿童提供营养午餐为留守儿童提供营养午餐为留守儿童提供营养午餐'),
                  ),
                ),
              );
            },
          ),
        ],
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
      ]),
    );
  }
}

//单个项目卡片 收藏夹使用
class CharityProjectCardCollect extends StatelessWidget {
  final CardItem item; // Using CardItem model for data
  final VoidCallback onTap;

  CharityProjectCardCollect({
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
        ),
        child: Row(
          // 使用 Row 而不是 Column
          children: <Widget>[
            Image.asset(
              item.imagePath,
              width: 100.0, // 为图片设置固定宽度
              fit: BoxFit.cover,
              height: 100.0, // 为图片设置固定高度
            ),
            Expanded(
              // 使用 Expanded 小部件
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//孩子详情标签
class TagWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 获取屏幕宽度
    double screenWidth = MediaQuery.of(context).size.width;
    // 可以根据屏幕宽度调整尺寸和边距
    double padding = screenWidth * 0.05; // 5% of the screen width
    double imageSize = screenWidth * 0.9; // 90% of the screen width
    double topMargin = screenWidth * 0.05;
    double textFontSize =
        screenWidth * 0.045; // Font size that scales with the screen width
    return Container(
      margin: EdgeInsets.all(padding),
      padding: EdgeInsets.all(padding/2),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 255, 255, 255), width: 2), // 添加边框
        borderRadius: BorderRadius.circular(12), // 最外层的圆角
        color: Colors.white, // 设置背景颜色，如果需要的话
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 8), // 添加一些垂直间隔
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildTagItem(Icons.home, '留守儿童'),
              _buildTagItem(Icons.settings, '缺乏生活设施'),
            ],
          ),
          SizedBox(height: 8), // 添加行之间的间隔
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildTagItem(Icons.money, '未交学费书费'),
              _buildTagItem(Icons.child_friendly, '需要衣物'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTagItem(IconData iconData, String text) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(2.0),
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(iconData, size: 20),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(text),
            ),
          ],
        ),
      ),
    );
  }
}
