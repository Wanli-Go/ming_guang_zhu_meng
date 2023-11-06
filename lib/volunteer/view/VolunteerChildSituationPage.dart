import 'package:flutter/material.dart';
import 'dart:math';
import 'package:ming_guang/volunteer/model/X_LC.dart';
import 'package:ming_guang/volunteer/model/Y_LC.dart';
import 'package:ming_guang/volunteer/model/modelStudent.dart';
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
      
      
      
      body:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              //包含有学生照片、名字与简介的container组件
              student_Infor(),
             
              //包含学生任务完成进度条（两个对应两种任务），两个图表展示框的column大组件
              Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    //进度条一
                    Text(
                      '必做任务（完成度）',
                      style: TextStyle(fontSize: 16),
                    ),
                    LinearProgressIndicator(
                      minHeight: 14,
                      value: student.nessary,
                      backgroundColor: Color.fromARGB(255, 244, 242, 242),
                      valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 151, 98, 179)),
                    ),
                    SizedBox(height: 25),

                    //进度条二
                    Text(
                      '选做任务（完成度）',
                      style: TextStyle(fontSize: 16),
                    ),
                    LinearProgressIndicator(
                      minHeight: 14,
                      value: student.choose,
                      backgroundColor: Color.fromARGB(255, 240, 238, 239),
                      valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 239, 132, 225)),
                    ),
                     Container(
                      child: Center(child: Text('排名图')),
                      height:40
                    ),

                   //展示图,曲线柱形图

                    ListView(
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
               
                  ]
                )
            )
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




class student_Infor extends StatelessWidget {
  const student_Infor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: MediaQuery.of(context).size.width,
      height: 150,
       decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color.fromARGB(255, 240, 33, 102).withOpacity(0.5), Color.fromARGB(255, 168, 39, 248).withOpacity(0.5)],
        ),
      ),
      child: Row(
        children: [
           Padding(
             padding: const EdgeInsets.all(8),
             child: Center(
             child: Container(
              width: MediaQuery.of(context).size.width*0.3,
              height: MediaQuery.of(context).size.width*0.3,
              child: ClipOval(
                child: Image.asset(student.imageUrl), 
              ),
             ),
          ),
           ),
          Expanded( 
            child: Container(
              //color: Colors.amber,
              padding: EdgeInsets.only(left:60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      student.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Expanded(
                    child: Text(
                      student.description,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
        // titlesData: FlTitlesData(
        //   bottomTitles: AxisTitles(
        //     showTitles: true,
            
        //     getTitles: (value) {
        //       final index = value.toInt() % xValues.length;
        //       return xValues[index].x;
        //     },
        //     // 其他属性配置...
        //   ),
        //   leftTitles: AxisTitles(
        //     showTitles: true,
        //     // 其他属性配置...
        //   ),
        // ),

        


        titlesData: FlTitlesData(
          bottomTitles: SideTitles(
            showTitles: true,
            getTitles: (value) {
              return xValues[value.toInt() % xValues.length].x;
            },
          
            // getTitles: (value) {
            //   final index = value.toInt() % xValues.length;
            //   return xValues[index].x;
            // },
           /* getTitles: (value) {
              return xValues[value.toInt() % xValues.length];
            },*/
          )as AxisTitles,
           
          leftTitles: SideTitles(showTitles: true)as AxisTitles,
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: yValues.asMap().entries.map((e) {
              return FlSpot(e.key.toDouble(), e.value.y.toDouble());
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
              return xValues[value.toInt() % xValues.length].x;
            },
          )as AxisTitles,
          leftTitles: SideTitles(showTitles: false)as AxisTitles,
        ),
        barGroups: yValues.asMap().entries.map((e) {
          return BarChartGroupData(
            x: e.key,
            barRods: [
              BarChartRodData(
                toY: e.value.y.toDouble(),
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


