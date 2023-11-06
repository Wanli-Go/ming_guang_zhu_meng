import 'package:flutter/material.dart';
import 'dart:math';
import 'package:ming_guang/example/model/X_LC.dart';
import 'package:ming_guang/example/model/Y_LC.dart';
import 'package:ming_guang/example/model/child.dart';
import 'package:fl_chart/fl_chart.dart';

class ChildSituationPage extends StatefulWidget {
  const ChildSituationPage({super.key});

  @override
  State<ChildSituationPage> createState() => _ChildSituationPageState();
}

class _ChildSituationPageState extends State<ChildSituationPage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('孩子近况'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Text('Line Chart', style: Theme.of(context).textTheme.headline6),
            Container(
              height: 300,
              child: LineChartWidget( xValues:  xValues, yValues: yValues),
            ),
            Text('Bar Chart', style: Theme.of(context).textTheme.headline6),
            Container(
              height: 300,
              child: BarChartWidget(xValues: xValues, yValues: yValues),
            ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '主页'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: '商城'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: '任务'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
        ],
      ),
    );
  }
}

/*
class ChildInfoSection extends StatelessWidget {
  final Child child;

  ChildInfoSection({required this.child});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(child.imagePath), // 孩子照片
        Column(
          children: [
            Text(child.name), // 孩子名字
            Text(child.description), // 孩子近况
          ],
        ),
      ],
    );
  }
}

class TaskProgressSection extends StatelessWidget {
  final double mandatoryProgress;
  final double optionalProgress;

  TaskProgressSection(
      {required this.mandatoryProgress, required this.optionalProgress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(value: mandatoryProgress), // 必做任务进度条
        LinearProgressIndicator(value: optionalProgress), // 选做任务进度条
      ],
    );
  }
}
*/

//折线图
class LineChartWidget extends StatelessWidget {
  final List<X_LC> xValues;
  final List<Y_LC> yValues;

  const LineChartWidget({Key? key, required this.xValues, required this.yValues})
      : assert(xValues.length == yValues.length,
            'xValues and yValues lists should have the same length'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          bottomTitles: SideTitles(
            showTitles: true,
            getTitles: (value) {
              return xValues[value.toInt() % xValues.length].x;
            },
          ),
           // getTitles: xValues[index],),
            /*getTitles: (value) {
              return xValues[xValues.indexOf(Element) % xValues.length];
            },
          ),*/
          leftTitles: SideTitles(showTitles: true),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: yValues.asMap().entries.map((e) {
              return FlSpot(e.key.toDouble(), e.value.toDouble());
            }).toList(),
            isCurved: true,
            colors: [Colors.blue],
            barWidth: 4,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
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
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        titlesData: FlTitlesData(
          bottomTitles: SideTitles(
            showTitles: true,
            getTitles: (double value) {
              return xValues[value.toInt() % xValues.length];
            },
          ),
          leftTitles: SideTitles(showTitles: false),
        ),
        barGroups: yValues.asMap().entries.map((e) {
          return BarChartGroupData(
            x: e.key,
            barRods: [
              BarChartRodData(
                y: e.value.toDouble(),
                colors: [Colors.blue],
                width: 16,
              )
            ],
          );
        }).toList(),
      ),
    );
  }
}
