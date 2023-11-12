import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/model/model_message.dart';
import 'package:ming_guang/volunteer/services/base/base_url.dart';
import 'package:ming_guang/volunteer/themes/main_theme.dart';
import 'package:ming_guang/volunteer/view_model/home_page_model.dart';
import 'package:ming_guang/volunteer/view_model/notifiers/notifier_bottom_nav.dart';

import '../components/home_page_components.dart';
import '../model/model_kid_recent.dart';

HomePageModel model = HomePageModel();

class HomePageBody extends StatefulWidget {
  final BottomNavNotifier bottomNotifier;

  const HomePageBody({
    super.key,
    required this.bottomNotifier,
  });

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  void initState() {
    super.initState();
  }

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
        GunLun(),

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
                          model.mainChildRecentStatusClicked(context, model),
                    ),
                  ],
                ),
              ),

              //近况信息展示框：
              FutureBuilder<KidRecentDto>(
                future: model.fetchShortRecent(), // Here you call the method
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Show loading indicator while waiting for the data
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          gradient: gradientDecoration,
                        ),
                        child: Center(
                            child: CircularProgressIndicator(
                          color: highlight,
                        )));
                  } else if (snapshot.hasError) {
                    // Show error message if something went wrong
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          gradient: gradientDecoration,
                        ),
                        child: const Center(child: Text('加载近况失败')));
                  } else if (snapshot.hasData) {
                    // Once the data is available, build the UI
                    final kidRecent = snapshot.data!;
                    return Container(
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
                            padding: const EdgeInsets.all(15),
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.14,
                              backgroundImage: NetworkImage(
                                "$baseUrl/${kidRecent.photo}",
                                headers: {'token': global_token},
                              ), // Use the photo from the data
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
                                    kidRecent
                                        .name, // Use the name from the data
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    kidRecent
                                        .recent, // Use the recent update from the data
                                    style: const TextStyle(
                                      fontSize: 12,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          )
                        ],
                      ),
                    );
                  } else {
                    // If the snapshot has data but it's null (unlikely), show a placeholder
                    return const Center(child: Text('No data available'));
                  }
                },
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
                        onPressed: () => model.mainMyTasksClicked(
                            context, widget.bottomNotifier)),
                  ],
                ),
              ),

              //我的任务展示框
              TaskRatioDisplay(model: model),
            ],
          ),
        ),
      ],
    );
  }
}
