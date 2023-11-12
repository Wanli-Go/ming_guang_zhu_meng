import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ming_guang/child/model/child.dart';
import 'package:ming_guang/volunteer/services/base/base_url.dart';
import 'package:ming_guang/volunteer/services/message_service.dart';
import 'package:ming_guang/volunteer/services/sse_service.dart';
import 'package:ming_guang/volunteer/view_model/notifiers/notifier_message.dart';
import 'package:provider/provider.dart';

class ChatFrameModel{
  final String childId;

  final BuildContext context;

  late SseService _sseService;

  late MessageService _service;

  ChatFrameModel({required this.childId, required this.context}){
    _sseService = SseService();

    _service = MessageService();

    _sseService.connect("$baseUrl/chat/receive/${childId}");

    StreamSubscription<String> _sseSubscription = _sseService.stream.listen((data) {
      Provider.of<MessageNotifier>(context, listen: true).newMessage(content: data, fromId: childId, toId: "0", isInCurrentDialogue: false);
    });
  }

  void sendMessagetoServer(String message){
    _service.sendMessageToServer(childId, message);
  }  
}