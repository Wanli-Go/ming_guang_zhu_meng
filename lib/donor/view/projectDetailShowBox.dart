import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

//热门项目卡片
class ProductCard extends StatefulWidget {
  final List<Map<String, String>> products;

  const ProductCard({Key? key, required this.products}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int _current = 0;
  int _selectedIndex = -1;
  CarouselController _carouselController = new CarouselController();

  @override
  Widget build(BuildContext context) {
    // 设置 Carousel 的固定高度
    const double carouselHeight = 460.0;

    return Scaffold(
      floatingActionButton: _selectedIndex != -1
          ? FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.arrow_forward_ios),
            )
          : null,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white, // 设置 AppBar 背景色为白色
        centerTitle: true, // 标题居中
        title: Text(
          '@theflutterlover',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            // 使用 Expanded 包裹 CarouselSlider
            child: CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                height: carouselHeight,
                aspectRatio: 16 / 9,
                viewportFraction: 0.80, // 可以稍微减小视口分数
                enlargeCenterPage: true,
                pageSnapping: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                    _selectedIndex = -1; // 如果需要在页面变更时取消选择可以放开这行
                  });
                },
              ),
              items: widget.products.asMap().entries.map((entry) {
                int index = entry.key;
                Map<String, String> product = entry.value;
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_selectedIndex == index) {
                            _selectedIndex = -1;
                          } else {
                            _selectedIndex = index;
                          }
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        // 这里不再设置 width，因为 Carousel 已经给出了视口大小
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: _selectedIndex == index
                              ? Border.all(
                                  color: Colors.blue.shade500, width: 3)
                              : null,
                          boxShadow: _selectedIndex == index
                              ? [
                                  BoxShadow(
                                    color: Colors.blue.shade100,
                                    blurRadius: 30,
                                    offset: Offset(0, 10),
                                  ),
                                ]
                              : [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 20,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                height: 320,
                                margin: EdgeInsets.only(top: 10),
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: Image.network(product['image']!,
                                    fit: BoxFit.cover),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: Text(
                                  product['title']!,
                                  textAlign: TextAlign.center, // 标题文字居中对齐
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                product['description']!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              SizedBox(
                                height: 20, // 确保底部有足够空间
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

//项目类型选择
class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  final List<String> categories = ['全部', '生活帮助', '学业扶持', '主题项目'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      // Set a fixed height for the horizontal ListView
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 252, 250, 250),
        borderRadius: BorderRadius.circular(6.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(
            vertical: 12), // Add vertical padding if needed
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => VerticalDivider(
          color: Colors.grey, // Change color to make it visible
          width: 1,
          thickness: 2, // Set thickness of the divider
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
            onTap(categories[index]);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            alignment: Alignment.center,
            child: Text(
              categories[index],
              style: TextStyle(
                fontSize: 19.0,
                color: Color.fromARGB(255, 137, 114, 108),
                fontWeight: index == selectedIndex
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onTap(String category) {
    print('选中了$category');
  }
}
