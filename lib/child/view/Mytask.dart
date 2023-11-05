import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  // TODO: 从后端读取数据
  final userAvatarUrl = 'assets/images/avatar.png';
  final userScore = 100;
  final weekTaskCount = 20;
  final unfinishedTaskCount = 10;
  final finishedTaskCount = 10;
  final todayTasks = [
    {
      'type': '阅读',
      'status': '未完成',
      'tag': '必做', // 添加标签
    },
    {
      'type': '写作',
      'status': '已完成',
      'tag': '选做', // 添加标签
    },
    {
      'type': '听力',
      'status': '未完成',
      'tag': '必做', // 添加标签
    },
    {
      'type': '口语',
      'status': '已完成',
      'tag': '选做', // 添加标签
    },
  ];
  final tomorrowTasks = [
    {
      'type': '阅读',
      'status': '未完成',
      'tag': '选做', // 添加标签
    },
    {
      'type': '写作',
      'status': '未完成',
      'tag': '必做', // 添加标签
    },
    {
      'type': '听力',
      'status': '未完成',
      'tag': '选做', // 添加标签
    },
    {
      'type': '口语',
      'status': '未完成',
      'tag': '必做', // 添加标签
    },
  ];

  // 添加一个状态变量，用来记录当前选择的标签
  String selectedTag = '所有任务';

  // 添加一个方法，用来根据标签筛选和排序任务
  List<Map<String, String>> filterAndSortTasks(
      List<Map<String, String>> tasks) {
    // 如果选择的是所有任务，直接返回原列表
    if (selectedTag == '所有任务') {
      return tasks;
    }
    // 否则，创建一个新的列表，只包含符合标签的任务
    List<Map<String, String>> filteredTasks = [];
    for (Map<String, String> task in tasks) {
      if (task['tag'] == selectedTag) {
        filteredTasks.add(task);
      }
    }
    // 然后，对新的列表按照任务类型进行排序
    filteredTasks.sort((a, b) => a['type']!.compareTo(b['type']!));
    // 返回新的列表
    return filteredTasks;
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 3,
            child: Opacity(
              opacity: 0.8,
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
                width: MediaQuery.of(context).size.width * 0.85,
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          SizedBox(width: MediaQuery.sizeOf(context).width*0.05,),
                          Container(
                            width: MediaQuery.sizeOf(context).width*0.16,
                            height:MediaQuery.sizeOf(context).height*0.08,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(userAvatarUrl),
                                fit: BoxFit.cover,
                              ),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          SizedBox(width: 16),
                          Text('学习积分：$userScore'),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              // TODO: 跳转到任务统计页面
                            },
                            child: Text('任务统计>',style: TextStyle(
                              fontFamily: 'StarRail',
                              fontSize: 16,
                              color: Colors.grey
                            ),),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('本周任务：'),
                          Text('未完成：$unfinishedTaskCount'),
                          Text('已完成：$finishedTaskCount'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(flex:1,child: Container()),

           Expanded(
            flex: 10,
            child: Opacity(opacity: 0.8,
              child: Container(
                width: MediaQuery.sizeOf(context).width*0.85,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            // TODO: 显示所有任务
                            setState(() {
                              selectedTag = '所有任务'; // 更新状态变量
                            });
                          },
                          child: Text('所有任务',style: TextStyle(
                              fontFamily: 'StarRail',
                              fontSize: 16,
                              color: Colors.pink[200]
                            )),
                        ),
                        TextButton(
                          onPressed: () {
                            // TODO: 显示必做任务
                            setState(() {
                              selectedTag = '必做'; // 更新状态变量
                            });
                          },
                          child: Text('必做任务',style: TextStyle(
                              fontFamily: 'StarRail',
                              fontSize: 16,
                              color: Colors.pink[200]
                            )),
                        ),
                        TextButton(
                          onPressed: () {
                            // TODO: 显示选做任务
                            setState(() {
                              selectedTag = '选做'; // 更新状态变量
                            });
                          },
                          child: Text('选做任务',style: TextStyle(
                              fontFamily: 'StarRail',
                              fontSize: 16,
                              color: Colors.pink[200]
                            )),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Text('今日任务',style: TextStyle(
                              fontFamily: 'StarRail',
                              fontSize: 18
                            ),),
                            Divider(),
                            GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              // 使用筛选和排序后的任务列表
                              itemCount: filterAndSortTasks(todayTasks).length,
                              itemBuilder: (context, index) {
                                // 获取筛选和排序后的任务
                                final task = filterAndSortTasks(todayTasks)[index];
                                return TextButton(
                                   style: TextButton.styleFrom(
                                    elevation: 10, // 设置阴影为10
                                    backgroundColor: Colors.pink[200],
                                    shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20), // 设置圆角为20
                                    ),
                                  ),

                                  onPressed: task['status'] == '未完成'
                                      ? () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return TaskDetailDialog();
                                            },
                                          );
                                        }
                                      : null,
                                  
                                  child: 
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                            '${task['type']}',style: TextStyle(
                                              fontFamily: 'StarRail',
                                              fontSize: 16,
                                              color: Colors.white
                                            ),),
                                            Text('${task['status']}',style: TextStyle(
                                              fontFamily: 'StarRail',
                                              fontSize: 16,
                                              color: Colors.white
                                            )),
                                      ],
                                    ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Text('明日任务',style: TextStyle(
                              fontFamily: 'StarRail',
                              fontSize: 18,

                            ),),
                            Divider(),
                            GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              // 使用筛选和排序后的任务列表
                              itemCount: filterAndSortTasks(tomorrowTasks).length,
                              itemBuilder: (context, index) {
                                // 获取筛选和排序后的任务
                                final task =
                                    filterAndSortTasks(tomorrowTasks)[index];
                                return TextButton(
                                  style: TextButton.styleFrom(
                                    elevation: 10, // 设置阴影为10
                                    backgroundColor: Colors.pink[200],
                                    shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20), // 设置圆角为20
                                    ),
                                  ),

                                  onPressed: task['status'] == '未完成'
                                      ? () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return TaskDetailDialog();
                                            },
                                          );
                                        }
                                      : null,
                                    child: Column(
                                      children: [
                                        Text(
                                            '${task['type']}',style: TextStyle(
                                              fontFamily: 'StarRail',
                                              fontSize: 16,
                                              color: Colors.white
                                            )),
                                            Text('${task['status']}',style: TextStyle(
                                              fontFamily: 'StarRail',
                                              fontSize: 16,
                                              color: Colors.white
                                            ))
                                      ],
                                    ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
          ),
          Expanded(flex:1,child: Container())
                ]
    );
  }
}

class TaskDetailDialog extends StatefulWidget {
  const TaskDetailDialog({Key? key}) : super(key: key);

  @override
  _TaskDetailDialogState createState() => _TaskDetailDialogState();
}

class _TaskDetailDialogState extends State<TaskDetailDialog> {
  // TODO: 从后端读取任务的详情
  final taskName = '阅读任务';
  final taskDescription = '阅读一篇英文文章，并回答问题';
  final taskDifficulty = '中等';
  final taskReward = '10积分';
  final media = 'assets/images/media.png';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).height*0.18,horizontal:MediaQuery.sizeOf(context).width*0.10),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pink[300],
            title: Center(child: Text('任务详情       ')),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(child: Text('$taskName',style: TextStyle(fontFamily: 'StarRial',
                        fontSize: 16),)),
                        Container(height: MediaQuery.sizeOf(context).height*0.1,
                        child: Column(
                          children: [
                            Expanded(flex: 1,child:Center(child: Text('任务描述'))),
                            Expanded(
                              flex: 3,
                              child: Text('$taskDescription'),
                            )
                        ]),),
                        Text('任务难度：$taskDifficulty'),
                        Text('任务奖励：$taskReward'),
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(media),
                  ),
                  Row(
                    children: [
                      Opacity(
                        opacity: 0.8,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.pink[200],
                              primary: Colors.white
                            ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          
                          child: Text('返回'),
                        ),
                      ),
                      Spacer(),
                      Opacity(
                        opacity: 0.8,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.pink[200],
                            primary: Colors.white
                          ),
                          onPressed: () {
                            // TODO: 提交任务到后端
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('提交成功'),
                              ),
                            );
                            Navigator.pop(context);
                          },
                          child: Text('提交'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
