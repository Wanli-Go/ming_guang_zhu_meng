import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/view/child_status.dart';
import 'package:ming_guang/volunteer/view/message_center.dart';
import 'package:ming_guang/volunteer/view/personal_page.dart';
import 'package:ming_guang/volunteer/view/search.dart';

class MainModel {
  const MainModel();

  void personalBottonClicked(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ));
  }

  void messageBottonClicked(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MessageCenter(),
        ));
  }

  void mainChildRecentStatusClicked(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ChildSituationPage(),
        ));
  }

  void searchClicked(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SearchPage(),
        ));
  }
}
