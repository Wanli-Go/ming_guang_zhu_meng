

class HomeworkComment{
  String homeworkName;
  String studentName;
  String data;
  String photo;
  String comment0; 
  String comment1; 
  String comment2; 

HomeworkComment({
  required this.comment0,
   required this.comment1,
    required this.comment2,
  required this.data,
  required this.homeworkName,
  required this.photo,
  required this.studentName,
 });
  String get _homeworkName => homeworkName;
  String get _studentName => studentName;
  String get _data => data;
  String get _photo => photo;
  String get _comment0 => comment0; 
  String get _comment1 => comment1; 
  String get _comment2 => comment2; 

}




HomeworkComment homeworkComment = HomeworkComment(
  homeworkName: '将进酒',
  studentName:'猫猫猫' ,
  data:'2021.01.01',
  photo: 'assets/markUrl.png',
  comment0:'assets/boy.png',
  comment1:'王小明',
  comment2:'讲的真好太棒了！',
  );
  
 