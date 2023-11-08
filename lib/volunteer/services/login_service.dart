import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';
import './base/base_url.dart';
import './base/request_client.dart';
import './base/token_interceptor.dart';

class LoginService {

  Future<String?> loginRequest(String username, String password, int type) async {
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
        return data['token'];
      } else {
        // Handle the error; either throw an exception or return null
        return 'jdodojdjk';
      }
    } catch (e) { // Return Dummy Token
      return 'jdodojdjk';
    }
  }
}
