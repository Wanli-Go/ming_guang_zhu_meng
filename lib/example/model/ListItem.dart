import 'package:ming_guang/example/model/commention.dart';

class ListItem {
  String imageURL;
  String text1;
  String text2;

  ListItem(this.imageURL, this.text1, this.text2);

  String get _imageURL => imageURL;
  String get _text1 => text1;
  String get _text2 => text2;

}
List<ListItem> items = [
  ListItem(homeworkComment.comment0, homeworkComment.comment1, homeworkComment.comment2),
 ListItem(homeworkComment.comment0, homeworkComment.comment1, homeworkComment.comment2),
  ListItem(homeworkComment.comment0, homeworkComment.comment1, homeworkComment.comment2),
 ListItem(homeworkComment.comment0, homeworkComment.comment1, homeworkComment.comment2),
 ListItem(homeworkComment.comment0, homeworkComment.comment1, homeworkComment.comment2),
 ListItem(homeworkComment.comment0, homeworkComment.comment1, homeworkComment.comment2),
 ListItem(homeworkComment.comment0, homeworkComment.comment1, homeworkComment.comment2),
 ListItem(homeworkComment.comment0, homeworkComment.comment1, homeworkComment.comment2),
  
];