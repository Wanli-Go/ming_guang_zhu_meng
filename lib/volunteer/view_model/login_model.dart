import 'package:flutter/material.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:ming_guang/volunteer/main_view.dart';
import 'package:ming_guang/volunteer/services/base/request_client.dart';
import 'package:ming_guang/volunteer/services/login_service.dart';

import '../services/base/token_interceptor.dart';

class LoginModel {
  final LoginService _service = LoginService();

  Future<bool> login(String username, String password, int type) async {
    String? token = await _service.loginRequest(username, password, type);
    if (token == null) {
      return false;
    } else {
      TokenInterceptor interceptor = TokenInterceptor(token: token);
      final client =
          InterceptedClient.build(interceptors: [interceptor]);
      RequestClient.setUpClient(client);
      return true;
    }
  }

  void navigateToMain(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainView(),
        ));
  }
}
