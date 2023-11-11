import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/components/community_components.dart';
import 'package:ming_guang/volunteer/themes/community_theme.dart';
import 'package:ming_guang/volunteer/view_model/articles_model.dart';

class SearchPage extends StatefulWidget {
  final ArticlesModel model;
  final String firstKeyword;
  const SearchPage({Key? key, required this.firstKeyword, required this.model}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> searchHistory = ['烤鸡', '小蛋糕', '小蛋糕', '小蛋糕', '小蛋糕', '小蛋糕', '小蛋糕', '小蛋糕', '小蛋糕']; // 示例数据，应从后端获取
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.text = widget.firstKeyword;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: commAppBarColor,
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
              setState(() {
                
              });
            },
          ),
        ],
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
              return GestureDetector(
                onTap: () {
                  setState(() {
                    searchController.text = searchHistory[index];
                  });
                },
                child: Chip(
                  label: Text(searchHistory[index]),
                  onDeleted: () {
                    setState(() {
                      searchHistory.removeAt(index);
                    });
                  },
                ),
              );
            }).toList(),
          ),
          Expanded(
            child: ArticleListPage(model: widget.model, type: 2, keyWord: searchController.text,)
          ),
        ],
      ),
    );
  }
}
