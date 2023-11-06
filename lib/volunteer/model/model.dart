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
