import 'package:flutter/material.dart';

//累计捐赠单个模块
class DonationAmountWidget extends StatefulWidget {
  final String description;
  final String amount; // 第二行要显示的捐赠金额

  DonationAmountWidget(
      {Key? key, required this.description, required this.amount})
      : super(key: key);

  @override
  _DonationAmountWidgetState createState() => _DonationAmountWidgetState();
}

class _DonationAmountWidgetState extends State<DonationAmountWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500), // 动画时长
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.8, end: 1.0) // 缩放动画从0.8到1
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward(); // 开始动画
  }

  @override
  void dispose() {
    _controller.dispose(); // 销毁控制器
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16), // 内边距
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 249, 247, 247), // 背景颜色
        borderRadius: BorderRadius.circular(8), // 边框圆角
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.75), // 更深的阴影颜色
            spreadRadius: 2, // 更大的扩展半径
            blurRadius: 10, // 更大的模糊半径
            offset: Offset(0, 4), // 阴影位置稍微偏下
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // 水平居中
        mainAxisAlignment: MainAxisAlignment.center, // 垂直居中
        children: [
          // 第一行固定文本
          Text(
            widget.description,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 4), // 添加一点儿间距
          // 第二行可变文本
          ScaleTransition(
            scale: _animation, // 应用缩放动画
            child: Text(
              widget.amount,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 91, 208, 95),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//累计捐赠模块
class DonationRowWidget extends StatelessWidget {
  final String amount1; // 第一个组件显示的金额
  final String amount2; // 第二个组件显示的金额

  DonationRowWidget({
    Key? key,
    required this.amount1,
    required this.amount2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: 9, right: 9, top: 12, bottom: 10), // 添加一些内边距
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 16, bottom: 16), // 卡片内边距
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 249, 246, 246), // 卡片的背景颜色
              borderRadius: BorderRadius.circular(5.0), // 圆角边框
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 189, 188, 188)
                      .withOpacity(0.5), // 阴影颜色
                  spreadRadius: 2, // 扩散半径
                  blurRadius: 4, // 模糊半径
                  offset: Offset(0, 1), // 阴影的位置偏移
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 子元素水平均匀分布
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text(
                        '累计捐赠金额',
                        style: TextStyle(
                          fontSize: 19,
                          color: Color.fromARGB(255, 117, 62, 58),
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0), // 添加一些垂直空间
                      Text(
                        '1000万元',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Color.fromARGB(255, 134, 16, 8),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // 添加一个竖线分隔符
                // 中间的竖线分隔
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 55, // 根据实际需要调整高度
                    width: 3, // 使线更粗
                    color: const Color.fromARGB(255, 183, 141, 141), // 线的颜色改为黑色
                    margin: EdgeInsets.symmetric(horizontal: 6), // 左右边距
                  ),
                ),

                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text(
                        '累计帮助儿童',
                        style: TextStyle(
                          fontSize: 19,
                          color: Color.fromARGB(255, 117, 62, 58),
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0), // 添加一些垂直空间
                      Text(
                        '100位',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Color.fromRGBO(134, 16, 8, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//最近捐赠模块
class DonationCard extends StatelessWidget {
  final String title; // 加粗标题
  final String content; // 文章内容
  final String image; // 图片

  DonationCard({
    Key? key,
    required this.title,
    required this.content,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16, bottom: 8, left: 14, right: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 标题“最近捐助”和分割线
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 10.0),
                  height: 1.0, // 分割线粗细
                  color: Color.fromARGB(255, 152, 92, 88), // 分割线颜色
                ),
              ),
              Text(
                '最近捐助',
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 139, 49, 43),
                  //fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 12.0),
                  height: 1.0, // 分割线粗细
                  color: Color.fromARGB(255, 152, 92, 88), // 分割线颜色
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          // 图片和文字描述部分
          Container(
            padding: EdgeInsets.only(
                left: 12, right: 12, top: 12, bottom: 12), // 内边距
            margin: EdgeInsets.only(top: 4), // 外边距
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0), // 边框的圆角
              color: Colors.white, // 容器的填充颜色
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2), // 阴影颜色
                  spreadRadius: 1, // 阴影扩散程度
                  blurRadius: 5, // 阴影模糊程度
                  offset: Offset(0, 1), // 阴影的位置偏移
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 图片区域
                ClipRRect(
                  borderRadius: BorderRadius.circular(7.0),
                  child: Image.asset(
                    image,
                    width: 115.0, // 设置图片固定宽度
                    height: 115.0, // 设置图片固定高度
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 13.0),
                // 文字描述部分
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 23.0,
                          color: Color.fromARGB(255, 110, 67, 63),
                        ),
                      ),
                      SizedBox(height: 9.0),
                      Text(
                        content,
                        style: TextStyle(
                          fontSize: 19,
                          height: 1.3,
                          color: Color.fromARGB(133, 156, 70, 70),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//button
class SsdButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const SsdButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 220, // 指定宽度
        height: 50, // 指定高度
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 169, 103, 98).withOpacity(0.8),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.only(top: 6, bottom: 5), // 根据需要调整padding
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: 19,
                  //fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              width: 6,
              height: 8,
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
