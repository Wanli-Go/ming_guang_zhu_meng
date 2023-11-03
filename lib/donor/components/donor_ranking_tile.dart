import 'package:flutter/material.dart';
import 'package:ming_guang/donor/model/donors.dart';
import 'package:ming_guang/donor/theme/color.dart';

//捐赠排名模块
class DonorRankingTile extends StatelessWidget {
  final Donor donor;
  final double height;
  final double imageHeight;
  const DonorRankingTile({
    super.key,
    required this.donor,
    required this.height,
    required this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            offset: Offset(0, 3), // 阴影偏移量
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
      padding: const EdgeInsets.all(2),
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
              width: MediaQuery.of(context).size.width * 0.25,
              child: Column(
                children: [
                  Text(donor.name),
                  Text("捐赠${donor.donationCount}次"),
                  Text("累计${donor.donationMoney}元")
                ],
              ),
            )
          ]),
    );
  }
}
