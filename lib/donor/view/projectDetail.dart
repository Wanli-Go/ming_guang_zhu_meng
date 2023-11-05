import 'projectDetailShowBox.dart';
import 'package:flutter/material.dart';
import 'projectOne.dart';

class DonarProjectPage extends StatelessWidget {
  const DonarProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<CardItem> items = [
      CardItem(
        id: '1',
        imagePath: 'assets/changePic1.png',
        title: '关心留守儿童爱心午餐',
        description: '爱心午餐我吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃',
      ),
      CardItem(
        id: '1',
        imagePath: 'assets/zuijinjuanzhu.png',
        title: '捐赠留守儿童小学课本',
        description: '小学课本我学学学学学学学学学学学学学学学学学学学学学学学学学学学学学学学学学学学学学学',
      ),
    ];

    // Your project data
    List<CardItem> projects = [
      CardItem(
          id: '1',
          imagePath: 'assets/heart.png',
          title: '爱心午餐项目',
          description:
              '云南省宣威市阿都乡，地处乌蒙山，云南最边远的乡镇之一。\n土豆和苞米是这片土地上最常见的粮食作物，也是当地人饭桌上的常客，小国辉是从小在阿都乡长大的孩子，食物来源的单一，多元营养的缺乏，导致他和城市的同龄孩子相比，显得十分瘦小。\n因为家中的一亩三分地无法满足全家人的生活需求，父母选择了外出打工，他和年迈的爷爷奶奶被“留守”在了这片土地。'),
      CardItem(
          id: '1',
          imagePath: 'assets/heart.png',
          title: '爱心午餐项目',
          description: '为留守儿童提供营养午餐为留守儿童提供营养午餐为留守儿童提供营养午餐为留守儿童提供营养午餐'),
      CardItem(
          id: '1',
          imagePath: 'assets/heart.png',
          title: '爱心午餐项目',
          description: '为留守儿童提供营养午餐为留守儿童提供营养午餐为留守儿童提供营养午餐为留守儿童提供营养午餐'),
      CardItem(
          id: '1',
          imagePath: 'assets/heart.png',
          title: '爱心午餐项目',
          description: '为留守儿童提供营养午餐为留守儿童提供营养午餐为留守儿童提供营养午餐为留守儿童提供营养午餐'),
    ];

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
      backgroundColor: Color.fromARGB(255, 245, 241, 233),
      body: Column(
        children: <Widget>[
          SizedBox(height: 2),
          CardCarousel(items: items),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 3, right: 3),
            child: CategorySelector(),
          ),
          SizedBox(height: 5),
          Expanded(
            child: GridCardView(items: projects),
          ),
        ],
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
      ], selectedItemColor: Color.fromARGB(255, 152, 92, 88)),
    );
  }

  // Here, you can define the onTapDonate method or other methods as needed
}

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class ProductCard extends StatefulWidget {
//   @override
//   _ProductCardState createState() => _ProductCardState();
// }

// class _ProductCardState extends State<ProductCard> {
//   List<Map<String, String>> products = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     // 发起 HTTP GET 请求
//     var response = await http.get(Uri.parse('https://your-backend-api.com/products'));
//     if (response.statusCode == 200) {
//       // 如果服务器返回 200 OK 响应，解析 JSON
//       var data = json.decode(response.body);
//       List<Map<String, String>> products = [];
//       for (var item in data) {
//         products.add({
//           'title': item['title'],
//           'image': item['image'],
//           'description': item['description'],
//         });
//       }
//       // 更新状态
//       setState(() {
//         this.products = products;
//       });
//     } else {
//       // 如果服务器没有返回 200 OK 响应，抛出异常
//       throw Exception('Failed to load products');
//     }
//   }

//   // ...其他代码省略
// }
