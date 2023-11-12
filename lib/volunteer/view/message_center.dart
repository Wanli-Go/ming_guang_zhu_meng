import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/services/base/base_url.dart';
import 'package:ming_guang/volunteer/view/chat_frame.dart';
import 'package:ming_guang/volunteer/view_model/chat_frame_model.dart';
import 'package:ming_guang/volunteer/view_model/notifiers/notifier_message.dart';
import 'package:provider/provider.dart';
import '../components/text_fade.dart';
import '../model/model_message.dart';

class MessageCenter extends StatelessWidget {
  final List<Child> children;
  const MessageCenter({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 232, 241),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 236, 130, 165),
        title: const Center(child: Text("消息中心")),
        actions: const [Icon(Icons.abc, size: 50, color: Colors.transparent)],
      ),
      body: MCColumn(
        children: children,
      ),
    );
  }
}

class MCColumn extends StatefulWidget {
  final List<Child> children;
  List<ChatFrameModel> models = [];
  MCColumn({super.key, required this.children});

  @override
  State<MCColumn> createState() => _MCColumnState();
}

class _MCColumnState extends State<MCColumn> {
  @override
  Widget build(BuildContext context) {
    for (var element in widget.children) {
      widget.models.add(ChatFrameModel(childId: element.id, context: context));
    }

    var childs = widget.children;
    return Consumer<MessageNotifier>(builder: (context, notifier, child) {
      return ListView.builder(
        itemCount: childs.length,
        itemBuilder: (context, index) {
          return Column(children: [
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.06),
              child: SubjectContainer(
                child: childs[index],
                notifier: notifier,
                model: widget.models[index],
              ),
            )
          ]);
        },
      );
    });
  }
}

class SubjectContainer extends StatelessWidget {
  final ChatFrameModel model;
  final Child child;
  final MessageNotifier notifier;

  const SubjectContainer(
      {required this.notifier,
      super.key,
      required this.child,
      required this.model});

  List<dynamic> _getFirstMessage(List<Message> messageList) {
    String result = "";
    Color color = Colors.black;
    for (var element in messageList) {
      var received = element.fromId == child.id;
      var sent = element.fromId == "0" && element.toId == child.id;
      if (received || sent) {
        if (sent) {
          result += "→  ";
        } else if (element.isRead == false) {
          result += "（新消息）";
          color = const Color.fromARGB(255, 255, 86, 86);
        }
        result += element.content;
        break;
      }
    }
    return result != "" ? [result, color] : ["暂无新消息", color];
  }

  @override
  Widget build(BuildContext context) {
    var firstMessageResult = _getFirstMessage(notifier.messageList);
    String message = firstMessageResult[0];
    Color color = firstMessageResult[1];

    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border:
                  Border.all(color: Colors.white.withOpacity(0.6), width: 2),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset:
                      const Offset(0, 3), // Changes the position of the shadow
                ),
              ],
              gradient: const LinearGradient(
                // 线性渐变
                begin: Alignment.topLeft, // 渐变开始的位置
                end: Alignment.bottomRight, // 渐变结束的位置
                colors: [
                  Color.fromARGB(255, 255, 161, 200), // 开始颜色
                  Colors.white, // 结束颜色
                ],
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.80,
            height: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Expanded(flex: 2, child: SizedBox(width: 1)),
                    Expanded(
                      flex: 5,
                      child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.pink.shade400.withOpacity(0.58),
                                  width: 2.5)),
                          child: CircleAvatar(
                            radius: size.width * 0.1,
                            backgroundImage: child.imageLink != null
                                ? NetworkImage(
                                    "$baseUrl/${child.imageLink!}",
                                    headers: {'token': global_token},
                                  )
                                : const AssetImage("assets/default.png")
                                    as ImageProvider<Object>,
                          )),
                    ),
                    const Expanded(flex: 1, child: SizedBox(width: 1)),
                    Expanded(
                      flex: 15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            child.name,
                            softWrap: false,
                            style: TextStyle(
                              //color: Color.fromARGB(255, 255, 42, 42).withOpacity(0.6),
                              fontSize: 32,
                              letterSpacing: 1,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 1.8
                                ..color = Colors.pink.shade400,
                            ),
                          ),
                          TextFade(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              text: child.description ?? "无信息可用  "),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(
                          color: Colors.pinkAccent.withOpacity(0.6), width: 2)),
                  padding: const EdgeInsets.all(13),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextFade(text: message, color: color),
                  ),
                )
              ],
            ),
          ),
          Positioned(
              right: 0,
              top: 52,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return ChatScreen(
                      key: UniqueKey(),
                      child: child,
                      model: model,
                    );
                  })).then((value) {
                    notifier.see(childId: child.id);
                    Provider.of<MessageNotifier>(context, listen: false)
                        .saveMessagesToFile();
                  });
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 5, color: Colors.white.withOpacity(0.84))),
                    child: const Icon(Icons.arrow_forward,
                        size: 50, color: Colors.pinkAccent)),
              ))
        ],
      ),
    );
  }
}
