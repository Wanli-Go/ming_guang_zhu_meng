import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SseService {
  StreamController<String>? _streamController;
  late http.Client _client;
  late StreamSubscription _subscription;

  void connect(String url) {
    _client = http.Client();
    _streamController = StreamController();

    _client.send(http.Request('GET', Uri.parse(url))).then((response) {
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

  void close() {
    _subscription.cancel();
    _client.close();
    _streamController!.close();
  }
}
