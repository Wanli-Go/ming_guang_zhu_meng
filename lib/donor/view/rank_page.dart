import 'package:flutter/material.dart';
import 'package:ming_guang/donor/components/leaderboard_screen.dart';
import 'package:ming_guang/donor/components/donor_ranking_tile.dart';
import 'package:ming_guang/donor/model/donors.dart';
import 'package:ming_guang/donor/theme/color.dart';


class RankPage extends StatefulWidget {
  const RankPage({super.key});

  @override
  State<RankPage> createState() => _RankPageState();
}

class _RankPageState extends State<RankPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // Wanli: use this to improve performance

    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 248, 129, 178).withOpacity(0.5),
          foregroundColor: Colors.grey[800],
          elevation: 0,
          title: const Text(
            '捐赠排行',
          ),
        ),
        drawer: const Drawer(
          backgroundColor: Colors.blueGrey,
          child: Center(child: Icon(Icons.abc,)),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          //第一块区域
          TopWidget(size: size),

          const SizedBox(
            height: 10,
          ),

          //第二块区域
          // 使用Row组件水平排列方框
          MiddleRow(size: size),

          const SizedBox(height: 20),

          //第三块区域
          const LeaderboardModule(),
        ]),

        //底部导航栏
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "主页"),
            BottomNavigationBarItem(
                icon: Icon(Icons.insert_chart), label: "排行榜"),
            BottomNavigationBarItem(
                icon: Icon(Icons.rate_review), label: "捐赠记录")
          ],
        ));
  }
}

class TopWidget extends StatelessWidget {
  const TopWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.6), // 方框的背景颜色
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white, // 方框边框颜色
          width: 1.0, // 方框边框宽度
        ),

        //阴影
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.36), // 阴影颜色
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
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 241, 182, 93),
              borderRadius: BorderRadius.circular(80),
            ),
            child: Image.asset(
              donor.imageUrl,
              width: size.width * 0.15,
              height: size.width * 0.15,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //捐赠人姓名
              Text(
                donor.name,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              //捐赠次数
              Text(
                "捐赠次数: ${donor.donationCount}次",
              ),

              //累计金额
              Text(
                "累计金额: ${donor.donationMoney}元",
              ),

              //描述
              SizedBox(
                width: 160,
                child: Text(donor.description),
              )
            ],
          ),
          Container(
            width: size.width * 0.15,
            height: size.width * 0.15,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 239, 146, 175), // 圆形的颜色
              shape: BoxShape.circle, // 设置形状为圆形
            ),
            child: Center(
              child: Text(
                "总榜\n${donor.totalRating}",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MiddleRow extends StatelessWidget {
  const MiddleRow({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end, // 交叉轴居中对齐
      children:<Widget>[
        DonorRankingTile(
          donor: donor,
          height: MediaQuery.of(context).size.width * 0.32,
          imageHeight: MediaQuery.of(context).size.width * 0.12,
          medalImagePath: 'assets/second_medal.png',
        ),
        DonorRankingTile(
          donor: donor,
          height: MediaQuery.of(context).size.width * 0.35,
          imageHeight: MediaQuery.of(context).size.width * 0.14,
          medalImagePath: 'assets/goldenmedal.png',
        ),
        DonorRankingTile(
          donor: donor,
          height: MediaQuery.of(context).size.width * 0.29,
          imageHeight: MediaQuery.of(context).size.width * 0.1,
          medalImagePath: 'assets/third_medal.png',
        ),
      ],
    );
  }
}
