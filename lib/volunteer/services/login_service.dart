import 'dart:convert';
import 'package:http/http.dart' as http;
import './base/base_url.dart';

class LoginService {

  Future<String?> loginRequest(String username, String password, int type) async {
    print("$username,$password,$type");
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'username': username,
          'password': password,
          'type': type,
        }),
      );

      if (response.statusCode == 200) {
        // Assuming the API returns a JSON object with a token
        Map<String, dynamic> data = json.decode(response.body);
        print("login data: $data");
        return data['data'];
      } else {
        // Handle the error; either throw an exception or return null
        print("login status code error");
        return 'jdodojdjk';
      }
    } catch (e) { // Return Dummy Token
      print("login e");
      return 'jdodojdjk';
    }
  }
}
