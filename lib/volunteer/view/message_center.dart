import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/model.dart';
import '../my_app.dart';

class MessageCenter extends StatelessWidget {
  const MessageCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Center(child: Text("${user.name} 的 消息中心")),
      ),
      body: const MCColumn(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.pages_rounded), label: "Main"),
          BottomNavigationBarItem(icon: Icon(Icons.table_chart_sharp), label: "Resources"),
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
    return Consumer<MessageNotifier>(
      builder: (context, notifier, child) {
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
      }
    );
  }
}

class SubjectContainer extends StatelessWidget {
  final int index;
  final MessageNotifier notifier;

  const SubjectContainer({required this.index, required this.notifier, super.key});

  String _getFirstMessage(List<Message> messageList){
    String result = "";
    for (var element in messageList) {
      if(element.fromId == childs[index].id){
        if (element.isRead == false){
          result += "·  ";
        }
        result += element.content;
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.7),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: const Offset(0, 3), // Changes the position of the shadow
                ),
        ]
      ),
      width: MediaQuery.of(context).size.width * 0.84,
      height: 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child:  (childs[index].imageLink != null ? 
                  Image.network(childs[index].imageLink!, height: 80) 
                  : Image.asset("assets/default.png", height: 80))
              ),
              Column(
                children: [
                  Text(childs[index].name,
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 35
                    ),
                  ),
                  Text(childs[index].description??"无信息可用")
                ],
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(13)
            ),
            padding: const EdgeInsets.all(13),
            child: TextFade(text: _getFirstMessage(notifier.messageList), color: Colors. redAccent),
          )
        ],
      ),
    );
  }
}

class TextFade extends StatelessWidget {
  final String text;
  final Color color;
  const TextFade({
    required this.color,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container( 
      // 这是用 ChatGPT 生成的一个文本组件，实现了当文本过长时自动淡出的效果。
      // 多多利用 ChatGPT 达到类似的效果、提高开发效率。
      padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding for the container
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            colors: [Colors.white, Colors.transparent],
            stops: [0.93, 1.0], // 90% of the text will be fully visible, the last 10% will fade out
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ).createShader(bounds);
        },
        blendMode: BlendMode.dstIn, // This blend mode will apply the gradient as a mask
        child: Text(
          text,
          softWrap: false,
          overflow: TextOverflow.clip, // Clip the overflow to ensure the fade effect
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ),
    );
  }
}