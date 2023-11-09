import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/model/TaskItem.dart';
import 'package:ming_guang/volunteer/services/tasks_service.dart';
import 'package:ming_guang/volunteer/view/task_detail.dart';

class TaskListModel {
  TaskService taskService = TaskService();

  void navigateToDetails(
      {required BuildContext context, required TaskItem task}) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              TaskDetailPage(taskItem: task, taskService: taskService),
        ));
  }

  List<TaskItem> tasks = [];
  var pageNum = 1;
  var pageSize = 9;
  Future<List<TaskItem>> loadTaskItems() async {
    List<TaskItem> tasks = await taskService.fetchTaskItems(pageNum, pageSize);
    return tasks;
  }
  Future<List<TaskItem>> loadNewTaskItems() async {
    pageNum = 1;
    pageSize = 9;
    List<TaskItem> tasks = await taskService.fetchTaskItems(pageNum, pageSize);
    return tasks;
  }
  Future<List<TaskItem>> refresh() async {
    pageNum += 1;
    List<TaskItem> tasks = await taskService.fetchTaskItems(pageNum, pageSize);
    return tasks;
  }
}
