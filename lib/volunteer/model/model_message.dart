class Child{
  final String id;
  final String name;
  String? imageLink;
  String? description;

  Child({required this.id, required this.name, this.imageLink, this.description});

  factory Child.fromJson(Map<String, dynamic> json) {
    return Child(
      id: json['id'].toString(),
      name: json['name'],
      imageLink: json['photo'],
      description: json['description'],
    );
  }
}



class Message{
  final String content;
  final String time;
  final String toId;
  final String fromId;
  final bool isRead;
  const Message({required this.content, required this.time, required this.fromId, required this.toId, required this.isRead});
  
  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'time': time,
      'fromId': fromId,
      'toId': toId,
      'isRead': isRead,
    };
  }

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      content: json['content'],
      time: json['time'],
      fromId: json['fromId'],
      toId: json['toId'],
      isRead: json['isRead'],
    );
  }
}


String timeFormatter(int hour, int minute){
  return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
}

// 定义一个任务类
class Task {
  String name; // 任务名称
  int submit_count; // 提交总数
  int to_be_corrected; // 待批改数
  String Type;
  String massege;

  Task({required this.name, required this.submit_count, required this.to_be_corrected,required this.Type,required this.massege});
}



