class User {
  String name;
  String imageUrl;
  String comment;
  String commentDate;

  User(
      {required this.name,
      required this.imageUrl,
      required this.comment,
      required this.commentDate});

  String get _name => name;
  String get _imageUrl => imageUrl;
  String get _comment => comment;
  String get _commentDate => commentDate;
}
