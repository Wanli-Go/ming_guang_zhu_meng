class VolunteerPerson{
  String name;
  String imageUrl;
  String sex;
  String birthday;
  String area;
  int age;
  String description; 
  String childImageUrl;
  String childName;
  String childDescription; 
  String tasks;


 VolunteerPerson({
  required this.name,
  required this.imageUrl,
  required this.sex,
  required this.birthday,
  required this.area,
  required this.age,
  required this.description,
  required this.childDescription,
  required this.childImageUrl,
  required this.childName,
  required this.tasks,

 });

 String get _name=>name;
 String get _imageUrl => imageUrl;
 String get _sex => sex;
 String get _birthday => birthday;
 String get _area => area;
 int get _age => age;
 String get _description => description;
 String get _childDescription => childDescription;
 String get _childImageUrl => childImageUrl;
 String get _childName => childName;
 String get _tasks => tasks;
}

VolunteerPerson dummyPerson = VolunteerPerson(
  name: '王小花',
  imageUrl:'assets/woman.png' ,
  sex: '女',
  birthday: '2000-10-11',
  area: '东北',
  age: 23,
  description: '热心帮助贫困儿童',
  childDescription:  '成绩日渐优异、名列前茅，生活在捐助的帮助下变得更加富裕，从而更专注于学习',
  childImageUrl: 'assets/boy.png' ,
  childName:  '蔡小刀',
  tasks: '帮助学生蔡小刀完成其错误较多的题目3,学上当前正确率仅为30%,其已将此题列为重点未掌握知识！'
  );

