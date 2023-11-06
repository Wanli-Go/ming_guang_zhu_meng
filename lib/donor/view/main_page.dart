import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'mainShowBox.dart'; // 确保这里的路径是正确的

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 获取屏幕大小
    final screenSize = MediaQuery.of(context).size;

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
      backgroundColor: Color.fromARGB(255, 239, 229, 229),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true, // 自动播放
                  autoPlayInterval: Duration(seconds: 3), // 自动播放间隔时间
                  height: screenSize.height * 0.25, // 根据屏幕高度设定相对高度
                  enlargeCenterPage: true, // 设置中间的图片更大
                  viewportFraction: 0.95, // 设置每个页面占用的屏幕宽度比例
                  pageSnapping: false, // 设置页面是否对齐
                ),
                items: [
                  // 这里放入你的图片
                  Image.asset('assets/changePic1.png'),
                  Image.asset('assets/changePic2.png'),
                  Image.asset('assets/changePic3.png'),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0), // 设置圆角半径
                  child: Container(
                    width: screenSize.width * 0.9, // 设置相对宽度
                    color: Color.fromARGB(255, 243, 227, 227), // 设置背景颜色
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 10, left: 10, top: 13),
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Divider(
                                color: Color.fromARGB(255, 152, 92, 88), // 分割线颜色
                                thickness: 1, // 分割线厚度
                              ),
                              Container(
                                color: Color.fromARGB(
                                    255, 243, 227, 227), // 背景色应与父容器相同
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    '捐赠总览',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Color.fromARGB(255, 139, 49, 43),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(
                            child: DonationRowWidget(
                              amount1: '1000万元',
                              amount2: '100位',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenSize.height*0.000005), // 根据屏幕高度设置间隔
              DonationCard(
                title: '爱心捐赠',
                content: '郭老师捐了爱心大蛋糕给云南小朋友,还帮助小朋友背诵将进酒。',
                image: 'assets/zuijinjuanzhu.png',
              ),
              SizedBox(height: screenSize.height * 0.02), // 根据屏幕高度设置间隔
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // 设置主轴对齐方式为居中
                children: [
                  DonarButton(text: '捐助儿童', onTap: () => onTap(context)),
                  SizedBox(width: screenSize.width * 0.1), // 根据屏幕宽度设置间隔
                  DonarButton(text: '捐助项目', onTap: () => onTap(context)),
                ],
              ),
              SizedBox(height: screenSize.height * 0.02), // 根据屏幕高度设置间隔
            ],
          ),
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
        selectedItemColor: Color.fromARGB(255, 152, 92, 88),
      ),
    );
  }

  // 这里可以放置跳转页面的逻辑
  void onTap(BuildContext context) {
    // Perform navigation
  }
}

// 确保 DonationRowWidget 和 SsdButton 都是可以使用的组件，并且适当地响应 onTap 事件。



//最近捐赠模块
class DonationCard extends StatelessWidget {
  final String title; // 加粗标题
  final String content; // 文章内容
  final String image; // 图片

  DonationCard({
    Key? key,
    required this.title,
    required this.content,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16, bottom: 8, left: 14, right: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 标题“最近捐助”和分割线
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 10.0),
                  height: 1.0, // 分割线粗细
                  color: Color.fromARGB(255, 139, 49, 43), // 分割线颜色
                ),
              ),
              Text(
                '最近捐助',
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 139, 49, 43),
                  //fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 10.0),
                  height: 1.0, // 分割线粗细
                  color: Color.fromARGB(255, 152, 92, 88), // 分割线颜色
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          // 图片和文字描述部分
          Container(
            padding: EdgeInsets.only(
                left: 12, right: 12, top: 12, bottom: 12), // 内边距
            margin: EdgeInsets.only(top: 4), // 外边距
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0), // 边框的圆角
              color: Colors.white, // 容器的填充颜色
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2), // 阴影颜色
                  spreadRadius: 1, // 阴影扩散程度
                  blurRadius: 5, // 阴影模糊程度
                  offset: Offset(0, 1), // 阴影的位置偏移
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 图片区域
                ClipRRect(
                  borderRadius: BorderRadius.circular(7.0),
                  child: Image.asset(
                    image,
                    width: 115.0, // 设置图片固定宽度
                    height: 115.0, // 设置图片固定高度
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 13.0),
                // 文字描述部分
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 23.0,
                          color: Color.fromARGB(255, 110, 67, 63),
                        ),
                      ),
                      SizedBox(height: 9.0),
                      Text(
                        content,
                        style: TextStyle(
                          fontSize: 19,
                          height: 1.3,
                          color: Color.fromARGB(133, 156, 70, 70),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//button
class DonarButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const DonarButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenWidth / 2.5, // Width is one third of the screen width
        height: 50, // Height remains the same
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 169, 103, 98).withOpacity(0.8),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.only(top: 6, bottom: 5), // Padding can be adjusted as needed
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 19,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 6, height: 8),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
