import 'package:dio/dio.dart';
import 'package:learning_flutter/services/network_interceptor.dart';
import 'package:learning_flutter/services/network_request_handler.dart';

// const String _baseUrl = "https://jsonplaceholder.typicode.com";
const String _baseUrl = "https://youtu.be";
class NetworkService with NetworkRequestHandler {
  late Dio _dio;

  NetworkService.init() {
    BaseOptions options = BaseOptions(baseUrl: _baseUrl);
    _dio = Dio(options);
    _dio.interceptors.add(CustomInterceptor());
  }

  @override
  Future<void> fetch({void Function (int, int)? onReceiveProgress}) async {
    try {
      final response = await _dio.get(
          "/Ci4t-NkOY3I", onReceiveProgress: onReceiveProgress);
      if (response.statusCode != 200) {
        print("Something went wrong!!");
      } else {
        print(response.statusMessage);
      }
    } on DioError catch (e) {
      print(e.message);
    }
  }

}
