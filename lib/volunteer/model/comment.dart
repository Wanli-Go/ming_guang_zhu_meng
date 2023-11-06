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
}

final List<Comment> commentsss = [
  Comment(
      username: '王小花',
      publishTime: '2023/9/1',
      profileUrl: 'assets/images/profile1.jpg',
      comments: '说的太有道理了！！！收藏'),
  Comment(
      username: '蔡小刀',
      publishTime: '2023/10/1',
      profileUrl: 'assets/images/profile2.jpg',
      comments: '我们要好好践行志愿精神！'),
];
