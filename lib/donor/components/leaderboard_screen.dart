import 'package:flutter/material.dart';
import 'package:ming_guang/donor/model/donors.dart';
import 'package:ming_guang/donor/theme/color.dart';

// 创建三个列表，用于展示周榜、月榜和年榜的数据
final List<Donor> weeklyDonations = [
  Donor(
    name: "Alice",
    donationCount: '8',
    donationMoney: '600',
    weekRating: '20',
    totalRating: '2000',
    description: '',
    imageUrl: 'assets/businesswoman.png',
  ),
  Donor(
    name: "Bob",
    donationCount: '8',
    donationMoney: '2600',
    weekRating: '20',
    totalRating: '2000',
    description: '',
    imageUrl: 'assets/businesswoman.png',
  ),
  // 其他数据...
];

final List<Donor> monthlyDonations = [
  Donor(
    name: "Charlie",
    donationCount: '8',
    donationMoney: '3600',
    weekRating: '20',
    totalRating: '2000',
    description: '',
    imageUrl: 'assets/businesswoman.png',
  ),
  Donor(
    name: "Dave",
    donationCount: '8',
    donationMoney: '4600',
    weekRating: '20',
    totalRating: '2000',
    description: '',
    imageUrl: 'assets/businesswoman.png',
  ),
  // 其他数据...
];

final List<Donor> yearlyDonations = [
  Donor(
    name: "Eva",
    donationCount: '8',
    donationMoney: '5600',
    weekRating: '20',
    totalRating: '2000',
    description: '',
    imageUrl: 'assets/businesswoman.png',
  ),
  Donor(
    name: "Frank",
    donationCount: '8',
    donationMoney: '6600',
    weekRating: '20',
    totalRating: '2000',
    description: '',
    imageUrl: 'assets/businesswoman.png',
  ),
  // 其他数据...
];

class LeaderboardModule extends StatefulWidget {
  const LeaderboardModule({super.key});

  @override
  _LeaderboardModuleState createState() => _LeaderboardModuleState();
}

class _LeaderboardModuleState extends State<LeaderboardModule>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  // 初始化 TabController
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 定义颜色变量
    Color tabUnselectedColor = Colors.grey.shade200;
    Color tabSelectedColor =
        const Color.fromARGB(255, 248, 129, 178).withOpacity(0.5);
    return Container(
      margin: const EdgeInsets.all(10),
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
      child: DefaultTabController(
        length: 3, // 三个标签
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.3,
          ),
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                toolbarHeight: 5.0,
                backgroundColor:
                    const Color.fromARGB(255, 247, 170, 202).withOpacity(0.5),
                bottom: TabBar(
                  controller: _tabController,
                  // 未选中的标签颜色
                  unselectedLabelColor: tabUnselectedColor,
                  // 选中的标签颜色
                  labelColor: tabUnselectedColor,
                  // 指示器填充颜色
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: tabSelectedColor,
                  ),
                  tabs: const [
                    Tab(text: '周榜'),
                    Tab(text: '月榜'),
                    Tab(text: '年榜'),
                  ],
                  // 更新状态来改变颜色
                  onTap: (index) {
                    setState(() {
                      // 根据标签索引改变颜色
                      if (_tabController.indexIsChanging) {
                        tabSelectedColor = tabSelectedColor.withAlpha(255);
                      }
                    });
                  },
                ),
              ),
              body: TabBarView(
                controller: _tabController,
                children: [
                  DonationList(donations: weeklyDonations),
                  DonationList(donations: monthlyDonations),
                  DonationList(donations: yearlyDonations),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DonationList extends StatelessWidget {
  final List<Donor> donations;

  const DonationList({super.key, required this.donations});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            color: const Color.fromARGB(255, 249, 199, 216).withOpacity(0.5), // 阴影颜色
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
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              // Title row with headers
              children: <Widget>[
                Expanded(
                  child: Text(
                    '排名',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 2, // Name has more space as before
                  child: Text(
                    '姓名',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    '累计',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            // ListView now takes the remaining space after the title row
            child: ListView.builder(
              itemCount: donations.length,
              itemBuilder: (context, index) {
                var donation = donations[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          '${index + 1}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 108, 108, 108),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      // 添加一个 CircleAvatar 来显示头像
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                                flex: 1,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.13,
                                )),
                            Flexible(
                              flex: 1,
                              child: CircleAvatar(
                                backgroundColor:
                                    const Color.fromARGB(255, 241, 182, 93),
                                backgroundImage: AssetImage(donation.imageUrl),
                                radius: 20.0, // 根据需要调整大小
                              ),
                            ),
                            const SizedBox(width: 10), // 头像和名字之间的空白
                            Flexible(
                              flex: 3,
                              child: Text(
                                donation.name,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 108, 108, 108),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '\$${donation.donationMoney}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 108, 108, 108),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
