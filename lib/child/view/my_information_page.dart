import 'package:flutter/material.dart';
import 'package:ming_guang/child/model/child.dart';
import 'package:ming_guang/donor/components/button.dart';
import 'package:ming_guang/donor/theme/color.dart';

class MyInfomationPage extends StatefulWidget {
  const MyInfomationPage({super.key});

  @override
  State<MyInfomationPage> createState() => _MyInfomationState();
}

class _MyInfomationState extends State<MyInfomationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(255, 246, 105, 164).withOpacity(0.5),
        title: const Center(child: Text('我的')),
      ),
      body: Container(
        color: primaryColor,
        child: ListView(
          children: [
            // 第一个容器：个人信息
            Container(
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.5), // 方框的背景颜色
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.white, // 方框边框颜色
                  width: 1.0, // 方框边框宽度
                ),

                //阴影
                boxShadow: [
                  BoxShadow(
                    color:
                        primaryColor.withOpacity(0.5).withOpacity(0.5), // 阴影颜色
                    spreadRadius: 0, // 扩散半径
                    blurRadius: 5, // 模糊半径
                    offset: const Offset(0, 3), // 阴影偏移量
                  ),
                ],

                //背景颜色渐变
                gradient: LinearGradient(
                  // 线性渐变
                  begin: Alignment.topLeft, // 渐变开始的位置
                  end: Alignment.bottomRight, // 渐变结束的位置
                  colors: [
                    primaryColor, // 开始颜色
                    Colors.white, // 结束颜色
                  ],
                ),
              ),
              margin: const EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(child.imagePath), // 小孩头像的路径
                      radius: 30,
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(child.name,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Text(child.school),
                          Text('已获得捐助金额: ${child.getMoney}元'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            // 第二个容器：积分和排名
            Container(
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.5), // 方框的背景颜色
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.white, // 方框边框颜色
                  width: 1.0, // 方框边框宽度
                ),

                //阴影
                boxShadow: [
                  BoxShadow(
                    color:
                        primaryColor.withOpacity(0.5).withOpacity(0.5), // 阴影颜色
                    spreadRadius: 0, // 扩散半径
                    blurRadius: 5, // 模糊半径
                    offset: const Offset(0, 3), // 阴影偏移量
                  ),
                ],

                //背景颜色渐变
                gradient: LinearGradient(
                  // 线性渐变
                  begin: Alignment.topLeft, // 渐变开始的位置
                  end: Alignment.bottomRight, // 渐变结束的位置
                  colors: [
                    primaryColor, // 开始颜色
                    Colors.white, // 结束颜色
                  ],
                ),
              ),
              margin: const EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('学习积分: ${child.studyIntegral}'),
                        Text('商城积分: ${child.mallIntegral}'),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('总排名: ${child.totalRanking}'),
                        Text('本周排名: ${child.weekRanking}'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // 第三个容器：志愿者信息及操作
            Container(
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.5), // 方框的背景颜色
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.white, // 方框边框颜色
                  width: 1.0, // 方框边框宽度
                ),

                //阴影
                boxShadow: [
                  BoxShadow(
                    color:
                        primaryColor.withOpacity(0.5).withOpacity(0.5), // 阴影颜色
                    spreadRadius: 0, // 扩散半径
                    blurRadius: 5, // 模糊半径
                    offset: const Offset(0, 3), // 阴影偏移量
                  ),
                ],

                //背景颜色渐变
                gradient: LinearGradient(
                  // 线性渐变
                  begin: Alignment.topLeft, // 渐变开始的位置
                  end: Alignment.bottomRight, // 渐变结束的位置
                  colors: [
                    primaryColor, // 开始颜色
                    Colors.white, // 结束颜色
                  ],
                ),
              ),
              margin: const EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.volunteer_activism),
                          onPressed: () {},
                        ),
                        const Text('志愿者信息'),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.contact_phone),
                          onPressed: () {},
                        ),
                        const Text('联系志愿者'),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.assignment),
                          onPressed: () {},
                        ),
                        const Text('任务统计'),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // 信息修改
            ListTile(
              leading: const Icon(Icons.edit), // 使用编辑图标
              title: const Text('信息修改'),
              onTap: () {
                // 处理点击事件，例如导航到信息修改页面
              },
            ),
            // 系统设置
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('系统设置'),
              onTap: () {
                // 处理点击事件
              },
            ),
            // 功能反馈
            ListTile(
              leading: const Icon(Icons.feedback),
              title: const Text('功能反馈'),
              onTap: () {
                // 处理点击事件
              },
            ),

            const SizedBox(
              height: 10,
            ),

            MyButton(text: "退出登录", onTap: () {})
          ],
        ),
      ),
      // 底部栏
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '主页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '商城',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: '任务',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '我的',
          ),
        ],
        // 未选中的项使用灰色图标
        unselectedItemColor: Colors.grey,
        // 选中的项使用主题色
        selectedItemColor: Theme.of(context).primaryColor,
        // 你可以根据页面状态来更新currentIndex
        currentIndex: 3, // 假设当前在“我的”页面
        onTap: (index) {
          // 这里处理点击不同按钮的响应
        },
      ),
    );
  }
}
