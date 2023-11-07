import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/model/model.dart';
import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/themes/main_theme.dart';

class TaskDetailPage extends StatefulWidget {
  final String taskName;
  const TaskDetailPage({Key? key, required this.taskName}) : super(key: key);

  @override
  _TaskDetailPageState createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {

  // TODO: 从后端读取孩子的列表
  final children = [
    {
      'avatar': 'assets/images/avatar1.png',
      'date': '2023-11-01',
      'status': '未批改',
    },
    {
      'avatar': 'assets/images/avatar2.png',
      'date': '2023-11-02',
      'status': '未批改',
    },
    {
      'avatar': 'assets/images/avatar3.png',
      'date': '2023-11-03',
      'status': '已批改',
    },
  ];

  @override
  Widget build(BuildContext context) {

  // TODO: 从后端读取数据
  final name = widget.taskName;
  final type = '任务类型';
  final message = '任务描述';
  final submitCount = 10;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title:Center(child: const  Text('任务详情')),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [Icon(Icons.abc, size: 50, color: Colors.transparent)],
      ),
      
      body: Column(
        children: [
          Expanded(
            flex: 1,
          child: 
          Container()),

          Expanded(
            flex: 6,
            child: Container(
              width: MediaQuery.sizeOf(context).width*0.85,
            decoration: BoxDecoration(
                      color: Colors.pink[200],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3)
                        )
                      ]
                    ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('名称：$name',style:TextStyle(
                    fontSize: 20,
                    fontFamily: 'StarRail',
                    color: Colors.white
                  ),),
                  Text('类型：$type',
                  style:TextStyle(
                    fontSize: 20,
                    fontFamily: 'StarRail',
                    color: Colors.white
                  )
                  ),
                  Text('描述：$message',
                  style:TextStyle(
                    fontSize: 20,
                    fontFamily: 'StarRail',
                    color: Colors.white)),
                  Text('提交总数：$submitCount',
                  style:TextStyle(
                    fontSize: 20,
                    fontFamily: 'StarRail',
                    color: Colors.white)),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 12,
            child: Container(
              decoration: BoxDecoration(
                      color: Colors.pink[200],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3)
                        )
                      ]
                    ),
              width: MediaQuery.sizeOf(context).width*0.85,
              child: ListView.builder(
                itemCount: children.length,
                itemBuilder: (context, index) {
                  final child = children[index];
                  return Container(
                    
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child:Container(
                        child:Row(
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width*0.2,
                          height: MediaQuery.sizeOf(context).height*0.08,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                                image: AssetImage(child['avatar']!), // 设置头像的图片
                                fit: BoxFit.cover, // 设置图片的填充方式为cover
                               ),
                               shape: BoxShape.rectangle, // 设置形状为矩形
                               borderRadius: BorderRadius.circular(10), // 设置圆角为10
                         ),
                        ),
                        SizedBox(width: 16),
                        Text('${child['date']} \n${child['status']}',style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'StraRial',
                          color: Colors.white
                        ),),
                        Spacer(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.pink[300],
                            foregroundColor: Colors.white
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return SubmitDetailDialog();
                              },
                            );
                          },
                          child: Text('查看'),
                        ),
                      ],
                    ),
                      )
                      
                    )
                  );
                },
              ),
            ),
          ),

          Expanded(flex:1,child: Container())
        ],
      ),
    );
  }
}

class SubmitDetailDialog extends StatefulWidget {
  const SubmitDetailDialog({Key? key}) : super(key: key);

  @override
  _SubmitDetailDialogState createState() => _SubmitDetailDialogState();
}

class _SubmitDetailDialogState extends State<SubmitDetailDialog> {
  // TODO: 从后端读取提交的图片或视频
  final media = 'assets/images/media.png';

  // TODO: 从后端读取或更新评分
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).height*0.15,horizontal:MediaQuery.sizeOf(context).width*0.10),
      
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[300],
          title: Center(child: Text('提交详情')),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: const [Icon(Icons.abc, size: 50, color: Colors.transparent)],
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                height: 200,
                child: Image.asset(media),
              ),
              Row(
                children: [
                  Text('评分：'),
                  RatingBar(
                    rating: rating,
                    onRatingChanged: (value) {
                      setState(() {
                        rating = value;
                      });
                    },
                  ),
                  Spacer(),
                  
                ],
              ),
              
             
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('做的太好了，鼓励一下~',style: TextStyle(
                    fontFamily: 'StarRail',
                    fontSize: 18
                  ),),
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink[200]
                    ),
                    onPressed: () {
                      // TODO: 发送鼓励消息到后端
                    },
                    child: Text('鼓励'),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('不尽人意？提醒重新完成',
                  style: TextStyle(
                    fontFamily: 'StarRial',
                    fontSize: 18
                  ),),
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink[200]
                    ),
                    onPressed: () {
                      // TODO: 发送打回消息到后端
                    },
                    child: Text('打回'),
                  ),
                ],
              ),
               Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      primary: Colors.pink[200]
                    ),
                      onPressed: () {
                        // TODO: 提交评分到后端
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('提交成功'),
                          ),
                        );
                      },
                      child:  Text('提交'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  final int rating;
  final ValueChanged<int> onRatingChanged;

  const RatingBar({
    Key? key,
    required this.rating,
    required this.onRatingChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < rating ? Icons.star : Icons.star_border,
            color: Colors.yellow,
          ),
          onPressed: () {
            onRatingChanged(index + 1);
          },
        );
      }),
    );
  }
}
