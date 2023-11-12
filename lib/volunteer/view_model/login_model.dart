import 'package:flutter/material.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:ming_guang/volunteer/main_view.dart';
import 'package:ming_guang/volunteer/services/base/base_url.dart';
import 'package:ming_guang/volunteer/services/base/request_client.dart';
import 'package:ming_guang/volunteer/services/login_service.dart';
import 'package:ming_guang/volunteer/view_model/notifiers/notifier_message.dart';
import 'package:provider/provider.dart';

import '../services/base/token_interceptor.dart';

class LoginModel {
  final LoginService _service = LoginService();

  Future<bool> login(String username, String password, int type, BuildContext context) async {
    String? token = await _service.loginRequest(username, password, type);
    if (token == null) {
      return false;
    } else {
      global_token = token;
      TokenInterceptor interceptor = TokenInterceptor(token: token);
      final client =
          InterceptedClient.build(interceptors: [interceptor]);
      RequestClient.setUpClient(client);

      // Load Messages
      Provider.of<MessageNotifier>(context, listen: false).loadMessagesFromFile();

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
