import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/model/model_kid_recent.dart';
import 'package:ming_guang/volunteer/services/kids_service.dart';
import 'package:ming_guang/volunteer/services/tasks_service.dart';
import 'package:ming_guang/volunteer/view/child_status.dart';
import 'package:ming_guang/volunteer/view_model/notifiers/notifier_bottom_nav.dart';


class HomePageModel {
  VolunteerKidsService kidsService = VolunteerKidsService();
  TaskService taskService = TaskService();

  void mainChildRecentStatusClicked(BuildContext context, HomePageModel model) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChildSituationPage(model: model),
        ));
  }

  void mainMyTasksClicked(BuildContext context, BottomNavNotifier notifier) {
    notifier.changeIndex(0);
  }

  KidRecentDto? recentDto;
  Future<KidRecentDto> fetchShortRecent() async {
    recentDto ??= await kidsService.fetchRandomRecentKid();
    return recentDto!;
  }
  
  Future<Map<String, dynamic>> getTaskRatio() async {
    return await taskService.fetchTaskRatio();
  }
}
