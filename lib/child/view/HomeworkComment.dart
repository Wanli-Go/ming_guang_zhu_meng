import 'package:flutter/material.dart';
import 'package:ming_guang/child/model/modelStudent.dart';
import 'package:ming_guang/child/model/commention.dart';
import 'package:ming_guang/child/model/ListItem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
                // 返回上一页的逻辑处理
              },
            ),
            title: Row(
              children:
               [
                Padding(
                  padding: const EdgeInsets.only(left:90),
                  child:  Text(homeworkComment.homeworkName),
                )]),
          ),

    
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              //学生作业展示

              HomeworkShow(),
              
              Container(
                height: 30,
              ),

              //作业评论展示
              
              CommentShow(),
            
              
            ],
          ),

          bottomNavigationBar: BottomNavigationBar(
            //ackgroundColor: Color.fromARGB(255, 236, 42, 172),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "主页",backgroundColor: Color.fromARGB(255, 236, 144, 144)),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_grocery_store), label: "商城"),
              BottomNavigationBarItem(
                icon: Icon(Icons.content_paste), label: "任务"),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: "我的"),
            ],
          )
        ),
      );
    
  }
}

class CommentShow extends StatelessWidget {
  const CommentShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.48,
      decoration: BoxDecoration(
        
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color.fromARGB(255, 127, 5, 45).withOpacity(0.5), Color.fromARGB(255, 95, 10, 147).withOpacity(0.5)],
        ),
      ),
      child: 
      ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return 
           Padding(
             padding: const EdgeInsets.all(7.0),
             child: Container(
              width: MediaQuery.of(context).size.width*0.88,
              height: MediaQuery.of(context).size.height*0.05,
              child: Row(
                children: [
                  
                  Image.asset(items[index].imageURL,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover, 
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:100),
                         child: Text(items[index].text1,
                              style: TextStyle(
                                      fontSize: 12,)
                                
                         ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left :100),
                        child: Text(items[index].text2,
                        style: TextStyle(
                                      fontSize: 10,)
                                      ),
                      ),
                    ],
                  ),
                ],
              
              ),
                     ),
           );
          
        },
      ),
    );
  }
}

class HomeworkShow extends StatelessWidget {
  const HomeworkShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color.fromARGB(255, 127, 5, 45).withOpacity(0.5), Color.fromARGB(255, 95, 10, 147).withOpacity(0.5)],
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                homeworkComment.studentName
                
              , textAlign: TextAlign.left),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  homeworkComment.data
                ),
              ),
              Icon(Icons.trending_up, size: 40,),
            ],
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width*0.88,
              height: MediaQuery.of(context).size.height*0.181,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 247, 245, 245).withOpacity(0.89),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  homeworkComment.photo,
                  fit: BoxFit.cover,
                ),// 在这里替换为你的图像 URl      
              ),
            ),
          ),
         
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // 按钮点击事件
                },
                child: Text('赞赏'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

