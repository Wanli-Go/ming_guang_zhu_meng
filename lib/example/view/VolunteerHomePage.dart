import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ming_guang/example/model/modelVolunteer.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  
  final List<String> imageList = [
    'assets/boy.png',
    'assets/girl.png',
    'assets/Donald.png',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:  Color.fromARGB(255, 238, 177, 198).withOpacity(0.95),
         appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 228, 79, 128),
            leading: IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
               

              },
            ),
            title: Row(
              children:
               [
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: const Text("明光筑梦·志愿者"),
                )]),  
            actions: [
              IconButton(
                  icon: Icon(Icons.markunread),
                  onPressed: () {
                   

                  },
              ),
            ]
            
          ),

    
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.01,
              ),

          //滚轮子件：
              GunLun(imageList: imageList),
              
          //查看孩子近况：
              Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

          //更多信息按钮：
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.04,
                      decoration: BoxDecoration(
                          
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color.fromARGB(255, 86, 3, 157).withOpacity(0.5), Color.fromARGB(255, 245, 243, 246).withOpacity(0.5)],
                          ),
                        ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '孩子近况',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                          IconButton(
                            icon: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              


                            },
                          ),
                        ],
                      ),
                    ),

          //近况信息展示框：
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.15,
                        decoration: BoxDecoration(
                          
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color.fromARGB(255, 127, 5, 45).withOpacity(0.5), Color.fromARGB(255, 95, 10, 147).withOpacity(0.5)],
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(25),
                              child: Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width*0.2,
                                height: MediaQuery.of(context).size.width*0.2,
                                child: ClipOval(
                                  child: Image.asset(volunteerPerson.childImageUrl), 
                                ),
                              ),
                            ),
                            ),
                            Expanded( 
                              child: Container(
                               
                                padding: EdgeInsets.only(left:20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 30),
                                    Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Text(
                                        volunteerPerson.childName,
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Expanded(
                                      child: Text(
                                        volunteerPerson.childDescription,
                                        style: TextStyle(fontSize: 11),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.03,
                    ),

         //我的任务按钮：
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.04,
                      decoration: BoxDecoration(
                          
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color.fromARGB(255, 165, 6, 109).withOpacity(0.5), Color.fromARGB(255, 241, 237, 239).withOpacity(0.5)],
                          ),
                        ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '我的任务',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                          IconButton(
                            icon: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                            onPressed: () {
                             


                            },
                          ),
                        ],
                      ),
                    ),

          //我的任务展示框
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.25,
                        decoration: BoxDecoration(
                         
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color.fromARGB(255, 192, 5, 183).withOpacity(0.5), Color.fromARGB(255, 159, 14, 86).withOpacity(0.5)],
                          ),
                        ),

                        child: 
                        Center(child: Text(
                          '最近任务:${volunteerPerson.tasks}'
                        ))
                        
                        
                      ),
                    ),
                   
                    
                  ],
                ),
              ),

            ],
          ),

          bottomNavigationBar: BottomNavigationBar(
            
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "主页",backgroundColor: Color.fromARGB(255, 236, 144, 144)),
              BottomNavigationBarItem(
                icon: Icon(Icons.create), label: "任务批改"),
              BottomNavigationBarItem(
                icon: Icon(Icons.group), label: "志愿社区"),
            ],
          )
        ),
      );
    
  }
}




class GunLun extends StatelessWidget {
  const GunLun({
    super.key,
    required this.imageList,
  });

  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return Container(

      width: MediaQuery.of(context).size.width ,
      height: MediaQuery.of(context).size.height * 0.22,
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          enableInfiniteScroll: true,
          autoPlayInterval: Duration(seconds: 3),
          enlargeCenterPage: true,
        ),
        items: imageList.map((image) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}