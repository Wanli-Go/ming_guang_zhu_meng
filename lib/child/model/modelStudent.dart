class Student{
  String name;
  String countingUrl;
  String markUrl;
  String imageUrl;
  double nessary;
  double choose;
  String description; 

 Student({
  required this.name,
  required this.imageUrl,
  required this.choose,
  required this.countingUrl,
  required this.markUrl,
  required this.nessary,
  required this.description,
 });

}

Student student = Student(
  name: '蔡小刀',
  imageUrl:'assets/boy.png' ,
  countingUrl:'assets/countingUrl.png',
  markUrl: 'assets/markUrl.png',
  nessary: 0.9,
  choose: 0.3,
  description: '成绩日渐优异、名列前茅，生活在捐助的帮助下变得更加富裕，从而更专注于学习',
  );

