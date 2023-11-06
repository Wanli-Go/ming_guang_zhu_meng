import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DonationInfo {
  final String date;
  final String amount;
  final String purpose;

  DonationInfo({
    required this.date,
    required this.amount,
    required this.purpose,
  });
}

class ChildStatusCard extends StatelessWidget {
  final List<String> imagePaths;
  final List<DonationInfo> donations;
  final List<String> teacherComments;

  const ChildStatusCard({
    Key? key,
    required this.imagePaths,
    required this.donations,
    required this.teacherComments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 244, 215, 227), // 方框的背景颜色
        borderRadius: BorderRadius.circular(10),

        //阴影
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 244, 215, 227).withOpacity(0.5), // 阴影颜色
            spreadRadius: 0, // 扩散半径
            blurRadius: 5, // 模糊半径
            offset: const Offset(0, 3), // 阴影偏移量
          ),
        ],

        //背景颜色渐变
        gradient: const LinearGradient(
          // 线性渐变
          begin: Alignment.topLeft, // 渐变开始的位置
          end: Alignment.bottomRight, // 渐变结束的位置
          colors: [
            Color.fromARGB(255, 244, 215, 227), // 开始颜色
            Colors.white, // 结束颜色
          ],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Set the mainAxisSize to min

        children: <Widget>[
          // Image grid
          Flexible(
            // Wrap with Flexible instead of Expanded
            child: CarouselSlider(
              options: CarouselOptions(
                height: 240.0, // 定义轮播图的高度
                aspectRatio: 16 / 9, // 定义轮播图的宽高比
                viewportFraction: 1, // 单个项目占据的屏幕空间的比例
                initialPage: 0,
                enableInfiniteScroll: true, // 无限滚动
                reverse: false,
                autoPlay: true, // 自动播放
                autoPlayInterval: const Duration(seconds: 2), // 自动播放间隔
                autoPlayAnimationDuration: const Duration(milliseconds: 800), // 动画时长
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.vertical, // 竖向滚动
                onPageChanged: (index, reason) {
                  // 可以在这里处理页面变化
                },
              ),
              items: imagePaths
                  .map((item) => Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: AssetImage(item),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(
            height: 12,
          ),

          const TextDivider(text: '儿童留言'),

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "        感谢您对我的帮助，我会好好学习，不辜负您的期望！",
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 110, 82, 87),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          // 捐赠用途部分
          const TextDivider(text: '捐赠用途'),
          //_buildSectionTitle(context, "捐赠用途"),

          Column(
            children: donations
                .map((donation) => _buildDonationItem(context, donation))
                .toList(),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),

          _buildSectionTitle(context, "老师的评价"),
          ...teacherComments
              .map((comment) => _buildCommentItem(context, comment))
              .toList(),
        ],
      ),
    );
  }

  Widget _buildDonationItem(BuildContext context, DonationInfo donation) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildIconText(context, Icons.date_range, donation.date),
          _buildIconText(context, Icons.attach_money, donation.amount),
          Expanded(
              child: _buildIconText(
                  context, Icons.shopping_cart, donation.purpose)),
        ],
      ),
    );
  }

  Widget _buildCommentItem(BuildContext context, String comment) {
    return _buildTextWithIcon(context, Icons.comment, comment);
  }
}

Widget _buildIconText(BuildContext context, IconData icon, String text) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, size: 16.0, color: Colors.black54),
      const SizedBox(width: 4.0),
      Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
      const SizedBox(width: 8.0), // 为了美观，各元素之间添加一些间隔
    ],
  );
}

Widget _buildSectionTitle(BuildContext context, String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    ),
  );
}

Widget _buildTextWithIcon(BuildContext context, IconData icon, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.black54),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    ),
  );
}

class VerticalCarouselWithImages extends StatelessWidget {
  final List<String> imagePaths;

  const VerticalCarouselWithImages({Key? key, required this.imagePaths})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400.0, // 定义轮播图的高度
        aspectRatio: 16 / 9, // 定义轮播图的宽高比
        viewportFraction: 0.8, // 单个项目占据的屏幕空间的比例
        initialPage: 0,
        enableInfiniteScroll: true, // 无限滚动
        reverse: false,
        autoPlay: true, // 自动播放
        autoPlayInterval: const Duration(seconds: 3), // 自动播放间隔
        autoPlayAnimationDuration: const Duration(milliseconds: 800), // 动画时长
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.vertical, // 竖向滚动
        onPageChanged: (index, reason) {
          // 可以在这里处理页面变化
        },
      ),
      items: imagePaths
          .map((item) => Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(item),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ))
          .toList(),
    );
  }
}

class TextDivider extends StatelessWidget {
  final String text;

  const TextDivider({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(
          child: Divider(
            //color: Color.fromARGB(255, 139, 115, 109),
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            text,
            style: const TextStyle(
              color: Color.fromARGB(255, 139, 115, 109),
              fontSize: 22,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            //color: Color.fromARGB(255, 139, 115, 109),
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
