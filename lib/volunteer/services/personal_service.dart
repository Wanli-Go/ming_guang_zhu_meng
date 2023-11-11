import 'dart:convert';

import 'package:ming_guang/volunteer/model/model_personal_info.dart';
import 'package:ming_guang/volunteer/services/base/base_url.dart';
import 'package:ming_guang/volunteer/services/base/request_client.dart';

class PersonalInfoService {

  PersonalInfoService();

  Future<PersonalInfo> fetchPersonalInfo() async {
    try {
      final url = Uri.parse('$baseUrl/volunteer/info');
      final response = await RequestClient.client.get(url);

      if (response.statusCode == 200) {
        print("Personal Info Gotten");
        return PersonalInfo.fromJson(jsonDecode(response.body)['data']);
      } else {
        print("Personal Info response code e");
        return _dummyPersonalInfo();
      }
    } catch (e) {
      print("Personal info e");
      return _dummyPersonalInfo();
    }
  }
}

Future<PersonalInfo> _dummyPersonalInfo() async {
  var dummy = {
    "age": 19,
    "area": "山东省日照市",
    "birthday": "2003-12-06",
    "gender": 0,
    "hometown": "陕西省宝鸡市",
    "id": "87123",
    "job": "东北大学的狗",
    "name": "Pandaemonium.",
    "photo":
        "https://cdn.pixabay.com/photo/2016/07/10/17/54/kid-1508121_1280.jpg",
  };
  return PersonalInfo.fromJson(dummy);
}
