import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/model/TaskItem.dart';
import 'package:ming_guang/volunteer/themes/main_theme.dart';
import 'package:ming_guang/volunteer/view_model/task_list_model.dart';

// Assume the TaskService and TaskItem match the API structure

class TaskList extends StatefulWidget {
  

  const TaskList({super.key});

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final TextEditingController _controller = TextEditingController();

  // Instance of your TaskListModel
  final TaskListModel _model = TaskListModel();

  Future<List<TaskItem>>? _futureTasks;

  @override
  void initState() {
    super.initState();
    // Load the tasks when the widget is first created
    _futureTasks = _model.loadNewTaskItems(); // Assuming you want to load the first 10 items
  }

  void _searchAndUpdate(String query) {
    // Call setState to rebuild the FutureBuilder with the latest search query
    setState(() {
      _futureTasks = _model.loadTaskItems(); // You can adjust the logic to incorporate search in your API call if possible
    });
  }

  void _refresh(){
    setState(() {
      _futureTasks = _model.refresh(); // You can adjust the logic to incorporate search in your API call if possible
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: '输入关键字...',
                    ),
                    onChanged: (value) {
                      _searchAndUpdate(value);
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    _searchAndUpdate(_controller.text);
                  },
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder<List<TaskItem>>(
                future: _futureTasks,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: highlight,
                            strokeWidth: 10,
                          )),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    // Filter the tasks based on the search query
                    var tasks = snapshot.data!.where((task) {
                      return task.title
                          .toLowerCase()
                          .contains(_controller.text.toLowerCase());
                    }).toList();

                    bool notQuerying = tasks.length == snapshot.data!.length;

                    if (tasks.isEmpty) {
                      return const Text('没有找到相关任务。');
                    }

                    return ListView.separated(
                      itemCount: notQuerying ? (tasks.length + 1) : tasks.length,
                      itemBuilder: (context, index) {
                        if(index == tasks.length){
                          if (!notQuerying) {
                            return const Center(child: CircularProgressIndicator());
                          } else {
                            return ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(highlight)),
                            onPressed: _refresh,
                            child: const Text('刷新'),
                          );
                          }
                        }
                        TaskItem task = tasks[index];
                        return Container(
                          margin: const EdgeInsets.only(
                              top: 10,), // Add some space around the card
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.white.withOpacity(0.6)
                            ),
                            gradient: gradientDecoration,
                            borderRadius:
                                BorderRadius.circular(10), // Rounded corners
                            boxShadow: [
                              BoxShadow(
                                color:
                                    Colors.grey.withOpacity(0.5), // Soft shadow
                                spreadRadius: 0,
                                blurRadius: 3,
                                offset:
                                    Offset(0, 3), // Changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(
                                    16.0), // Consistent padding for the whole card
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        task.title,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight
                                              .bold, // Make the title bold
                                        ),
                                        overflow: TextOverflow
                                            .ellipsis, // Avoid text overflow
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Colors.pink[200], // Use theme color
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              30), // Rounded button edges
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 10), // Button padding
                                      ),
                                      onPressed: () => _model.navigateToDetails(
                                          context: context,
                                          task: task),
                                      child: const Text(
                                        '查看详情',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16,
                                    right: 16,
                                    bottom: 16), // Consistent padding for text
                                child: Text(
                                  '提交总数：${task.totalSubmit}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16,
                                    right: 16,
                                    bottom: 16), // Consistent padding for text
                                child: Row(
                                  children: [
                                    const Text(
                                      '待批改数：',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '${task.waitingCheck}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: highlight
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 15),
                    );
                  } else {
                    return const Text('No tasks available.');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
