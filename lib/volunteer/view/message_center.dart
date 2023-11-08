import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/view/chat_frame.dart';
import 'package:ming_guang/volunteer/view_model/message_notifier.dart';
import 'package:provider/provider.dart';
import '../model/model.dart';

class MessageCenter extends StatelessWidget {
  const MessageCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 232, 241),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 236, 130, 165),
        title: Center(child: Text("${user.name} 的 消息中心")),
        actions: const [Icon(Icons.abc, size: 50, color: Colors.transparent)],
      ),
      body: const MCColumn(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.pages_rounded), label: "Main"),
          BottomNavigationBarItem(
              icon: Icon(Icons.table_chart_sharp), label: "Resources"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        ],
      ),
    );
  }
}

class MCColumn extends StatelessWidget {
  const MCColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MessageNotifier>(builder: (context, notifier, child) {
      return ListView.builder(
        itemCount: childs.length,
        itemBuilder: (context, index) {
          return Column(children: [
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.06),
              child: SubjectContainer(index: index, notifier: notifier),
            )
          ]);
        },
      );
    });
  }
}

class SubjectContainer extends StatelessWidget {
  final int index;
  final MessageNotifier notifier;

  const SubjectContainer(
      {required this.index, required this.notifier, super.key});

  List<dynamic> _getFirstMessage(List<Message> messageList) {
    String result = "";
    Color color = Colors.black;
    for (var element in messageList) {
      var received = element.fromId == childs[index].id;
      var sent = element.fromId == user.id && element.toId == childs[index].id;
      if (received || sent) {
        if (sent) {
          result += "→  ";
        } else if (element.isRead == false) {
          result += "·  ";
          color = const Color.fromARGB(255, 255, 86, 86);
        }
        result += element.content;
        break;
      }
    }
    return [result, color];
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
                            backgroundImage: childs[index].imageLink != null
                                ? NetworkImage(childs[index].imageLink!)
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
                            childs[index].name,
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
                              text: childs[index].description ?? "无信息可用  "),
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ChatScreen(
                          key: UniqueKey(),
                          userId: user.id,
                          toId: childs[index].id)));
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
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

class TextFade extends StatelessWidget {
  final String text;
  final Color color;
  double? fontSize;
  FontWeight? fontWeight;
  TextFade({
    required this.color,
    required this.text,
    this.fontSize,
    this.fontWeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // 这是用 ChatGPT 生成的一个文本组件，实现了当文本过长时自动淡出的效果。
      // 多多利用 ChatGPT 达到类似的效果、提高开发效率。
      // padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding for the container
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            colors: [Colors.white, Colors.transparent],
            stops: [
              0.90,
              1.0
            ], // 90% of the text will be fully visible, the last 10% will fade out
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ).createShader(bounds);
        },
        blendMode: BlendMode
            .dstIn, // This blend mode will apply the gradient as a mask
        child: Text(
          text,
          softWrap: false,
          overflow:
              TextOverflow.clip, // Clip the overflow to ensure the fade effect
          style: TextStyle(
            fontSize: (fontSize ?? 14.0),
            fontWeight: fontWeight ?? FontWeight.bold,
            color: color,
          ),
        ),
      ),
    );
  }
}
