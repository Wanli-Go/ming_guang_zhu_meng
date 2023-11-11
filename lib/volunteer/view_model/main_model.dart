import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/view/message_center.dart';
import 'package:ming_guang/volunteer/view/personal_page.dart';
import 'package:ming_guang/volunteer/view/search.dart';
import 'package:ming_guang/volunteer/view_model/articles_model.dart';

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

  void searchClicked(BuildContext context, String value, ArticlesModel model) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchPage(firstKeyword: value, model: model),
        ));
  }
}
