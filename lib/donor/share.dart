import 'package:flutter/material.dart';

class StudentInfo {
  final String name;
  final String school;
  final int age;
  final String personalSituation;
  final String photoUrl;

  StudentInfo({
    required this.name,
    required this.school,
    required this.age,
    required this.personalSituation,
    required this.photoUrl,
  });

  static Future<StudentInfo> fetchFromBackend() async {
    await Future.delayed(const Duration(seconds: 2));
    // 这里假设你有一个有效的图片路径，如果是网络图片，请使用网络图片地址
    return StudentInfo(
      name: '王小花',
      school: '振兴路小学',
      age: 8,
      personalSituation: '家里没人，我吃不饱饭，不能给原神充钱，温迪不要我了',
      photoUrl: 'assets/1.jpg',
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return theme();
  }
}

class theme extends StatelessWidget {
  const theme({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '支持学生',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.pink.shade50, // 设置背景颜色为淡粉色
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          shadowColor: Colors.pink.shade100,
        ),
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.pink.shade800, fontWeight: FontWeight.bold),
          bodyText2: TextStyle(color: Colors.pink.shade600),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink.shade300,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.pink.shade300,
          unselectedItemColor: Colors.grey.shade600,
        ),
      ),
      home: const StudentSupportPage(),
    );
  }
}

class StudentSupportPage extends StatefulWidget {
  const StudentSupportPage({Key? key}) : super(key: key);

  @override
  State<StudentSupportPage> createState() => _StudentSupportPageState();
}

class _StudentSupportPageState extends State<StudentSupportPage> {
  late Future<StudentInfo> studentInfo;

  @override
  void initState() {
    super.initState();
    studentInfo = StudentInfo.fetchFromBackend();
  }

  @override
  Widget build(BuildContext context) {
    return main_structure(studentInfo: studentInfo);
  }
}

class main_structure extends StatelessWidget {
  const main_structure({
    super.key,
    required this.studentInfo,
  });

  final Future<StudentInfo> studentInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('分享'),
      ),
      body: FutureBuilder<StudentInfo>(
        future: studentInfo,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(snapshot.data!.photoUrl, fit: BoxFit.cover, height: 200),
                    ),
                    const SizedBox(height: 16),
                    StudentInfoWidget(studentInfo: snapshot.data!),
                    const SizedBox(height: 24),
                    Text(
                      '加油华为，加油China！',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      '为未来加油，支持学生！',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: 分享逻辑
                      },
                      child: const Text('分享到微信QQ'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink.shade300,
                        onPrimary: Colors.white,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: Text('No data'));
          }
        },
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}

class StudentInfoWidget extends StatelessWidget {
  final StudentInfo studentInfo;

  const StudentInfoWidget({
    Key? key,
    required this.studentInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return introduce_student(studentInfo: studentInfo);
  }
}

class introduce_student extends StatelessWidget {
  const introduce_student({
    super.key,
    required this.studentInfo,
  });

  final StudentInfo studentInfo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('姓名：${studentInfo.name}', style: Theme.of(context).textTheme.bodyText1),
            const SizedBox(height: 8),
            Text('学校：${studentInfo.school}', style: Theme.of(context).textTheme.bodyText1),
            const SizedBox(height: 8),
            Text('年龄：${studentInfo.age}岁', style: Theme.of(context).textTheme.bodyText1),
            const SizedBox(height: 16),
            Text(
              '个人情况：${studentInfo.personalSituation}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bottom();
  }
}

class bottom extends StatelessWidget {
  const bottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "主页",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.leaderboard),
          label: "排行榜",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: "捐赠记录",
        ),
      ],
    );
  }
}
