import 'dart:convert';

import 'package:ming_guang/volunteer/model/dto_kid_recent.dart';
import 'package:ming_guang/volunteer/services/base/base_url.dart';
import 'package:ming_guang/volunteer/services/base/request_client.dart';

class VolunteerKidsService {
  Future<KidRecentDto> fetchRandomRecentKid() async {
    try {
      final response = await RequestClient.client
          .get(Uri.parse('$baseUrl/volunteer/kid/random/recent'));

      if (response.statusCode == 200) {
        print("kids recent gotten");

        return KidRecentDto.fromJson(json.decode(response.body));
      } else {
        print("kids recent response e");
        // Handle the error; you might throw an exception or return a default object
        // throw Exception('Failed to load kid recent status');
        return KidRecentDto.fromJson({
          "name": "蔡小刀",
          "photo":
              "https://cdn.pixabay.com/photo/2019/08/23/17/44/brother-sister-4426163_1280.jpg",
          "recent": "成绩日渐优异、名列前茅，生活在捐助的帮助下变得更加富裕，从而更专注于学习",
        });
      }
    } catch (e) {
      print("kids recent e");

      // No response Got
      return KidRecentDto.fromJson({
        "name": "蔡小刀",
        "photo":
            "https://cdn.pixabay.com/photo/2019/08/23/17/44/brother-sister-4426163_1280.jpg",
        "recent": "成绩日渐优异、名列前茅，生活在捐助的帮助下变得更加富裕，从而更专注于学习",
      });
    }
  }
}
