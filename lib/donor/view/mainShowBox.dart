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
        color: Colors.white, // 背景颜色
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
                color: Colors.green,
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
    return IntrinsicHeight(
      // 确保竖直方向高度是被子组件决定的
      child: Row(
        mainAxisSize: MainAxisSize.min, // 设置mainAxisSize为min
        mainAxisAlignment: MainAxisAlignment.center, // 水平居中
        children: [
          // 使用Flexible确保两个组件大小一样，但不强迫它们填满额外空间
          Flexible(
            fit: FlexFit.loose,
            child: DonationAmountWidget(description: '累计捐赠金额', amount: amount1),
          ),
          // 中间的竖线分隔
          Container(
            height: 100, // 根据实际需要调整高度
            width: 5, // 使线更粗
            color: Colors.black, // 线的颜色改为黑色
            margin: EdgeInsets.symmetric(horizontal: 20), // 左右边距
          ),
          // 使用Flexible确保两个组件大小一样，但不强迫它们填满额外空间
          Flexible(
            fit: FlexFit.loose,
            child: DonationAmountWidget(description: '累计帮助儿童', amount: amount2),
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
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 标题“最近捐助”和分割线
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 10.0),
                  height: 2.0, // 分割线粗细
                  color: const Color.fromARGB(255, 150, 77, 77), // 分割线颜色
                ),
              ),
              Text(
                '最近捐助',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 10.0),
                  height: 2.0, // 分割线粗细
                  color: Color.fromARGB(255, 129, 45, 45), // 分割线颜色
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          // 图片和文字描述部分
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 图片区域
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  image,
                  width: 120.0, // 设置图片固定宽度
                  height: 120.0, // 设置图片固定高度
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 8.0),
              // 文字描述部分
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      content,
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(134, 168, 30, 30),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//寿司店的button
class SsdButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const SsdButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,  // 指定宽度
        height: 50,  // 指定高度
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 219, 163, 187).withOpacity(0.8),
          borderRadius: BorderRadius.circular(40),
        ),
        padding: EdgeInsets.all(10),  // 根据需要调整padding
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(
              width: 10,
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

