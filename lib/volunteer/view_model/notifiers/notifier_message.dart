import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ming_guang/volunteer/model/model_message.dart';
import 'package:path_provider/path_provider.dart';

class MessageNotifier extends ChangeNotifier {
  late List<Message> messageList;

  void newMessage(
      {required String content,
      required String toId,
      required String fromId,
      required bool isInCurrentDialogue}) {
    var newMessage = Message(
        content: content,
        time: timeFormatter(DateTime.now().hour, DateTime.now().minute),
        fromId: fromId,
        toId: toId,
        isRead: isInCurrentDialogue);
    messageList.insert(0, newMessage);
    notifyListeners();
  }

  List<Message> messagesForConversation(String userId, String otherId) {
    return messageList
        .where((message) {
          return (message.fromId == userId && message.toId == otherId) ||
              (message.fromId == otherId && message.toId == userId);
        })
        .toList()
        .reversed
        .toList(); // Reverse the list to have the newest messages at the end.
  }

  void sendMessage(String content, String fromId, String toId) {
    newMessage(
        content: content,
        toId: toId,
        fromId: fromId,
        isInCurrentDialogue: true);
  }

  void see({required String childId}) {
    messageList = messageList.map((e) {
      if (e.isRead == false && e.fromId == childId) {
        Message readMessage = Message(
            content: e.content,
            time: e.time,
            fromId: e.fromId,
            toId: e.toId,
            isRead: true);
        return readMessage;
      } else {
        return e;
      }
    }).toList();
    notifyListeners();
  }

  Future<File> _getLocalFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/messages.json');
  }

  Future<void> saveMessagesToFile() async {
    final file = await _getLocalFile();
    List<Map<String, dynamic>> jsonList =
        messageList.map((message) => message.toJson()).toList();
    await file.writeAsString(json.encode(jsonList));
  }

  Future<void> loadMessagesFromFile() async {
    print("messageLoaded");
    final file = await _getLocalFile();

    // Check if the file exists, if not load from assets
    if (!await file.exists()
      ) {
      // Load messages from bundled JSON file
      String data = await rootBundle.loadString('assets/data/messages.json');
      await file.writeAsString(data);
    }

    // Now read the file
    String contents = await file.readAsString();
    List<dynamic> jsonList = json.decode(contents);
    messageList = jsonList.map((json) => Message.fromJson(json)).toList();
  }
}
