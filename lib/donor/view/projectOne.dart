import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'mainShowBox.dart';

class CardItem {
  final String id;
  final String imagePath;
  final String title;
  final String description;

  CardItem(
      {required this.id,
      required this.imagePath,
      required this.title,
      required this.description});
}

class CustomCard extends StatelessWidget {
  final CardItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomCard(
      {super.key, required this.item, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 6, left: 6, top: 6, bottom: 6),
        decoration: BoxDecoration(
          color: Colors.white, // Added a white background color
          border: Border.all(
            color: Colors.white,
            //width: isSelected ? 3.0 : 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .stretch, // Change to stretch for horizontal centering
          children: <Widget>[
            Image.asset(
              item.imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 160.0,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(
                    8.0), // Added padding for the entire expanded container
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      item.title,
                      textAlign: TextAlign
                          .center, // Center text alignment for the title
                      style: const TextStyle(
                          fontSize: 20.0,
                          color: Color.fromARGB(255, 110, 82, 87)),
                    ),
                    Text(
                      item.description,
                      maxLines: 1, // Show only one line
                      overflow:
                          TextOverflow.ellipsis, // Add ellipsis if it overflows
                      style: const TextStyle(
                          fontSize: 16.0,
                          color: Color.fromARGB(255, 110, 82, 87)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardCarousel extends StatefulWidget {
  final List<CardItem> items;

  const CardCarousel({super.key, required this.items});

  @override
  _CardCarouselState createState() => _CardCarouselState();
}

class _CardCarouselState extends State<CardCarousel> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselSlider.builder(
          itemCount: widget.items.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return CustomCard(
              item: widget.items[index],
              isSelected: index == _selectedIndex,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(item: widget.items[index]),
                  ),
                );
              },
            );
          },
          options: CarouselOptions(
            height: 250.0,
            viewportFraction: 1.0, // 保证等大的卡片
            autoPlay: true, // 开启自动播放
            autoPlayInterval: const Duration(seconds: 3), // 自动播放的间隔时间
            autoPlayAnimationDuration: const Duration(milliseconds: 800), // 动画执行的时间
            autoPlayCurve: Curves.fastOutSlowIn, // 动画曲线
            enlargeCenterPage: false, // 不需要放大中间页面
            onPageChanged: (index, reason) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ],
    );
  }
}

class DetailPage extends StatelessWidget {
  final CardItem item;

  const DetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          item.title,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 152, 92, 88),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              // Action for the icon button
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 245, 241, 233),
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView for scrollable content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.stretch, // 默认就是 stretch，可根据需求更改
                children: <Widget>[
                  Center(
                    // Center the image container
                    child: Container(
                      width: 360,
                      height: 240,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Image.asset(
                        item.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: CharityInfoCard(
                        title: item.title, detailInfo: item.description),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: SsdButton(text: '进行捐助', onTap: onTapDonate),
            ),
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
      ], selectedItemColor: const Color.fromARGB(255, 152, 92, 88)),
    );
  }

  // 捐款按钮点击回调方法
  void onTapDonate() {
    print('捐款按钮被点击');
    // 在这里添加你的逻辑
  }
}

//单个项目卡片
// Updated CharityProjectCard class
class CharityProjectCard extends StatelessWidget {
  final CardItem item; // Using CardItem model for data
  final VoidCallback onTap;

  const CharityProjectCard({super.key, 
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
                item: item), // Navigating to DetailPage with the item
          ),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
        ),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double totalHeight = constraints.maxHeight;
            double imageHeight =
                totalHeight * (1.82 / 3); // Image height is 2/3 of total height
            double textSectionHeight = totalHeight *
                (1 / 3); // Text section height is 1/3 of total height

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  item.imagePath,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: imageHeight,
                ),
                Container(
                  height: textSectionHeight,
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        item.title,
                        style: const TextStyle(
                            fontSize: 17,
                            //fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 85, 46, 43),
                            height: 1.1),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        item.description,
                        style: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 139, 115, 109),
                            height: 1.1),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Text(
                        '主办机构：红十字会',
                        style: TextStyle(
                            color: Color.fromARGB(255, 164, 146, 143),
                            fontSize: 14,
                            height: 1.1),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

//单个项目卡片组成的GridView
class GridCardView extends StatelessWidget {
  final List<CardItem> items;

  const GridCardView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(9, 8, 9, 0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 每行显示两个卡片
        crossAxisSpacing: 5, // 横向间隔
        mainAxisSpacing: 5, // 纵向间隔
        childAspectRatio: 0.9, // 宽高比例，根据需求调整
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        // 获取单个项目
        final item = items[index];

        // 返回CharityProjectCard
        return CharityProjectCard(
          item: item,
          onTap: () {
            // 定义点击事件，例如导航到详情页
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(item: item),
              ),
            );
          },
        );
      },
    );
  }
}

//项目信息卡片
class CharityInfoCard extends StatelessWidget {
  final String title;
  final String detailInfo;

  const CharityInfoCard({super.key, 
    required this.title,
    required this.detailInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 249, 247, 247), // 背景
        borderRadius: BorderRadius.circular(10.0), // 圆角设置
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 24.0, // 标题字体大小调整
                color: Color.fromARGB(255, 97, 71, 75)
                //fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Wrap(
                // 使用Wrap来避免Expanded的影响，并且让盒子内容尽可能小
                children: [
                  _buildInfoBox('公益活动'),
                  _buildInfoBox('素质教育'),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            color: Color.fromARGB(255, 232, 224, 224), // 设置分割线颜色
            thickness: 1.0,
          ),
          const SizedBox(height: 4.0),
          Text(
            detailInfo,
            style: const TextStyle(
                fontSize: 17.0,
                color: Color.fromARGB(255, 110, 82, 87)), // 详细信息字体大小调整
          ),
          const SizedBox(height: 12.0),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIconInfo(Icons.access_time, '上线筹款1.2年'),
                  _buildIconInfo(Icons.check_circle_outline, '已提交计划、预算'),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIconInfo(Icons.feedback, '累计反馈154次'),
                  _buildIconInfo(Icons.attach_money, '近一年披露财务2次'),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              const Divider(
                color: Color.fromARGB(255, 232, 224, 224), // 设置分割线颜色
                thickness: 1.0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: CharityInstitutionInfo(institutionName: "红十字会"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBox(String text) {
    return Container(
      margin: const EdgeInsets.only(right: 8.0), // 为了保持一点距离
      padding:
          const EdgeInsets.symmetric(horizontal: 9.0, vertical: 6.0), // 根据内容调整padding
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(95, 121, 34, 34)),
        borderRadius: BorderRadius.circular(6), // 方框圆角
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15.0,
          color: Color.fromARGB(95, 121, 34, 34),
        ), // 文字大小也可以根据需求调整
      ),
    );
  }

  Widget _buildIconInfo(IconData icon, String text) {
    return Column(
      children: [
        Icon(
          icon,
          size: 35.0, // 图标大小调整
          color: const Color.fromARGB(255, 187, 126, 128),
        ),
        const SizedBox(height: 4),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 14.0,
              color: Color.fromARGB(255, 165, 144, 144) // 文字大小调整
              ),
        ),
      ],
    );
  }
}

//公益机构icon
class CharityInstitutionInfo extends StatelessWidget {
  final String institutionName;

  const CharityInstitutionInfo({
    Key? key,
    required this.institutionName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0), // 容器内左右padding
      child: Row(
        children: [
          const Icon(
            Icons.public, // 使用一个代表“公益”的图标
            color: Color.fromARGB(255, 164, 146, 143), // 图标颜色可以根据需求调整
          ),
          const SizedBox(width: 10), // 图标和文字之间的间距
          Expanded(
            child: Text(
              '执行与收款机构：$institutionName',
              style: const TextStyle(
                  fontSize: 17,
                  color: Color.fromARGB(255, 164, 146, 143)), // 文字大小可以根据需要调整
            ),
          ),
        ],
      ),
    );
  }
}
