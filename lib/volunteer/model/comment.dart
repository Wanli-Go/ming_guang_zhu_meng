class Comment {
  final String username;
  final String publishTime;
  final String profileUrl;
  final String comments;

  Comment(
      {required this.username,
      required this.publishTime,
      required this.profileUrl,
      required this.comments});


  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      username: json['name'],
      publishTime: json['time'],
      profileUrl: json['photo'],
      comments: json['content'],
    );
  }
}

final List<Comment> commentsss = [
  Comment(
      username: '王小花',
      publishTime: '2023/9/1',
      profileUrl: 'profile1.jpg',
      comments: '说的太有道理了！！！收藏'),
  Comment(
      username: '蔡小刀',
      publishTime: '2023/10/1',
      profileUrl: 'profile2.jpg',
      comments: '我们要好好践行志愿精神！'),
];
