import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/view/task_detail.dart';

class TaskListModel{
  void navigateToDetails({required BuildContext context, required String taskName}) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TaskDetailPage(taskName: taskName),
        ));
  }
}