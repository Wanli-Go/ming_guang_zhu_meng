import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/themes/main_theme.dart';
import 'package:ming_guang/volunteer/view_model/home_page_model.dart';
import 'package:ming_guang/volunteer/view_model/notifiers/notifier_update_task_info.dart';
import 'package:provider/provider.dart';

class TaskRatioDisplay extends StatefulWidget {
  final HomePageModel model;

  const TaskRatioDisplay({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<TaskRatioDisplay> createState() => _TaskRatioDisplayState();
}

class _TaskRatioDisplayState extends State<TaskRatioDisplay> {
  @override
  Widget build(BuildContext context) {
    // Calculate the total number of submissions and the number that needs to be corrected.

    return Consumer<TaskInfoUpdateNotifier>(
        builder: (context, taskInfoUpdateNotifier, c) {
      return FutureBuilder(
          future: widget.model.getTaskRatio(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  color: highlight,
                ),
              );
            }

            final Map<String, dynamic> ratioData = snapshot.data!;

            final totalSubmissions = int.parse(ratioData['total']!);
            final totalToBeCorrected = int.parse(ratioData['has']!);

            // Assuming all tasks need to be corrected, the ratio of remaining tasks is:
            final double ratio = totalSubmissions > 0
                ? totalToBeCorrected / totalSubmissions
                : 0.0;

            return Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.22,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  gradient: gradientDecoration,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 7,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.18,
                      height: MediaQuery.of(context).size.width * 0.18,
                      child: CircularProgressIndicator(
                        value:
                            ratio, // This will be the progress indicator value
                        backgroundColor: Colors.white,
                        valueColor: AlwaysStoppedAnimation<Color>(highlight),
                        strokeWidth: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      '${(ratio * 100).toStringAsFixed(1)}%', // Display the ratio as a percentage
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        color: highlight,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        '批改进度： $totalToBeCorrected / $totalSubmissions',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    });
  }
}

class GunLun extends StatelessWidget {
  GunLun({
    super.key,
  });

  final List<String> imageList = [
    'assets/boy.png',
    'assets/girl.png',
    'assets/Donald.jpg',
  ];

  final List<String> titleList = [
    "来自：云南省腾冲县",
    "来自：临夏回族自治州",
    "欢迎来到志愿者之家！"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(seconds: 2),
          autoPlayInterval: const Duration(seconds: 7),
          enlargeCenterPage: true,
        ),
        items: imageList.map((image) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 3, color: Colors.white.withOpacity(0.5)),
                    image: DecorationImage(
                        image: AssetImage(
                          image,
                        ),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: [
                    Positioned(
                      left: 10,
                      top: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          titleList[imageList.indexOf(image)],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
