import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/model/model.dart';

class MessageNotifier extends ChangeNotifier{
  List<Message> messageList = generateDummyMessages(count: 20);

  // This method is updated to ensure new messages are added at the end of the list.
  void newMessage({required String content, required String toId, required String fromId, required bool isInCurrentDialogue}) {
    var newMessage = Message(content: content, time: timeFormatter(DateTime.now().hour, DateTime.now().minute), fromId: fromId, toId: toId, isRead: isInCurrentDialogue);
    messageList.insert(0, newMessage); // The newest message is at the beginning of the list.
    notifyListeners();
  }

  // Updated to return messages in the order where the newest is at the end.
  List<Message> messagesForConversation(String userId, String otherId) {
    return messageList.where((message) {
      return (message.fromId == userId && message.toId == otherId) ||
             (message.fromId == otherId && message.toId == userId);
    }).toList().reversed.toList(); // Reverse the list to have the newest messages at the end.
  }
  // Method to send a new message
  void sendMessage(String content, String fromId, String toId) {
    newMessage(content: content, toId: toId, fromId: fromId, isInCurrentDialogue: true);
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