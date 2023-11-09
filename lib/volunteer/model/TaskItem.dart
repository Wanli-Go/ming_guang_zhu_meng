class TaskItem {
  String id; // Unique identifier for the task
  String title; // Title of the task
  int totalSubmit; // Total number of submissions
  int waitingCheck; // Number of submissions waiting to be checked

  TaskItem({
    required this.id,
    required this.title,
    required this.totalSubmit,
    required this.waitingCheck,
  });

  factory TaskItem.fromJson(Map<String, dynamic> json) {
    return TaskItem(
      id: json['id'],
      title: json['title'],
      totalSubmit: json['totalSubmit'],
      waitingCheck: json['waitingCheck'],
    );
  }
}
