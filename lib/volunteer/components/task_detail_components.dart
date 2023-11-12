import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/services/base/base_url.dart';
import 'package:ming_guang/volunteer/themes/main_theme.dart';
import 'package:ming_guang/volunteer/view_model/notifiers/notifier_update_task_info.dart';
import 'package:ming_guang/volunteer/view_model/task_detail_model.dart';

class DetailItem extends StatelessWidget {
  final String title;
  final String detail;

  const DetailItem({Key? key, required this.title, required this.detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          text: '$title: ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodyText1?.color,
          ),
          children: [
            TextSpan(
              text: detail,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Theme.of(context).textTheme.bodyText1?.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubmitDetailDialog extends StatefulWidget {
  final String mediaUrl;
  final String missionId;
  final String kidId;
  final TaskDetailViewModel model;
  final TaskInfoUpdateNotifier notifier;
  final String kidName;

  const SubmitDetailDialog(
      {required this.mediaUrl,
      required this.missionId,
      required this.kidId,
      required this.model,
      required this.notifier,
      required this.kidName});

  @override
  _SubmitDetailDialogState createState() => _SubmitDetailDialogState();
}

class _SubmitDetailDialogState extends State<SubmitDetailDialog> {
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.15,
          horizontal: MediaQuery.sizeOf(context).width * 0.10),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[300],
          title: const Center(child: Text('提交详情')),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: const [Icon(Icons.abc, size: 50, color: Colors.transparent)],
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.kidName,
                      style: TextStyle(
                        fontSize: 16,
                        color: highlight,
                      ),
                    ),
                    const Text(" 的作业",
                        style: TextStyle(
                          fontSize: 16,
                        ))
                  ],
                ),
              ),
              const Text(
                "点击图片可以放大",
                style: TextStyle(
                    fontSize: 10, decoration: TextDecoration.overline),
              ),
              GestureDetector(
                onTap: () => widget.model
                    .scalePic(context, widget.mediaUrl, widget.kidId),
                child: SizedBox(
                  height: 200,
                  child: Hero(
                      tag: widget.kidId,
                      child: Image.network(
                        "$baseUrl/${widget.mediaUrl}",
                        headers: {'token': global_token},
                      )),
                ),
              ),
              Row(
                children: [
                  const Text('评分：'),
                  RatingBar(
                    rating: rating,
                    onRatingChanged: (value) {
                      setState(() {
                        rating = value;
                      });
                    },
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                      child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink[200]),
                    onPressed: () async {
                      await widget.model.submitScore(widget.kidId,
                          widget.missionId, rating, context, widget.notifier);
                    },
                    child: const Text('提交'),
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageScreen extends StatelessWidget {
  final String imageUrl;
  final String tag;

  const ImageScreen({super.key, required this.imageUrl, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: appBarColor,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Hero(
            tag: tag,
            child: Image.network(imageUrl),
          ),
        ),
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  final int rating;
  final ValueChanged<int> onRatingChanged;

  const RatingBar({
    Key? key,
    required this.rating,
    required this.onRatingChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < rating ? Icons.star : Icons.star_border,
            color: Colors.yellow,
          ),
          onPressed: () {
            onRatingChanged(index + 1);
          },
        );
      }),
    );
  }
}
