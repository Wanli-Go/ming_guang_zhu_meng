import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '我的收藏',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const PointsMallPage(),
    );
  }
}

class PointsMallPage extends StatefulWidget {
  const PointsMallPage({Key? key}) : super(key: key);

  @override
  State<PointsMallPage> createState() => _PointsMallPageState();
}

class _PointsMallPageState extends State<PointsMallPage> {
  int userPoints = 1000; // 用户积分数量
  List<Product> allProducts = [
    Product(name: "商品1", points: 100, stock: 10, imageUrl: 'assets/product1.jpg', category: "视频"),
    Product(name: "商品2", points: 200, stock: 5, imageUrl: 'assets/product2.jpg', category: "服装"),
    Product(name: "商品2", points: 200, stock: 5, imageUrl: 'assets/product2.jpg', category: "服装"),
    Product(name: "商品2", points: 200, stock: 5, imageUrl: 'assets/product2.jpg', category: "服装"),
    Product(name: "商品2", points: 200, stock: 5, imageUrl: 'assets/product2.jpg', category: "服装"),
    Product(name: "商品2", points: 200, stock: 5, imageUrl: 'assets/product2.jpg', category: "服装"),
    // 更多商品...
  ];
  List<Product> displayedProducts = [];
  int selectedCategory = 0;
  List<String> categories = ["推荐", "视频", "服装", "文具", "玩具", "图书", "分类"];

  @override
  void initState() {
    super.initState();
    // Initially display all products
    displayedProducts = allProducts;
  }

  void filterProducts(int categoryIndex) {
    if (categoryIndex == 0) {
      displayedProducts = allProducts;
    } else {
      String selectedCategory = categories[categoryIndex];
      displayedProducts = allProducts
          .where((product) => product.category == selectedCategory)
          .toList();
    }
  }

  void showExchangeSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('兑换成功'),
          content: const Text('您已成功兑换商品。'),
          actions: <Widget>[
            TextButton(
              child: const Text('确定'),
              onPressed: () {
                Navigator.of(context).pop(); // 关闭对话框
              },
            ),
          ],
        );
      },
    );
  }

  void showPointsNotEnoughDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('积分不足'),
          content: const Text('您的积分不足以兑换此商品。'),
          actions: <Widget>[
            TextButton(
              child: const Text('好的'),
              onPressed: () {
                Navigator.of(context).pop(); // 关闭对话框
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的收藏'),
        backgroundColor: Colors.pink[300],
      ),
      body: Column(
        children: [
          // 积分展示区域
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 积分信息
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(Icons.monetization_on, color: Colors.amber),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('商城积分'),
                        Text(
                          userPoints.toString(),
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // 我的兑换按钮
              TextButton(
                onPressed: () {
                  // TODO: 跳转到我的兑换页面
                },
                child: const Text('我的兑换>'),
              ),
            ],
          ),

          
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
              ),
              itemCount: displayedProducts.length,
              itemBuilder: (context, index) => ProductCard(
                product: displayedProducts[index],
                onExchange: () {
                  if (userPoints >= displayedProducts[index].points) {
                    setState(() {
                      userPoints -= displayedProducts[index].points;
                    });
                    // ... 兑换成功的逻辑 ...
                    showExchangeSuccessDialog(); // 显示兑换成功的弹窗
                  } else {
                    // ... 积分不足的提示 ...
                    showPointsNotEnoughDialog(); // 显示积分不足的提示
                  }
                },
              ),
            ),
          ),
        ],
      ),
      
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}

class Product {
  String name;
  int points;
  int stock;
  String imageUrl;
  String category;

  Product({
    required this.name,
    required this.points,
    required this.stock,
    required this.imageUrl,
    required this.category,
  });
}

class ProductCard extends StatefulWidget {
  final Product product;
  final VoidCallback onExchange;

  const ProductCard({
    Key? key,
    required this.product,
    required this.onExchange,
  }) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded( // 使图片填充可用空间
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  widget.product.imageUrl,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      iconSize: 30,
                      // icon: Icon(
                      //   isFavorite ? Icons.star : Icons.star,
                      //   color: isFavorite ? Colors.amber : Color.fromARGB(131, 6, 1, 1),
                      // ),
                      icon:Icon(
                        isFavorite ? Icons.favorite : Icons.favorite,
                        color: isFavorite ? Colors.red : Color.fromARGB(138, 75, 74, 74),
                      ),

                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                          // TODO: 添加到收藏夹逻辑
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0), // 统一内边距
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.name,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4), // 用于添加一点垂直空间
                Text('${widget.product.points} 积分'),
                const SizedBox(height: 4), // 用于添加一点垂直空间
                Text('库存: ${widget.product.stock}'),
              ],
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.pink.shade100,
              primary: Colors.white,
            ),
            onPressed: widget.product.stock > 0 ? widget.onExchange : null,
            child: Text(widget.product.stock > 0 ? '兑换' : '无库存'),
          ),
        ],
      ),
    );
  }
}

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.pink[300],
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          label: "主页",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "商城",
          icon: Icon(Icons.store),
        ),
        BottomNavigationBarItem(
          label: "任务",
          icon: Icon(Icons.assignment_turned_in),
        ),
        BottomNavigationBarItem(
          label: "我的",
          icon: Icon(Icons.person),
        ),
      ],
    );
  }
}