import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/model/dto_kid_recent.dart';
import 'package:ming_guang/volunteer/services/kids_service.dart';
import 'package:ming_guang/volunteer/services/tasks_service.dart';
import 'package:ming_guang/volunteer/view/child_status.dart';

import 'bottom_nav_notifier.dart';

class HomePageModel {
  VolunteerKidsService kidsService = VolunteerKidsService();
  TaskService taskService = TaskService();

  void mainChildRecentStatusClicked(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ChildSituationPage(),
        ));
  }

  void mainMyTasksClicked(BuildContext context, BottomNavNotifier notifier) {
    notifier.changeIndex(1);
  }

  dynamic recentDto;
  Future<KidRecentDto> fetchShortRecent() async {
    recentDto ??= await kidsService.fetchRandomRecentKid();
    return recentDto;
  }
  
  dynamic _taskRatio;
  Future<Map<String, int>> getTaskRatio() async {
    return _taskRatio ??= await taskService.fetchTaskRatio();
  }

  Future<Map<String, int>> getLatestTaskRatio() async {
    _taskRatio = await taskService.fetchTaskRatio();
    return _taskRatio;
  }
}
