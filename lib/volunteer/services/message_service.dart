import 'dart:convert';
import 'package:ming_guang/volunteer/model/model_message.dart';
import 'package:ming_guang/volunteer/services/base/base_url.dart';
import 'package:ming_guang/volunteer/services/base/request_client.dart';

class MessageService {
  Future<List<Child>> fetchChildren() async {
    try{
    var url = Uri.parse('$baseUrl/volunteer/kid/all');
    var response = await RequestClient.client.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List<dynamic> childrenData = jsonResponse['data'];
      print("children list fetched");
      return childrenData.map<Child>((json) => Child.fromJson(json)).toList();
    } else {
      print("fetch children list response error");
      return childs;
    }
    } catch (e) {
      print("fetch children list e: $e");
      return childs;
    }
  }


  Future<bool> sendMessageToServer(String kidId, String message) async {
    final url = Uri.parse('$baseUrl/chat/send');

    try{
    final response = await RequestClient.client.post(
      url,
      body: jsonEncode({
        'id': kidId,
        'msg': message
      }),
    );
    print("message sent: $message, status code:${response.statusCode}");
    bool result = response.statusCode == 200 || response.statusCode == 201;
    //return result;
    return true;
    }catch(e){
      print("submit message e");
      return true;
    }
  }
}
// Dummy Users 
var childAnn = Child(id: "1", name: "安", imageLink: "http://img.crcz.com/allimg/201912/01/1575205350650038-lp.jpg");
var childKusnali = Child(id: "2", name: "联合国长子", description: "来自山东，日照。留守儿童。性活泼，喜乐子。");

var childs = [childAnn, childKusnali];
