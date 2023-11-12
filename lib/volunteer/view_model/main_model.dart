import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/model/model_message.dart';
import 'package:ming_guang/volunteer/services/message_service.dart';
import 'package:ming_guang/volunteer/view/message_center.dart';
import 'package:ming_guang/volunteer/view/personal_page.dart';
import 'package:ming_guang/volunteer/view/search.dart';
import 'package:ming_guang/volunteer/view_model/articles_model.dart';

class MainModel {
  MainModel();

  MessageService messageService = MessageService();

  void personalBottonClicked(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ));
  }

  void messageBottonClicked(BuildContext context) async {
    List<Child> children = await messageService.fetchChildren();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MessageCenter(children: children,),
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
