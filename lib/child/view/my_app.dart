import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Mytask.dart';
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

      body: ChangeNotifierProvider(
        create: (context) => TapNotifier(),
        child: TaskPage()
        )
      ,

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // 设置当前索引为2
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home,color: Colors.pink[300]),
            label: "主页",
            icon: const Icon(Icons.home_filled)
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home,color: Colors.pink[300]),
            label: "商城",
            icon: const Icon(Icons.home_filled)
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home,color: Colors.pink[300]),
            label: "任务",
            icon: const Icon(Icons.home_filled)
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home,color: Colors.pink[300]),
            label: "我的",
            icon: const Icon(Icons.home_filled)
          )
        ],
      ),
    );
  }
}

class TapNotifier extends ChangeNotifier {

}