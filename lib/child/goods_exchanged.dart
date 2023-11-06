import 'package:flutter/material.dart';
import 'model/goods_exchanged_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return set_page();
  }
}

class set_page extends StatelessWidget {
  const set_page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '积分商城',
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
  List<Product> products = [];
  int filterStatus = 0;

  @override
  void initState() {
    super.initState();
    fetchDataFromBackend();
  }

  void fetchDataFromBackend() {
    var fetchedProducts = [
      Product(
        name: "商品1",
        price: "100积分",
        address: "地址1",
        orderDate: "2023-01-01",
        imageUrl: "assets/product1.jpg",
        status: "待收货",
      ),
      Product(
        name: "商品1",
        price: "100积分",
        address: "地址1",
        orderDate: "2023-01-01",
        imageUrl: "assets/product1.jpg",
        status: "待收货",
      ),
      Product(
        name: "商品1",
        price: "100积分",
        address: "地址1",
        orderDate: "2023-01-01",
        imageUrl: "assets/product1.jpg",
        status: "待收货",
      ),
      Product(
        name: "商品1",
        price: "100积分",
        address: "地址1",
        orderDate: "2023-01-01",
        imageUrl: "assets/product1.jpg",
        status: "待收货",
      ),
      Product(
        name: "商品1",
        price: "100积分",
        address: "地址1",
        orderDate: "2023-01-01",
        imageUrl: "assets/product1.jpg",
        status: "待收货",
      ),
      Product(
        name: "商品1",
        price: "100积分",
        address: "地址1",
        orderDate: "2023-01-01",
        imageUrl: "assets/product1.jpg",
        status: "待收货",
      ),
      Product(
        name: "商品1",
        price: "100积分",
        address: "地址1",
        orderDate: "2023-01-01",
        imageUrl: "assets/product1.jpg",
        status: "待收货",
      ),
      Product(
        name: "商品1",
        price: "100积分",
        address: "地址1",
        orderDate: "2023-01-01",
        imageUrl: "assets/product1.jpg",
        status: "待收货",
      ),
      Product(
        name: "商品1",
        price: "100积分",
        address: "地址1",
        orderDate: "2023-01-01",
        imageUrl: "assets/product1.jpg",
        status: "待收货",
      ),
      // ...更多商品
    ];
    setState(() {
      products = fetchedProducts;
    });
  }

  void switchContent(int status) {
    setState(() {
      filterStatus = status;
      // 这里添加筛选逻辑
      // 注意：这里的逻辑应当放到setState之外，以免在每次构建时重复过滤
    });
    var filteredProducts = products;
    if (filterStatus == 1) {
      filteredProducts = products.where((p) => p.status == "待收货").toList();
    } else if (filterStatus == 2) {
      filteredProducts = products.where((p) => p.status == "已收货").toList();
    }
    setState(() {
      products = filteredProducts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的兑换'),
        backgroundColor: Colors.pink[300],
        elevation: 0, // removes the shadow under the app bar
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => switchContent(0),
                  child: const Text('全部'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink[200], // background (button) color
                    onPrimary: Colors.white, // foreground (text) color
                  ),
                ),
                ElevatedButton(
                  onPressed: () => switchContent(1),
                  child: const Text('待收货'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink[200],
                    onPrimary: Colors.white,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => switchContent(2),
                  child: const Text('已收货'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink[200],
                    onPrimary: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductListItem(product: products[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}

class ProductListItem extends StatelessWidget {
  final Product product;

  const ProductListItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return introduce_product(product: product);
  }
}

class introduce_product extends StatelessWidget {
  const introduce_product({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4, // adds shadow
      margin: const EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          SizedBox(width: 10), // 添加空白部件
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomRight:Radius.circular(10), 
              ),
              child: Image.asset(product.imageUrl, fit: BoxFit.cover),
            ),
            flex: 1,
          ),
          SizedBox(width: 10), // 添加空白部件
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('商品：${product.name}', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('价格：${product.price}'),
                  Text('地址：${product.address}'),
                  Text('订购日期：${product.orderDate}'),
                  Text('状态：${product.status}'),
                ],
              ),
            ),
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
    return bottom();
  }
}

class bottom extends StatelessWidget {
  const bottom({
    super.key,
  });

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
