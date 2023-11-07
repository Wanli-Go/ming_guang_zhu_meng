import 'package:flutter/material.dart';

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
  List<String> searchHistory = ['烤鸡', '小蛋糕', '小蛋糕', '小蛋糕', '小蛋糕', '小蛋糕', '小蛋糕', '小蛋糕', '小蛋糕']; // 示例数据，应从后端获取
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // fetchProducts(); // 获取商品数据
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.maybePop(context);
          },
        ),
        title: TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: '搜索...',
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.all(15),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // 执行搜索逻辑
            },
          ),
        ],
        backgroundColor: Colors.pink[300],
      ),
      body: Column(
        children: [
          const Divider(height: 1), // 分割线
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('搜索历史'),
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () {
                    setState(() {
                      searchHistory.clear();
                    });
                  },
                ),
              ],
            ),
          ),
          Wrap(
            spacing: 8.0, // gap between adjacent chips
            runSpacing: 4.0, // gap between lines
            children: List<Widget>.generate(searchHistory.length, (int index) {
              return Chip(
                label: Text(searchHistory[index]),
                onDeleted: () {
                  setState(() {
                    searchHistory.removeAt(index);
                  });
                },
              );
            }).toList(),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 4,
              ),
              itemCount: 10, // assuming there are 10 products
              itemBuilder: (context, index) {
                // Example product data
                String productName = '商品名称 ${index + 1}';
                String productImage = 'assets/2.jpg'; // Example image asset
                int heat = 542 - index * 10; // Example heat

                return ProductTile(
                  index: index + 1,
                  image: productImage,
                  name: productName,
                  heat: heat,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  final int index;
  final String image;
  final String name;
  final int heat;

  const ProductTile({
    Key? key,
    required this.index,
    required this.image,
    required this.name,
    required this.heat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return introduce_hot_product(index: index, image: image, name: name, heat: heat);
  }
}

class introduce_hot_product extends StatelessWidget {
  const introduce_hot_product({
    super.key,
    required this.index,
    required this.image,
    required this.name,
    required this.heat,
  });

  final int index;
  final String image;
  final String name;
  final int heat;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.pink.shade100),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('$index'),
          ),
          Image.asset(image, width: 50), // Assuming you have an image asset
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(name),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('热度${heat}w', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.orange)),
          ),
        ],
      ),
    );
  }
}
