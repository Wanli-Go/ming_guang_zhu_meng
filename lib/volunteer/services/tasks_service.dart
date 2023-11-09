import 'dart:convert';
import 'package:ming_guang/volunteer/model/TaskItem.dart';
import 'package:ming_guang/volunteer/model/mission_detail.dart';
import 'package:ming_guang/volunteer/services/base/base_url.dart';
import 'package:ming_guang/volunteer/services/base/request_client.dart';
int waitingCheck = 12;
int total = 15;
class TaskService {
  Future<List<TaskItem>> fetchTaskItems(int pageNum, int pageSize) async {
    try {
      print(pageNum);
      final response = await RequestClient.client.post(
        Uri.parse('$baseUrl/volunteer/mission/list'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, int>{
          'pageNum': pageNum,
          'pageSize': pageSize,
        }),
      );

      if (response.statusCode == 200) {
        print("fetch tasks items gotten");
        Map<String, dynamic> data = jsonDecode(response.body);
        List<dynamic> tasksJson = data['data']['list'];
        List<TaskItem> tasks =
            tasksJson.map((taskJson) => TaskItem.fromJson(taskJson)).toList();
        return tasks;
      } else {
        print("fetch tasks response error");
        return _dummyTaskItems();
      }
    } catch (e) {
      print("fetch tasks items e");
      return _dummyTaskItems();
    }
  }
  Future<List<TaskItem>> _dummyTaskItems() async {
    waitingCheck -= 1;
    print("waitingCheck: $waitingCheck");
    Map<String, dynamic> map = {
      'data': {
        'list': [
          {'id': "1", 'title': '背诵将进酒', 'totalSubmit': 12, 'waitingCheck': waitingCheck},
          {'id': "2", 'title': '完成2个几何题', 'totalSubmit': 8, 'waitingCheck': 3},
          {'id': "3", 'title': '背诵醉翁亭记', 'totalSubmit': 12, 'waitingCheck': 4},
          {'id': "4", 'title': '背诵床前明月光', 'totalSubmit': 12, 'waitingCheck': 4},
          {
            'id': "5",
            'title': '背诵茅屋为秋风所破歌',
            'totalSubmit': 12,
            'waitingCheck': 4
          },
          {'id': "6", 'title': '背诵滕王阁序', 'totalSubmit': 12, 'waitingCheck': 4},
        ]
      }
    };
    List<dynamic> tasksJson = map['data']['list'];
    List<TaskItem> tasks =
        tasksJson.map((taskJson) => TaskItem.fromJson(taskJson)).toList();
    return tasks;
  }

  Future<MissionDetail> getMissionDetail(String id) async {
    try {
      final response = await RequestClient.client
          .get(Uri.parse('$baseUrl/volunteer/mission/detail/$id'));

      if (response.statusCode == 200) {
        return MissionDetail.fromJson(jsonDecode(response.body)['data']);
      } else {
        print("getMissionDetail response code e");
        return _dummyMissionDetail();
      }
    } catch (e) {
      print("getMissionDetail e");
      return _dummyMissionDetail();
    }
  }
  int doneNum = 0;
  Future<MissionDetail> _dummyMissionDetail() async {
    doneNum += 1;
    return MissionDetail.fromJson(<String, dynamic>{
      "date": "2023-11-08",
      "description": "在5分钟内背诵完将进酒，并上传视频",
      "doneNum": doneNum,
      "id": "1",
      "level": "高",
      "point": 3,
      "tag": "string",
      "title": "背诵将进酒",
      "totalNum": 10,
      "type": 0
    });
  }

  Future<List<UngradedCompletion>> getUngradedCompletions(
      int pageNum, int pageSize, String taskId) async {
    try {
      final response = await RequestClient.client.post(
        Uri.parse(
            '$baseUrl/your_endpoint_here'), // Replace with your actual endpoint
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'example': {'id': taskId},
          'pageNum': pageNum,
          'pageSize': pageSize,
        }),
      );

      if (response.statusCode == 200) {
        print("getUngradedCompletions gotten");
        List<dynamic> completionsJson =
            jsonDecode(response.body)['data']['list'];
        return completionsJson
            .map((json) => UngradedCompletion.fromJson(json))
            .toList();
      } else {
        print("getUngradedCompletions response code e");
        return _dummyUngradedCompletion();
      }
    } catch (e) {
      print("getUngradedCompletions e");
      return _dummyUngradedCompletion();
    }
  }

  Future<List<UngradedCompletion>> _dummyUngradedCompletion() async{
    return [
      UngradedCompletion.fromJson(<String, dynamic>{
      'kidId': "myid",
      'kidName': "myname",
      'kidPic': "https://cdn.pixabay.com/photo/2017/07/20/03/53/homework-2521144_1280.jpg",
      })
      ,
      UngradedCompletion.fromJson(<String, dynamic>{
      'kidId': "myid2",
      'kidName': "myname???",
      'kidPic': "https://cdn.pixabay.com/photo/2017/07/20/03/53/homework-2521144_1280.jpg",
      })
      ,
      UngradedCompletion.fromJson(<String, dynamic>{
      'kidId': "myid3",
      'kidName': "myname!!",
      'kidPic': "https://cdn.pixabay.com/photo/2017/07/20/03/53/homework-2521144_1280.jpg",
      })
    ];
  }

  Future<bool> inputScore(String kidId, String missionId, int score) async {
    final url = Uri.parse('$baseUrl/volunteer/mission/inputscore');

    try{
    final response = await RequestClient.client.post(
      url,
      body: jsonEncode({
        'kidId': kidId,
        'missionId': missionId,
        'score': score,
      }),
    );
    bool result = response.statusCode == 200 || response.statusCode == 201;
    //return result;
    return true;
    }catch(e){
      print("post grade e");
      return true;
    }
  }

  Future<Map<String, int>> fetchTaskRatio() async{
    total += 1;
    try {
      final response = await RequestClient.client
          .get(Uri.parse('$baseUrl/totalMissionCount'));

      if (response.statusCode == 200) {
        print("taskratio gotten");
        return json.decode(response.body);
      } else {
        print("taskratio response code error");
        // Handle the error; you might throw an exception or return a default object
        // throw Exception('Failed to load kid recent status');
        return {
          "total": 40,
          "has": total,
        };
      }
    } catch (e) {
      print("taskratio e");
      // No response Got
      return {
          "total": 40,
          "has": total,
        };
    }
  }
}
