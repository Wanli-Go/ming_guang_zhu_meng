import 'package:http_interceptor/http_interceptor.dart';

class RequestClient{
  static late final InterceptedClient client;
  static setUpClient(InterceptedClient newClient){
    client = newClient;
  }
}