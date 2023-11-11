import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/model/X_LC.dart';
import 'package:ming_guang/volunteer/model/Y_LC.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:ming_guang/volunteer/model/model_kid_recent.dart';
import 'package:ming_guang/volunteer/themes/main_theme.dart';
import 'package:ming_guang/volunteer/view_model/home_page_model.dart';

class ChildSituationPage extends StatefulWidget {
  final HomePageModel model;

  const ChildSituationPage({super.key, required this.model});

  @override
  State<ChildSituationPage> createState() => _ChildSituationPageState();
}

class _ChildSituationPageState extends State<ChildSituationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('孩子近况'),
        backgroundColor: appBarColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //包含有学生照片、名字与简介的container组件
          StudentInfo(),

          //包含学生任务完成进度条（两个对应两种任务），两个图表展示框的column大组件
          Expanded(
            child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                margin: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //进度条一
                      const Text(
                        '必做任务（完成度：85%）',
                        style: TextStyle(fontSize: 16),
                      ),
                      const LinearProgressIndicator(
                        minHeight: 15,
                        value: 0.85,
                        backgroundColor:
                            Color.fromARGB(255, 244, 242, 242),
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Color.fromARGB(255, 151, 98, 179)),
                      ),
                      const SizedBox(height: 25),

                      //进度条二
                      const Text(
                        '选做任务（完成度：45%）',
                        style: TextStyle(fontSize: 16),
                      ),
                      const LinearProgressIndicator(
                        minHeight: 14,
                        value: 0.43,
                        backgroundColor:
                            Color.fromARGB(255, 240, 238, 239),
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Color.fromARGB(255, 239, 132, 225)),
                      ),
                      const SizedBox(
                          height: 25,),
                      Container(
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.white.withOpacity(0.6)),
                            color: highlight.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          height: 50, child: const Center(child: Text('班级排名图',style: TextStyle(fontSize: 20),))),

                      //展示图,曲线柱形图

                      Expanded(
                        child: ListView(
                          children: <Widget>[
                            Text('线状图',
                                style: Theme.of(context).textTheme.titleLarge),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              height: 300,
                              child: LineChartWidget(
                                  xValues: xValues, yValues: yValues),
                            ),
                            const SizedBox(
                              height: 70,
                            ),
                            Text('柱状图',
                                style: Theme.of(context).textTheme.titleLarge),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              height: 300,
                              child: BarChartWidget(
                                  xValues: xValues, yValues: yValues),
                            ),
                          ],
                        ),
                      ),
                    ])),
          )
        ],
      ),
    );
  }
}

class StudentInfo extends StatelessWidget {
  final HomePageModel model = HomePageModel();

  StudentInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.all(size.width * 0.03),
      width: size.width,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 2, color: Colors.white.withOpacity(0.6)),
        gradient: gradientDecoration,
      ),
      child: FutureBuilder<KidRecentDto>(
        future: model.fetchShortRecent(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator(color: highlight),);
          }
          final kidStatus = snapshot.data!;
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width * 0.3,
                    child: ClipOval(
                      child: Image.network(kidStatus.photo),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  //color: Colors.amber,
                  padding: EdgeInsets.only(left: size.width * 0.1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          kidStatus.name,
                          style: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: Text(
                          kidStatus.recent,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}

//折线图
class LineChartWidget extends StatelessWidget {
  final List<X_LC> xValues;
  final List<Y_LC> yValues;

  const LineChartWidget(
      {Key? key, required this.xValues, required this.yValues})
      : assert(xValues.length == yValues.length,
            'xValues and yValues lists should have the same length'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.70,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: true, drawVerticalLine: true),
            titlesData: FlTitlesData(
              bottomTitles: SideTitles(
                showTitles: true,
                reservedSize: 22,
                getTitles: (value) {
                  final index = value.toInt() % xValues.length;
                  return xValues[index].x;
                },
                margin: 5,
                interval: 1,
              ),
              leftTitles: SideTitles(
                showTitles: true,
                getTitles: (value) {
                  return '${value.toInt()}';
                },
                reservedSize: 28,
                margin: 5,
              ),
            ),
            borderData: FlBorderData(
                show: true,
                border: Border.all(color: const Color(0xff37434d), width: 1)),
            minX: 0,
            maxX: xValues.length.toDouble() - 1,
            minY: 0,
            maxY: yValues.map((e) => e.y).reduce(max).toDouble() + 7,
            lineBarsData: [
              LineChartBarData(
                spots: yValues.asMap().entries.map((e) {
                  return FlSpot(e.key.toDouble(), e.value.y.toDouble());
                }).toList(),
                isCurved: true,
                colors: [
                  highlight,
                ], // Use a list of colors for gradient-like effect
                barWidth: 5,
                isStrokeCapRound: true,
                dotData: FlDotData(show: true),
                aboveBarData: BarAreaData(
                  show: true,
                  colors: [
                    highlight.withOpacity(0.2),
                    highlight.withOpacity(0.07)
                  ], // Lighter shade for the area below the line
                ),
              ),
            ],
            extraLinesData: ExtraLinesData(horizontalLines: [
              HorizontalLine(
                y: yValues
                    .map((e) => e.y)
                    .average, // Assuming you have an extension to calculate average.
                color: Colors.green.withOpacity(0.7),
                strokeWidth: 2,
                dashArray: [5, 10],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

extension IterableNumExtension on Iterable<num> {
  double get average {
    if (isEmpty) {
      return 0;
    }
    // The sum is explicitly cast to num to ensure the correct type is used.
    num totalSum = sum;
    return totalSum / length;
  }

  num get sum {
    // Use fold instead of reduce to provide an initial value, ensuring the correct type.
    return fold<num>(0, (previousValue, element) => previousValue + element);
  }
}



//柱状图
class BarChartWidget extends StatelessWidget {
  final List<X_LC> xValues;
  final List<Y_LC> yValues;

  const BarChartWidget({Key? key, required this.xValues, required this.yValues})
      : assert(xValues.length == yValues.length,
            'xValues and yValues lists should have the same length'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.70,
      child: Card(
        elevation: 0,
        color: Colors.white.withOpacity(0.8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: yValues.map((e) => e.y).reduce(max).toDouble()+1,
            barTouchData: BarTouchData(
              touchTooltipData: BarTouchTooltipData(
                  tooltipBgColor: Colors.blueGrey,
                  getTooltipItem: (group, groupIndex, rod, rodIndex) {
                    return BarTooltipItem(
                      rod.y.round().toString(),
                      const TextStyle(color: Colors.white),
                    );
                  }),
              touchCallback: (barTouchResponse) {
                // Handle touch interactions if necessary.
              },
            ),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: SideTitles(
                showTitles: true,
                getTextStyles: (context, value) => const TextStyle(
                    color: Color(0xff7589a2),
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
                margin: 20,
                getTitles: (double value) {
                  return xValues[value.toInt() % xValues.length].x;
                },
              ),
              leftTitles: SideTitles(showTitles: false),
            ),
            borderData: FlBorderData(show: false),
            barGroups: yValues.asMap().entries.map((e) {
              return BarChartGroupData(
                x: e.key,
                barRods: [
                  BarChartRodData(
                    y: e.value.y.toDouble(),
                    colors: [Colors.lightBlueAccent, Colors.greenAccent],
                    width: 16,
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
