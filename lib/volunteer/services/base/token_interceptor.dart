import 'package:http_interceptor/http_interceptor.dart';

class TokenInterceptor implements InterceptorContract {
  final String? token;

  TokenInterceptor({this.token});

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    if (token != null) {
      // Append the token to the headers
      data.headers['token'] = '$token';
      data.headers['Content-Type'] = 'application/json';
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    return data; // Simply return the response data unchanged
  }
}
