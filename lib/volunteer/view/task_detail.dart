import 'package:flutter/material.dart';
import 'package:ming_guang/volunteer/components/task_detail_components.dart';
import 'package:ming_guang/volunteer/model/TaskItem.dart';
import 'package:ming_guang/volunteer/model/model_mission_detail.dart';
import 'package:ming_guang/volunteer/services/base/base_url.dart';
import 'package:ming_guang/volunteer/services/tasks_service.dart';
import 'package:ming_guang/volunteer/themes/main_theme.dart';
import 'package:ming_guang/volunteer/view_model/notifiers/notifier_update_task_info.dart';
import 'package:ming_guang/volunteer/view_model/task_detail_model.dart';
import 'package:provider/provider.dart';

class TaskDetailPage extends StatefulWidget {
  final TaskItem taskItem;
  final TaskService taskService;
  const TaskDetailPage(
      {Key? key, required this.taskItem, required this.taskService})
      : super(key: key);

  @override
  _TaskDetailPageState createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  late final TaskDetailViewModel model;

  @override
  void initState() {
    super.initState();
    model = TaskDetailViewModel(widget.taskItem.id.toString(),
        taskService: widget.taskService);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Center(child: Text('任务详情')),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [Icon(Icons.abc, size: 50, color: Colors.transparent)],
      ),
      body: Consumer<TaskInfoUpdateNotifier>(builder: (context, notifier, c) {
        return Column(
          children: [
            FutureBuilder<MissionDetail>(
              future: model.fetchMissionDetail(widget.taskItem.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Expanded(
                    flex: 10,
                    child: Center(
                        child: CircularProgressIndicator(
                      color: highlight,
                    )),
                  );
                }
                if (snapshot.hasError) {
                  return Expanded(
                    flex: 10,
                    child: Center(child: Text('Error: ${snapshot.error}')),
                  );
                }
                if (!snapshot.hasData) {
                  return const Expanded(
                    flex: 10,
                    child: Center(child: Text('加载失败！')),
                  );
                }
                final missionDetail = snapshot.data!;
                return Expanded(
                  flex: 10,
                  child: DetailCard(
                    missionDetail: missionDetail,
                    notifier: notifier,
                  ),
                );
              },
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 10,
              child: FutureBuilder<List<UngradedCompletion>>(
                future: model.fetchUngradedCompletions(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: highlight,
                    ));
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('未发现待批改作业'));
                  }
                  final completions = snapshot.data!;
                  return UngradedCompletionsList(
                    completions: completions,
                    model: model,
                    missionId: widget.taskItem.id,
                    notifier: notifier,
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        );
      }),
    );
  }
}

class DetailCard extends StatelessWidget {
  final MissionDetail missionDetail;
  final TaskInfoUpdateNotifier notifier;

  const DetailCard(
      {Key? key, required this.missionDetail, required this.notifier})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              missionDetail.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(color: highlight),
            DetailItem(
                title: '待批改人数',
                detail: '${missionDetail.totalNum - missionDetail.doneNum}'),
            DetailItem(title: '总提交人数', detail: '${missionDetail.totalNum}'),
            DetailItem(title: '日期', detail: missionDetail.date),
            DetailItem(title: '难度等级', detail: missionDetail.level),
            DetailItem(
                title: '类型', detail: missionDetail.type == 0 ? '选做' : '必做'),
            DetailItem(title: '描述', detail: missionDetail.description),
          ],
        ),
      ),
    );
  }
}

class UngradedCompletionsList extends StatelessWidget {
  final List<UngradedCompletion> completions;
  final String missionId;
  final TaskDetailViewModel model;
  final TaskInfoUpdateNotifier notifier;

  const UngradedCompletionsList(
      {Key? key,
      required this.completions,
      required this.missionId,
      required this.model,
      required this.notifier})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.pink[200],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      child: ListView.builder(
        itemCount: completions.length,
        itemBuilder: (context, index) {
          final completion = completions[index];
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: NetworkImage(
                        "$baseUrl/reply/file/${completion.replyFile}",
                        headers: {'token': global_token},
                      ), // Assume kidPic is a URL
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  completion.kidName,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink[300],
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SubmitDetailDialog(
                          mediaUrl: completion.replyFile,
                          model: model,
                          missionId: missionId,
                          kidId: completion.kidId,
                          kidName: completion.kidName,
                          notifier: notifier,
                        );
                      },
                    );
                  },
                  child: const Text('查看'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
