import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/model/model_personal_info.dart';
import 'package:ming_guang/volunteer/services/base/base_url.dart';
import 'package:ming_guang/volunteer/themes/main_theme.dart';
import 'package:ming_guang/volunteer/view_model/personal_info_model.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PersonalInfoViewModel viewModel;

  PersonalInfo? personalInfo;

  @override
  void initState() {
    super.initState();
    viewModel = PersonalInfoViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text("个人信息"),
        centerTitle: true,
        elevation: 0,
      ),
      body: FutureBuilder<PersonalInfo>(
        future: viewModel.getPersonalInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: highlight,
            ));
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error.toString()}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('没有找到个人信息'));
          }
          personalInfo ??= snapshot.data!;
          return ListView(
            children: [
              _buildProfileHeader(personalInfo!),
              _buildDetailSection(personalInfo!),
            ],
          );
        },
      ),
    );
  }

  Widget _buildProfileHeader(PersonalInfo personalInfo) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              "$baseUrl/${personalInfo.photo}",
              headers: {'token': global_token},
            ),
            backgroundColor: Colors.transparent,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  personalInfo.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: highlight,
                  ),
                ),
                Text(
                  personalInfo.job,
                  style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: appBarColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailSection(PersonalInfo personalInfo) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('性别', personalInfo.gender == 0 ? '女' : '男'),
            const Divider(
              color: appBarColor,
            ),
            _buildDetailRow('年龄', personalInfo.age.toString()),
            const Divider(
              color: appBarColor,
            ),
            _buildDetailRow('生日', personalInfo.birthday),
            const Divider(
              color: appBarColor,
            ),
            _buildDetailRow('地区', personalInfo.area),
            const Divider(
              color: appBarColor,
            ),
            _buildDetailRow('家乡', personalInfo.hometown),
            const Divider(
              color: appBarColor,
            ),
            const SizedBox(height: 20),
            Text(
              '简介:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              personalInfo.job, // Assuming description is held in job field
              style: TextStyle(
                fontSize: 16,
                height: 1.5, // Line height
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: highlight, // Define this color or use Theme
                ),
                onPressed: () => modificationBottonPressed(context),
                child: const Text('修改信息'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: appBarColor),
          const SizedBox(width: 8),
          Text(
            '$title: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
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
        String updatedSex = personalInfo!.gender == 0 ? "女" : "男";
        int updatedAge = personalInfo!.age;
        String updatedBirthday = personalInfo!.birthday;
        String updatedArea = personalInfo!.area;
        String updatedHometown = personalInfo!.hometown;
        String updatedDescription = personalInfo!.job;

        return AlertDialog(
          title: const Text('修改信息'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('性别'),
                DropdownButton<String>(
                  value: updatedSex,
                  onChanged: (String? newValue) {
                    updatedSex = newValue!;
                  },
                  items:
                      ['男', '女'].map<DropdownMenuItem<String>>((String value) {
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
                    updatedAge = int.tryParse(value) ?? 0;
                  },
                ),
                const SizedBox(height: 10),
                const Text('生日'),
                TextFormField(
                  initialValue: updatedBirthday,
                  onChanged: (value) {
                    updatedBirthday = value;
                  },
                ),
                const SizedBox(height: 10),
                const Text('地区'),
                TextFormField(
                  initialValue: updatedArea,
                  onChanged: (value) {
                    updatedArea = value;
                  },
                ),
                const SizedBox(height: 10),
                const Text('家乡'),
                TextFormField(
                  initialValue: updatedHometown,
                  onChanged: (value) {
                    updatedArea = value;
                  },
                ),
                const SizedBox(height: 10),
                const Text('简介'),
                TextFormField(
                  initialValue: updatedDescription,
                  onChanged: (value) {
                    updatedDescription = value;
                  },
                ),
              ],
            ),
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
                Navigator.of(context).pop();
                setState(() {
                  personalInfo!.gender = updatedSex == "男" ? 1 : 0;
                  personalInfo!.age = updatedAge;
                  personalInfo!.birthday = updatedBirthday;
                  personalInfo!.area = updatedArea;
                  personalInfo!.hometown = updatedHometown;
                  personalInfo!.job = updatedDescription;
                  viewModel.saveInfo(personalInfo!);
                });
              },
            ),
          ],
        );
      },
    );
  }
}
