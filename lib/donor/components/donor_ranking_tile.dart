import 'package:flutter/material.dart';
import 'package:ming_guang/donor/model/donors.dart';
import 'package:ming_guang/donor/theme/color.dart';

//捐赠排名模块
class DonorRankingTile extends StatelessWidget {
  final Donor donor;
  final double height;
  final double imageHeight;
  final String medalImagePath;
  const DonorRankingTile({
    super.key,
    required this.donor,
    required this.height,
    required this.imageHeight,
    required this.medalImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height, //130
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.5), // 方框的背景颜色
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white, // 方框边框颜色
              width: 1.0, // 方框边框宽度
            ),

            //阴影
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 236, 130, 165)
                    .withOpacity(0.5), // 阴影颜色
                spreadRadius: 0, // 扩散半径
                blurRadius: 5, // 模糊半径
                offset: const Offset(0, 3), // 阴影偏移量
              ),
            ],

            //背景颜色渐变
            gradient: LinearGradient(
              // 线性渐变
              begin: Alignment.topLeft, // 渐变开始的位置
              end: Alignment.bottomRight, // 渐变结束的位置
              colors: [
                primaryColor, // 开始颜色
                Colors.white, // 结束颜色
              ],
            ),
          ),
          margin: const EdgeInsets.only(left: 5),
          padding: const EdgeInsets.all(8),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //image
                Image.asset(
                  'assets/businesswoman.png',
                  height: imageHeight,
                ),

                //text
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.23,
                  child: Column(
                    children: [
                      Text(donor.name),
                      Text("捐赠${donor.donationCount}次"),
                      Text("累计${donor.donationMoney}元")
                    ],
                  ),
                )
              ]),
        ),
        Positioned(
          top: 0, // Stack底部的位置
          right: 0, // Stack右侧的位置
          child: Container(
            // 根据设计调整内边距和大小
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              // 可选: 为奖章容器添加一个装饰
              shape: BoxShape.circle, // 圆形容器
            ),
            child: Image.asset(
              medalImagePath, // 替换成你的奖章图标资源路径
              width: 30, // 调整大小以适应容器
            ),
          ),
        ),
      ],
    );
  }
}
