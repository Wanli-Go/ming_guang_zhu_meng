import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/model/modelVolunteer.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      
      home: MyHomePage(volunteerPerson: volunteerPerson),
    );
  }
}

class MyHomePage extends StatefulWidget {
   VolunteerPerson volunteerPerson;

   MyHomePage({required this.volunteerPerson});

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
    return MaterialApp(
      home: Scaffold(
        backgroundColor:  Color.fromARGB(255, 238, 177, 198).withOpacity(0.95),
         appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 228, 79, 128),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                

              },
            ),
            title: Row(
              children:
               [
                Text(
                  style: TextStyle(
                    fontSize: 15, 
                  ),
                  "返回"),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: const Text("个人信息"),
                )]),
          ),

          
   //两个组件:一个container装有志愿者图片名字信息以及欢迎字眼,一个container装有基本信息以及修改按钮
          body: Column(
            
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

        //container1
              
             Container
              (
                width: MediaQuery.of(context).size.width,
                height: 150,
                 decoration: BoxDecoration(
                 
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color.fromARGB(255, 240, 33, 102).withOpacity(0.5), Color.fromARGB(255, 168, 39, 248).withOpacity(0.5)],
                  ),
                ),
                child: Row(
                  children: [
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.3,
                        height: MediaQuery.of(context).size.width*0.3,
                        child: ClipOval(
                          child: Image.asset(volunteerPerson.imageUrl), 
                        ),
                      ),
                    ),
                   
                    Expanded( 
                      child: Container(
                        padding: EdgeInsets.only(left: 70),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text(
                                volunteerPerson.name,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Expanded(
                              child: Text(
                                '欢迎来到志愿者之家!!!',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),


        //container2
              Container(
                width: MediaQuery.of(context).size.width*0.8,
                height: MediaQuery.of(context).size.height*0.6,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.centerRight,
                    colors: [Color.fromARGB(255, 247, 65, 65).withOpacity(0.5), Color.fromARGB(255, 192, 148, 220).withOpacity(0.9)],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
                    Text(
                      '             性别:         ${volunteerPerson.sex}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 15),
                    Text(    
                      '             年龄:         ${volunteerPerson.age}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 15),
                    Text(
                      '             生日:        ${volunteerPerson.birthday}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 15),
                    Text(
                      '             地区:         ${volunteerPerson.area}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 30),
                    Text(
                      '             简介: ${volunteerPerson.description}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 120),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              String updatedSex = volunteerPerson.sex;
                              int updatedAge = volunteerPerson.age as int;
                              String updatedBirthday = volunteerPerson.birthday;
                              String updatedArea = volunteerPerson.area;
                              String updatedDescription = volunteerPerson.description;
                    
                              return AlertDialog(
                                title: Text('修改信息'),
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('性别'),
                                    DropdownButton<String>(
                                      value: updatedSex,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          updatedSex = newValue!;
                                        });
                                      },
                                      items: <String>['Male', 'Female']
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                    SizedBox(height: 10),
                                    Text('年龄'),
                                    TextFormField(
                                      initialValue: updatedAge.toString(),
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        setState(() {
                                          updatedAge = int.tryParse(value) ?? 0;
                                        });
                                      },
                                    ),
                                    SizedBox(height: 10),
                                    Text('生日'),
                                    TextFormField(
                                      initialValue: updatedBirthday,
                                      onChanged: (value) {
                                        setState(() {
                                          updatedBirthday = value;
                                        });
                                      },
                                    ),
                                    SizedBox(height: 10),
                                    Text('地区'),
                                    TextFormField(
                                      initialValue: updatedArea,
                                      onChanged: (value) {
                                        setState(() {
                                          updatedArea = value;
                                        });
                                      },
                                    ),
                                    SizedBox(height: 10),
                                    Text('简介'),
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
                                    child: Text('取消'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  ElevatedButton(
                                    child: Text('保存'),
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
                        },
                        child: Text('修改信息'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    
  }
}