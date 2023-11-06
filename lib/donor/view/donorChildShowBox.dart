import 'package:flutter/material.dart';

//儿童类别选择组件
class CategorySelector extends StatefulWidget {
  const CategorySelector({super.key});

  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  final List<String> categories = ['全部', '经济拮据', '留守儿童', '学业困难'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0, // Set a fixed height for the horizontal ListView
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 252, 252),
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
            vertical: 10), // Add vertical padding if needed
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => const VerticalDivider(
          color: Color.fromARGB(
              255, 176, 158, 158), // Change color to make it visible
          width: 1,
          thickness: 2, // Set thickness of the divider
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
            onTap(categories[index]);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.center,
            child: Text(
              categories[index],
              style: TextStyle(
                fontSize: 18.0,
                color: const Color.fromARGB(255, 109, 49, 49),
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
      margin: const EdgeInsets.only(right: 8, left: 8),
      height: 130.0, // 高度
      padding: const EdgeInsets.only(left: 9, right: 9, top: 10, bottom: 10), // 边距
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 252, 252), // 背景颜色
        borderRadius: BorderRadius.circular(10.0), // 圆角
      ),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0), // 圆角
            child: Image.asset(
              imagePath,
              width:
                  MediaQuery.of(context).size.width * 1 / 3, // 设置图片宽度为屏幕宽度的1/3
              height: 115.0, // 设置图片高度
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
                    style: const TextStyle(
                      fontSize: 16.0, height: 1.3,
                      color: Color.fromARGB(255, 114, 39, 39), // 字体大小
                    ),
                  ),
                  Text(
                    '地区：$region',
                    style: const TextStyle(
                      fontSize: 16.0, height: 1.3,
                      color: Color.fromARGB(255, 114, 39, 39), // 字体大小
                    ),
                  ),
                  Text(
                    '个人情况：$situation',
                    style: const TextStyle(
                      fontSize: 16.0,
                      height: 1.3,
                      color: Color.fromARGB(255, 114, 39, 39),
                    ),
                  ),
                  GestureDetector(
                    onTap: onTapDetail,
                    child: const Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisSize: MainAxisSize
                            .min, // 使Row包裹内容，而不是填满CrossAxisAlignment.stretch
                        children: <Widget>[
                          Text(
                            '详情',
                            style: TextStyle(
                              color: Color.fromARGB(255, 169, 29, 29), // 字体颜色
                              fontSize: 17.0, // 字体大小
                            ),
                          ),

                          SizedBox(width: 3.0), // 添加一点间隔

                          Icon(
                            Icons.double_arrow, // 选择适当的图标
                            color: Color.fromARGB(255, 169, 29, 29), // 图标颜色
                            size: 20.0, // 图标大小
                          ),
                        ],
                      ),
                    ),
                  )
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
