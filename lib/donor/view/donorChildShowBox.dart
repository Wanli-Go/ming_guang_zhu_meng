import 'package:flutter/material.dart';

//儿童类别选择组件
class CategorySelector extends StatefulWidget {
  const CategorySelector({Key? key}) : super(key: key);

  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  final List<String> categories = ['全部', '经济困难', '留守儿童', '学业困难'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => VerticalDivider(
          color: Colors.black,
          thickness: 1,
          width: 1,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
            onTap(categories[index]);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.center,
            child: Text(
              categories[index],
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: index == selectedIndex
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onTap(String category) {
    print('选中了$category');
  }
}

//儿童个人选项卡组件
class InfoCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String region;
  final String situation;

  const InfoCard({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.region,
    required this.situation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0, // 高度
      padding: EdgeInsets.all(8.0), // 边距
      decoration: BoxDecoration(
        color: Colors.white, // 背景颜色
        borderRadius: BorderRadius.circular(12.0), // 圆角
      ),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0), // 圆角
            child: Image.asset(
              imagePath,
              width:
                  MediaQuery.of(context).size.width * 1 / 3, // 设置图片宽度为屏幕宽度的1/3
              height: 120.0, // 设置图片高度
              fit: BoxFit.cover, // 图片填充方式
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround, // 平均分布
                children: <Widget>[
                  Text(
                    '姓名：$name',
                    style: TextStyle(
                      fontSize: 16.0, // 字体大小
                    ),
                  ),
                  Text(
                    '地区：$region',
                    style: TextStyle(
                      fontSize: 16.0, // 字体大小
                    ),
                  ),
                  Text(
                    '个人情况：$situation',
                    style: TextStyle(
                      fontSize: 16.0, // 字体大小
                    ),
                  ),
                  GestureDetector(
                    onTap: onTapDetail,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '详情',
                        style: TextStyle(
                          color: Colors.blue, // 字体颜色
                          fontSize: 16.0, // 字体大小
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 点击详情的回调方法
  void onTapDetail() {
    print('详情被点击');
    // 在这里添加你的逻辑
  }
}
