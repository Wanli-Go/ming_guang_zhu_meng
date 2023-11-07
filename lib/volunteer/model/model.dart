import 'dart:math';

class Volunteer{
  final String id;
  final String name;
  String? imageLink;

  Volunteer({required this.id, required this.name, this.imageLink});
}

class Child{
  final String id;
  final String name;
  String? imageLink;
  String? description;

  Child({required this.id, required this.name, this.imageLink, this.description});
}

class Message{
  final String content;
  final String time;
  final String toId;
  final String fromId;
  final bool isRead;
  const Message({required this.content, required this.time, required this.fromId, required this.toId, required this.isRead});
}

// Dummy Users 
var childAnn = Child(id: "573842", name: "Ann", imageLink: "http://img.crcz.com/allimg/201912/01/1575205350650038-lp.jpg");
var childKusnali = Child(id: "867432", name: "饮月君", description: "来自山东，日照。留守儿童。性活泼，喜乐子。");

var childs = [childAnn, childKusnali];

var user = Volunteer(id: "124321", name: "Archie", imageLink: "http://img.crcz.com/allimg/202002/24/1582515688693328-lp.jpg");


// Dummy Messages
Random random = Random();

List<String> dummyContents = [
  "How are you doing today?",
  "Don't forget our meeting tomorrow.",
  "I loved the drawing you sent!",
  "Can we schedule a call this weekend?",
  "I have some exciting news to share!",
  "Remember to do your homework.",
  "What's your favorite game?",
  "See you at the park later.",
  "Happy Birthday!",
  "Is there anything you need help with?",
  "The weather is nice for a walk.",
  "I found a new book for us to read.",
  "How was school today?",
  "Do you want to play badminton this Friday?",
  "I've got a new story to tell you.",
  "Let's learn something new today.",
  "What did you have for lunch?",
  "Did you finish your art project?",
  "Let's plan our next adventure.",
  "Keep practicing, you're doing great!"
];

String generateRandomTime() {
  int hour = random.nextInt(24);
  int minute = random.nextInt(60);
  return timeFormatter(hour, minute);
}

String timeFormatter(int hour, int minute){
  return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
}

List<Message> generateDummyMessages({required int count}) {
  List<Message> messages = [];
  List<Child> children = [childAnn, childKusnali];

  for (int i = 0; i < count; i++) {
    String content = dummyContents[random.nextInt(dummyContents.length)];
    String time = generateRandomTime();
    bool isRead = random.nextBool();

    // Alternate messages between user and children
    String toId, fromId;
    if (i % 2 == 0) {
      // User sends message to a child
      toId = children[random.nextInt(children.length)].id;
      fromId = user.id;
    } else {
      // Child sends message to the user
      fromId = children[random.nextInt(children.length)].id;
      toId = user.id;
    }

    messages.add(Message(
      content: content,
      time: time,
      fromId: fromId,
      toId: toId,
      isRead: isRead,
    ));
  }
  return messages;
}

// 假设从后端获取的任务列表

List<Task> task_list = [
  Task(name: '背诵将进酒', submit_count: 10, to_be_corrected: 5,Type: '语文',massege: '背诵将进酒全文，要求上传视频'),
  Task(name: '完成几何题', submit_count: 8, to_be_corrected: 3,Type: '数学',massege: '完成人教版数学三年级上第五章课后几何题，要求上传图片'),
  Task(name: '背诵英文单词50个', submit_count: 12, to_be_corrected: 7,Type: '英语',massege: '背诵第第三单元的50个单词'),
];

// 定义一个任务类
class Task {
  String name; // 任务名称
  int submit_count; // 提交总数
  int to_be_corrected; // 待批改数
  String Type;
  String massege;

  Task({required this.name, required this.submit_count, required this.to_be_corrected,required this.Type,required this.massege});
}

class child_Task{
  String child_name;
  String child_id;
  String obtime;
  int state;

  child_Task({required this.child_name,required this.child_id,required this.obtime,required this.state
  });
}

List<child_Task> child_Task_list=[
  child_Task(child_name: '王一',child_id:'1' ,obtime: '2023/11/3' ,state: 0),
  child_Task(child_name: '王二',child_id:'2' ,obtime: '2023/11/4' ,state: 0),
  child_Task(child_name: '王三',child_id:'3' ,obtime: '2023/11/5' ,state: 0),
];


