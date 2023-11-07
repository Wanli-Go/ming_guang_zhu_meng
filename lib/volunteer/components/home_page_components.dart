import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/model/model.dart';
import 'package:ming_guang/volunteer/themes/main_theme.dart';

class TaskRatioDisplay extends StatelessWidget {
  final List<Task> tasks;

  const TaskRatioDisplay({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate the total number of submissions and the number that needs to be corrected.
    final int totalSubmissions = tasks.fold<int>(0, (sum, task) => sum + task.submit_count);
    final int totalToBeCorrected = tasks.fold<int>(0, (sum, task) => sum + task.to_be_corrected);
    
    // Assuming all tasks need to be corrected, the ratio of remaining tasks is:
    final double ratio = totalSubmissions > 0 ? (totalSubmissions - totalToBeCorrected) / totalSubmissions : 0.0;

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
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.width * 0.2,
              child: CircularProgressIndicator(
                value: ratio, // This will be the progress indicator value
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation<Color>(highlight.withOpacity(0.7)),
                strokeWidth: 10,
              ),
            ),
            SizedBox(
              height: 10,
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
                '剩余待批改任务： $totalToBeCorrected / $totalSubmissions',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
