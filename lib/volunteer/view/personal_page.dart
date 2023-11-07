import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/components/personal_page_widgets.dart';
import 'package:ming_guang/volunteer/model/modelVolunteer.dart';
import 'package:ming_guang/volunteer/themes/main_theme.dart';

class MyHomePage extends StatefulWidget {
  final VolunteerPerson volunteerPerson = dummyPerson;

  MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late VolunteerPerson volunteerPerson;

  @override
  void initState() {
    super.initState();
    volunteerPerson = widget.volunteerPerson;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Center(child: Text("个人信息")),
        actions: const [Icon(Icons.abc, size: 50, color: Colors.transparent)],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // In Components
          TopWidget(size: size, volunteerPerson: volunteerPerson),

          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.6,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.only(left: 50, right: 45),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.68),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                // Method in Components
                buildDetailRow(Icons.man_outlined, '性别', volunteerPerson.sex),
                buildDetailRow(
                    Icons.cake_outlined, '年龄', '${volunteerPerson.age}'),
                buildDetailRow(
                    Icons.event_outlined, '生日', volunteerPerson.birthday),
                buildDetailRow(
                    Icons.place_outlined, '地区', volunteerPerson.area),
                const SizedBox(height: 30),
                const Text(
                  '简介:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  volunteerPerson.description,
                  style: const TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 120),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          highlight, // Change this color to the one you want
                    ),
                    onPressed: () {
                      modificationBottonPressed(context);
                    },
                    child: const Text('修改信息'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> modificationBottonPressed(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        String updatedSex = volunteerPerson.sex;
        int updatedAge = volunteerPerson.age;
        String updatedBirthday = volunteerPerson.birthday;
        String updatedArea = volunteerPerson.area;
        String updatedDescription = volunteerPerson.description;

        return AlertDialog(
          title: const Text('修改信息'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('性别'),
              DropdownButton<String>(
                value: updatedSex,
                onChanged: (String? newValue) {
                  setState(() {
                    updatedSex = newValue!;
                  });
                },
                items: ['男', '女'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              const Text('年龄'),
              TextFormField(
                initialValue: updatedAge.toString(),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    updatedAge = int.tryParse(value) ?? 0;
                  });
                },
              ),
              const SizedBox(height: 10),
              const Text('生日'),
              TextFormField(
                initialValue: updatedBirthday,
                onChanged: (value) {
                  setState(() {
                    updatedBirthday = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              const Text('地区'),
              TextFormField(
                initialValue: updatedArea,
                onChanged: (value) {
                  setState(() {
                    updatedArea = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              const Text('简介'),
              TextFormField(
                initialValue: updatedDescription,
                onChanged: (value) {
                  setState(() {
                    updatedDescription = value;
                  });
                },
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                      backgroundColor:
                          highlight, // Change this color to the one you want
                    ),
              child: const Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                      backgroundColor:
                          highlight, // Change this color to the one you want
                    ),
              child: const Text('保存'),
              onPressed: () {
                setState(() {
                  volunteerPerson.sex = updatedSex;
                  volunteerPerson.age = updatedAge;
                  volunteerPerson.birthday = updatedBirthday;
                  volunteerPerson.area = updatedArea;
                  volunteerPerson.description = updatedDescription;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
