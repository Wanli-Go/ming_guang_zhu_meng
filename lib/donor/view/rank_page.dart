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
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 248, 129, 178).withOpacity(0.5),
          foregroundColor: Colors.grey[800],
          elevation: 0,
          leading: const Icon(
            Icons.menu,
          ),
          title: const Center(
            child: Text(
              '捐赠排行',
            ),
          ),
        ),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          //第一块区域
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.5), // 方框的背景颜色
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.white, // 方框边框颜色
                width: 1.0, // 方框边框宽度
              ),

              //阴影
              boxShadow: [
                BoxShadow(
                  color: primaryColor.withOpacity(0.5).withOpacity(0.5), // 阴影颜色
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
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(3),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 241, 182, 93),
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: Image.asset(
                    donor.imageUrl,
                    width: MediaQuery.of(context).size.width * 0.15,
                    height: MediaQuery.of(context).size.width * 0.15,
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
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.width * 0.15,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 239, 146, 175), // 圆形的颜色
                    shape: BoxShape.circle, // 设置形状为圆形
                  ),
                  child: Center(
                    child: Text(
                      "总榜\n${donor.totalRating}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          //第二块区域
          // 使用Row组件水平排列方框
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end, // 交叉轴居中对齐
              children: <Widget>[
                DonorRankingTile(
                  donor: donor,
                  height: MediaQuery.of(context).size.width * 0.3,
                  imageHeight: MediaQuery.of(context).size.width * 0.12,
                  medalImagePath: 'assets/second_medal.png',
                ),
                DonorRankingTile(
                  donor: donor,
                  height: MediaQuery.of(context).size.width * 0.33,
                  imageHeight: MediaQuery.of(context).size.width * 0.14,
                  medalImagePath: 'assets/goldenmedal.png',
                ),
                DonorRankingTile(
                  donor: donor,
                  height: MediaQuery.of(context).size.width * 0.27,
                  imageHeight: MediaQuery.of(context).size.width * 0.1,
                  medalImagePath: 'assets/third_medal.png',
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          //第三块区域
          LeaderboardModule(),
        ]),

        //底部导航栏
        bottomNavigationBar: BottomNavigationBar(
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
