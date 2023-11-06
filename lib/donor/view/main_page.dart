import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'mainShowBox.dart'; // 确保这里的路径是正确的

class MainPage extends StatelessWidget {
  const MainPage({super.key});

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
      body: SingleChildScrollView(
        // 使用 SingleChildScrollView
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true, // 自动播放
                  autoPlayInterval: const Duration(seconds: 3), // 自动播放间隔时间
                  height: 165.0, // 设置图片轮播组件的高度
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
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0), // 设置圆角半径
                  child: Container(
                    width: 380.0, // 设置固定宽度
                    height: 180.0, // 设置固定高度
                    color: const Color.fromARGB(255, 243, 227, 227), // 设置背景颜色为白色
                    child: Column(
                      //mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 10, left: 10, top: 13),
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              const Divider(
                                color:
                                    Color.fromARGB(255, 152, 92, 88), // 分割线颜色
                                thickness: 1, // 分割线厚度
                              ),
                              Container(
                                color: const Color.fromARGB(
                                    255, 243, 227, 227), // 背景色应与父容器相同
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    '捐赠总览',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Color.fromARGB(255, 139, 49, 43),
                                      //fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(5.0),
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
              const DonationCard(
                title: '爱心捐赠',
                content: '郭老师捐了爱心大蛋糕给云南小朋友,还帮助小朋友背诵将进酒。',
                image: 'assets/zuijinjuanzhu.png',
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // 设置主轴对齐方式为居中
                children: [
                  SsdButton(text: '捐助儿童', onTap: onTap),
                  const SizedBox(width: 50), // 两个按钮之间的间隔，可以根据需要调整
                  SsdButton(text: '捐助项目', onTap: onTap),
                ],
              )
            ],
          ),
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

  //跳转页面
  void onTap() {}
}
