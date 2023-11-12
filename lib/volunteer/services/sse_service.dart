import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ming_guang/volunteer/services/base/base_url.dart';

class SseService {
  StreamController<String>? _streamController;
  late http.Client _client;
  late StreamSubscription _subscription;

  void connect(String url) {
    _client = http.Client();
    _streamController = StreamController();

    var _request = http.Request('GET', Uri.parse(url))
      ..headers.addAll({
        "token": global_token
      });

    _client.send(_request).then((response) {
      _subscription = response.stream
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .listen((event) {
        _streamController!.add(event);
      });
    }).catchError((error) {
      // Handle connection errors
      print("SSE connection error: $error");
    });
  }

  Stream<String> get stream => _streamController!.stream;
}
