class Child {
  String name;
  String imagePath;
  String school;
  String getMoney;
  String studyIntegral;
  String mallIntegral;
  String weekRanking;
  String totalRanking;

  Child(
      {required this.name,
      required this.imagePath,
      required this.school,
      required this.getMoney,
      required this.studyIntegral,
      required this.mallIntegral,
      required this.weekRanking,
      required this.totalRanking});

  String get _name => name;
  String get _imagePath => imagePath;
  String get _school => school;
  String get _getMoney => getMoney;
  String get _studyIntegral => studyIntegral;
  String get _mallIntegral => mallIntegral;
  String get _weekRanking => weekRanking;
  String get _totalRanking => totalRanking;
}

Child child = Child(
    name: '王小华',
    imagePath: 'assets/businesswoman.png',
    school: '东北小学',
    getMoney: '10000',
    studyIntegral: '1200',
    mallIntegral: '300',
    weekRanking: '1',
    totalRanking: '5');
