import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'mainShowBox.dart'; // 确保这里的路径是正确的

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('明光筑梦'), // 在这里设置 AppBar 的标题
        backgroundColor: Colors.pink, // 设置 AppBar 的背景颜色
      ),
      backgroundColor: Color.fromARGB(255, 244, 215, 227),
      body: SingleChildScrollView(
        // 使用 SingleChildScrollView
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true, // 自动播放
                  autoPlayInterval: Duration(seconds: 3), // 自动播放间隔时间
                  height: 200.0, // 设置图片轮播组件的高度
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
              /* Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      'assets/heart.png',
                      width: 150, // 修改图片宽度
                      height: 150, // 修改图片高度
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center, // 添加垂直居中对齐
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Text(
                            "明光筑梦",
                            style: GoogleFonts.dmSerifDisplay(
                              fontSize: 30, // 修改字体大小
                              color: Colors.yellow[800],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Text(
                            "积小善，成大德",
                            style: GoogleFonts.dmSerifDisplay(
                              fontSize: 25, // 修改字体大小
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ), */
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0), // 设置圆角半径
                  child: Container(
                    width: 380.0, // 设置固定宽度
                    height: 270.0, // 设置固定高度
                    color: Color.fromARGB(255, 244, 215, 227), // 设置背景颜色为白色
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            '捐赠总览',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
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
              DonationCard(
                title: '爱心捐赠',
                content: '郭老师捐了爱心大蛋糕给云南小朋友,还帮助小朋友背诵将进酒。',
                image: 'assets/zuijinjuanzhu.png',
              ),
              SizedBox(
                height: 20,
              ),
              Center(child: SsdButton(text: '捐助儿童', onTap: onTap)),
              SizedBox(
                height: 20,
              ),
              Center(child: SsdButton(text: '捐助项目', onTap: onTap)),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const[
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

  //跳转页面
  void onTap() {}
}
