import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/model/model.dart';
import 'package:ming_guang/volunteer/view_model/task_list_model.dart';

TaskListModel model = TaskListModel();

// 定义一个stateful界面
class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

// 定义一个state类
class _TaskListState extends State<TaskList> {
  // 定义一个控制器，用于获取搜索框的输入
  TextEditingController _controller = TextEditingController();

  // 定义一个方法，用于根据搜索框的输入过滤任务列表
  List<Task> filterTasks(String query) {
    // 如果搜索框为空，返回原始的任务列表
    if (query.isEmpty) {
      return task_list;
    } else {
      // 否则，返回包含搜索框输入的任务列表
      return task_list
          .where((task) => task.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width*0.85,
        height: MediaQuery.sizeOf(context).height*0.8,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: '请输入任务的名称', // 搜索框中的提示
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search), // 搜索按钮的图标
                  onPressed: () {
                    // 点击搜索按钮后，刷新界面
                    setState(() {});
                  },
                ),
              ],
            ),
            Expanded(
              child: ListView.separated(
                // row下面是一个listview
                itemCount: filterTasks(_controller.text).length, // listview的项数
                itemBuilder: (context, index) {
                  // listview的构建方法
                  Task task = filterTasks(_controller.text)[index]; // 获取当前的任务
                  return Container(
                    // listview中包含多个container
                    padding: EdgeInsets.all(10), // container的内边距
                    child: Column(
                      // container中有三行
                      crossAxisAlignment: CrossAxisAlignment.start, // 三行文本左对齐
                      children: [
                        Row(
                          // 第一行是一行文本和一个按钮
                          mainAxisAlignment: MainAxisAlignment.spaceBetween, // 文本和按钮分开
                          children: [
                            Text(task.name,style: TextStyle(fontFamily: 'StarRial',fontSize: 20),), // 文本对应任务名称
                            ElevatedButton(
                              // 按钮的样式
                              child: Text('查看详情',style: TextStyle(
                          fontFamily: 'StarRial',
                          fontSize: 16
                        ),), // 按钮的文本
                              style: ElevatedButton.styleFrom(
                                primary: Colors.pink[200]
                              ),
                              onPressed: () => model.navigateToDetails(context: context, taskName: task.name),
                            ),
                          ],
                        ),
                        Text('提交总数：${task.submit_count}',style: 
                        TextStyle(
                          fontFamily: 'StarRial',
                          fontSize: 16
                        ),), // 第二行是一行文本，对应提交总数
                        Text('待批改数：${task.to_be_corrected}',style:
                        TextStyle(
                          fontFamily: 'StarRial',
                          fontSize: 16
                        ),), // 第三行是一行文本，对应待批改数
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  // container间隔15像素
                  return SizedBox(height: 15);
                },
              ),
            ),
          ]
        ),
      ),
    );
      
  }
}
