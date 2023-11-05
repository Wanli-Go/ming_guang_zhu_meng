import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/my_app.dart';
import 'package:ming_guang/volunteer/view/task-page.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
   Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar( 
        backgroundColor: Colors.pink[300],
        title: const Center(child: Text(
          '任务界面',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Rouboto'
          ),
        )),
      ),

      body: TaskPage(),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // 设置当前索引为2
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home,color: Colors.pink[300]),
            label: "主页",
            icon: const Icon(Icons.home_filled)
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home,color: Colors.pink[300]),
            label: "任务批改",
            icon: const Icon(Icons.home_filled)
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home,color: Colors.pink[300]),
            label: "志愿社区",
            icon: const Icon(Icons.home_filled)
          ),
        ],
      ),
    );
  }
}