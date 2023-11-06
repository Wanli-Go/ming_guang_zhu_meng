import 'package:flutter/material.dart';
import 'projectOne.dart';

class CollectMainPage extends StatelessWidget {
  const CollectMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的收藏'), // 在这里设置 AppBar 的标题
        backgroundColor: Colors.pink, // 设置 AppBar 的背景颜色
      ),
      backgroundColor: const Color.fromARGB(255, 244, 215, 227),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 20),
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
          const Center(
            child: TagWidget(),
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

  const CharityProjectCardCollect({super.key, 
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
                  style: const TextStyle(
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
  const TagWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2), // 添加边框
        borderRadius: BorderRadius.circular(12), // 最外层的圆角
        color: Colors.white, // 设置背景颜色，如果需要的话
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 8), // 添加一些垂直间隔
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildTagItem(Icons.home, '留守儿童'),
              _buildTagItem(Icons.settings, '缺乏基本生活设施'),
            ],
          ),
          const SizedBox(height: 4), // 添加行之间的间隔
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildTagItem(Icons.child_friendly, '未交学费和书费'),
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
        margin: const EdgeInsets.all(4.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
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