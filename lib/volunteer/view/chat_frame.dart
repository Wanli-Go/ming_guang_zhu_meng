import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/model/model.dart';
import 'package:ming_guang/volunteer/view_model/notifiers/notifier_message.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  final String userId;
  final String toId;

  const ChatScreen({Key? key, required this.userId, required this.toId}) : super(key: key);

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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 232, 241),
      appBar: AppBar(
        title: Text("Chat with ${getChildName(widget.toId)}"),
        backgroundColor: const Color.fromARGB(255, 236, 130, 165),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Consumer<MessageNotifier>(
              builder: (context, messageNotifier, child) {
                List<Message> messages = messageNotifier.messagesForConversation(widget.userId, widget.toId);

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
              Provider.of<MessageNotifier>(context, listen: false).sendMessage(content, widget.userId, widget.toId);
            },
          ),
        ],
      ),
    );
  }

  // Helper function to get child's name
  String getChildName(String childId) {
    // You would typically look up the child's name from your data model
    return childs.firstWhere((child) => child.id == childId).name;
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
              decoration: const InputDecoration(hintText: "Type a message"),
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
