import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../model/activity.dart';
import '../view/button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 139, 49, 43),
          centerTitle: true, // 这将使标题水平居中对齐
          title: const Text(
            "明光筑梦",
            style: TextStyle(
                color: Colors.white, // 设置你想要的颜色
                fontSize: 22),
          ),
          actions: [
            //cart button
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/newPage');
              },
              icon: const Icon(Icons.notifications_active),
            )
          ],
        ),
        body: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true, // 自动播放
                autoPlayInterval: Duration(seconds: 3), // 自动播放间隔时间
              ),
              items: [
                // 这里放入你的图片
                Image.asset('assets/images/wenju.jpg'),
                Image.asset('assets/images/wenju2.jpg'),
              ],
            ),

            const SizedBox(height: 25),
            Text(
              textAlign: TextAlign.left, // 文本靠左对齐
              '———— 最新动态 ————',
              style: TextStyle(
                color: const Color.fromARGB(255, 139, 49, 43), // 设置你想要的颜色
                fontSize: 20, //大小
              ),
            ),
            SizedBox(height: 10),
            //写builder
            Expanded(
                child: ListView.builder(
                    itemCount: activities.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.all(8.0),
                        child: Column(children: <Widget>[
                          ListTile(
                            title: Text(activities[index].name,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 116, 37, 32))),
                            subtitle: Text(activities[index].activity,
                                style: TextStyle(fontSize: 17)),
                            trailing: Text(
                              activities[index].publishDate,
                              style: TextStyle(color: Colors.grey[400]),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: Image.asset(
                              activities[index].imageURL,
                              height: 200,
                              width: 500,
                            ),
                          ),
                          // 使用Image.asset来加载本地图像

                          //cart button
                          Row(
                            children: [
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/newPage');
                                    },
                                    icon: const Icon(Icons.thumb_up),
                                  ),
                                  Text('点赞')
                                ],
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/newPage');
                                    },
                                    icon: const Icon(Icons.comment),
                                  ),
                                  Text('评论')
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ]),
                      );
                    })),

            //底部导航栏
            BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled),
                  label: "主页",
                  //backgroundColor: Color.fromARGB(255, 139, 49, 43)
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.insert_chart),
                  label: "排行榜",
                  //backgroundColor: Color.fromARGB(255, 139, 49, 43)
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.rate_review),
                  label: "捐赠记录",
                  //backgroundColor: Color.fromARGB(255, 139, 49, 43)
                )
              ],
            )
          ],
        ));
  }
}
