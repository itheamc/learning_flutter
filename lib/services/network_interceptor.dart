import 'package:dio/dio.dart';
import 'package:learning_flutter/services/network_service.dart';

class CustomInterceptor implements Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print("From Custom Interceptor: ${err.message}");
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("From Custom Interceptor: ${options.path}");
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("From Custom Interceptor: ${response.statusCode}");
    handler.next(response);
  }
}
