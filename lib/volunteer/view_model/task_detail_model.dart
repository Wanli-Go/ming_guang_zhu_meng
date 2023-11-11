import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/components/task_detail_components.dart';
import 'package:ming_guang/volunteer/model/model_mission_detail.dart';
import 'package:ming_guang/volunteer/services/tasks_service.dart';
import 'package:ming_guang/volunteer/view_model/notifiers/notifier_update_task_info.dart';

class TaskDetailViewModel {
  final TaskService taskService;
  final pageSize = 4;
  late String taskId;

  TaskDetailViewModel(this.taskId, {required this.taskService});

  Future<MissionDetail> fetchMissionDetail(String taskId) async {
    return taskService.getMissionDetail(taskId);
  }

  int pageNum = 1;
  Future<List<UngradedCompletion>> fetchUngradedCompletions() async {
    return taskService.getUngradedCompletions(pageNum, pageSize, taskId);
  }

  Future<List<UngradedCompletion>> refresh() async {
    pageNum += 1;
    return taskService.getUngradedCompletions(pageNum, pageSize, taskId);
  }

  Future<void> submitScore(String kidId, String missionId, int score,
      BuildContext context, TaskInfoUpdateNotifier notifier) async {
    bool success = await taskService.inputScore(kidId, missionId, score);
    if (success) {
            await Future.delayed(Duration(seconds: 1));
      notifier.update();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('提交成功'),
        ),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Oops，好像没提交成功呀'),
        ),
      );
    }
  }

  void scalePic(BuildContext context, String imageUrl, String tag) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImageScreen(imageUrl: imageUrl, tag: tag),
        ));
  }
}
