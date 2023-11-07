import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/view/child_status.dart';

import 'bottom_nav_notifier.dart';

class HomePageModel{

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
  
}