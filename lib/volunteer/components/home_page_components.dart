import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/model/model.dart';
import 'package:ming_guang/volunteer/themes/main_theme.dart';
import 'package:ming_guang/volunteer/view_model/home_page_model.dart';
import 'package:ming_guang/volunteer/view_model/task_info_update_notifier.dart';
import 'package:provider/provider.dart';

class TaskRatioDisplay extends StatefulWidget {
  final List<Task> tasks;
  final HomePageModel model;

  const TaskRatioDisplay({
    Key? key,
    required this.tasks,
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
                  child: CircularProgressIndicator(color: highlight,),
                );
              }

              final Map<String, int> ratioData = snapshot.data!;

              final totalSubmissions = ratioData['total']!;
              final totalToBeCorrected = ratioData['has']!;

              // Assuming all tasks need to be corrected, the ratio of remaining tasks is:
              final double ratio = totalSubmissions > 0
                  ? totalToBeCorrected / totalSubmissions
                  : 0.0;

              return Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.25,
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.18,
                        height: MediaQuery.of(context).size.width * 0.18,
                        child: CircularProgressIndicator(
                          value: ratio, // This will be the progress indicator value
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
      }
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
