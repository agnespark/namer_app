import 'package:dio/browser.dart';
import 'package:dio/dio.dart';

class DioManager {
  DioManager._constructor();

  static final DioManager _instance = DioManager._constructor();

  factory DioManager() => _instance;

  static final Dio _dio = _createDio();

  static Dio _createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: 'https://server.flexdate.co.kr/',
      receiveTimeout: const Duration(seconds: 30000),
      connectTimeout: const Duration(seconds: 30000),
      sendTimeout: const Duration(seconds: 30000),
    ));

    return dio;
  }

  Future<dynamic> get(String path,
      {Map<String, dynamic> query = const {}}) async {
    var response = await getResp(path, query: query);
    return response.data;
  }

  Future<Response> getResp(String path,
      {Map<String, dynamic> query = const {}}) async {
    var response = await _dio.get(path, queryParameters: query);
    return response;
  }
}
