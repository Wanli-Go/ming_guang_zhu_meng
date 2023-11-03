import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/view/message_center.dart';
import 'package:provider/provider.dart';
import './model/model.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MessageNotifier(),
      child: const MessageCenter(),
    );
  }
}

class MessageNotifier extends ChangeNotifier{
  List<Message> messageList = generateDummyMessages(count: 20);
  

  void newMessage({required content, required String toId, required String fromId, required isInCurrentDialogue}){
    var newMessage = Message(content: content, time: DateTime.now().toString(), fromId: fromId, toId: toId, isRead: isInCurrentDialogue);

    messageList.add(newMessage);

    notifyListeners();
  }
  

  void see({required String childId}){
    messageList.map((e) {
      if(e.isRead == false && e.fromId == childId){
        Message readMessage = Message(content: e.content, time: e.time, fromId: e.fromId, toId: e.toId, isRead: true);
        return readMessage;
      }else {
        return e;
      }
    });
    notifyListeners();
  }

}