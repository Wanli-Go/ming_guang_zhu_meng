import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/model/model_message.dart';
import 'package:ming_guang/volunteer/view_model/chat_frame_model.dart';
import 'package:ming_guang/volunteer/view_model/notifiers/notifier_message.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  final String userId = "0";
  final Child child;
  final ChatFrameModel model;

  const ChatScreen({Key? key, required this.child, required this.model}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState(userId: userId);
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController(); // Using a scroll controller's dispose() method for clearing the screens
  final String userId;

  _ChatScreenState({required this.userId});

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var child = widget.child;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 232, 241),
      appBar: AppBar(
        title: Text("和 ${child.name} 的聊天"),
        backgroundColor: const Color.fromARGB(255, 236, 130, 165),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Consumer<MessageNotifier>(
              builder: (context, messageNotifier, c) {
                List<Message> messages = messageNotifier.messagesForConversation(widget.userId, child.id);

                // Scroll to the bottom on new message event
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (_scrollController.hasClients) {
                    _scrollController.animateTo(
                      _scrollController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  }
                });

                return ListView.builder(
                  controller: _scrollController,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    bool isSentByUser = message.fromId == userId;
                    return Padding(
                      padding: const EdgeInsets.only(bottom:15.0),
                      child: ListTile(
                        title: Align(
                          alignment: isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: isSentByUser ? const Color.fromARGB(255, 236, 130, 165): Colors.grey[300],
                              borderRadius: BorderRadius.circular(16.0),
                              border: Border.all(
                                width: 2,
                                color: Colors.white.withOpacity(0.6)
                              )
                            ),
                            child: Text(message.content),
                          ),
                        ),
                        subtitle: Align(
                          alignment: isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
                          child: Text(message.time)
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          MessageInputWidget(
            onSend: (String content) {
              widget.model.sendMessagetoServer(content);
              Provider.of<MessageNotifier>(context, listen: false).sendMessage(content, widget.userId, child.id);
            },
          ),
        ],
      ),
    );
  }
}

class MessageInputWidget extends StatelessWidget {
  final Function(String) onSend;
  final TextEditingController _controller = TextEditingController();

  MessageInputWidget({Key? key, required this.onSend}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: "输入一个消息..."),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              if (_controller.text.trim().isNotEmpty) {
                onSend(_controller.text.trim());
                _controller.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
