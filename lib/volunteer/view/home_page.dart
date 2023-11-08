import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ming_guang/volunteer/model/model.dart';
import 'package:ming_guang/volunteer/model/modelVolunteer.dart';
import 'package:ming_guang/volunteer/themes/main_theme.dart';
import 'package:ming_guang/volunteer/view_model/bottom_nav_notifier.dart';
import 'package:ming_guang/volunteer/view_model/home_page_model.dart';

import '../components/home_page_components.dart';

class HomePageBody extends StatelessWidget {
  final BottomNavNotifier bottomNotifier;

  late HomePageModel model;

  HomePageBody({
    super.key,
    required this.bottomNotifier,
  }) {
    model = HomePageModel();
  }

  final List<String> imageList = [
    'assets/boy.png',
    'assets/girl.png',
    'assets/Donald.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.01,
        ),

        //滚轮子件：
        GunLun(imageList: imageList),

        //查看孩子近况：
        Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //更多信息按钮：
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      const Color.fromARGB(255, 245, 243, 246).withOpacity(0.5),
                      Colors.pink.withOpacity(0.5)
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '孩子近况',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                      ),
                      onPressed: () =>
                          model.mainChildRecentStatusClicked(context),
                    ),
                  ],
                ),
              ),

              //近况信息展示框：
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  gradient: gradientDecoration,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.1,
                        backgroundImage: AssetImage(dummyPerson.childImageUrl),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              dummyPerson.childName,
                              style: const TextStyle(
                                fontSize:
                                    18, // Increased font size for better legibility
                                fontWeight: FontWeight.bold,                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              dummyPerson.childDescription,
                              style: const TextStyle(
                                fontSize:
                                    12, // Adjusted for balance with the title
                                ), // Lighter for the description
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2, // Ensuring the text doesn't overflow
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                height: MediaQuery.of(context).size.height * 0.03,
              ),

              //我的任务按钮：
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      const Color.fromARGB(255, 241, 237, 239).withOpacity(0.5),
                      Colors.pink.withOpacity(0.5)
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '我的任务',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        ),
                        onPressed: () =>
                            model.mainMyTasksClicked(context, bottomNotifier)),
                  ],
                ),
              ),

              //我的任务展示框
              TaskRatioDisplay(tasks: task_list),
            ],
          ),
        ),
      ],
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
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.22,
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          enableInfiniteScroll: true,
          autoPlayInterval: const Duration(seconds: 3),
          enlargeCenterPage: true,
        ),
        items: imageList.map((image) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: const BoxDecoration(
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


