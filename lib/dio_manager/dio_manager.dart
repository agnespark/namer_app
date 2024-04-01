import 'package:dio/browser.dart';
import 'package:dio/dio.dart';

class DioManager {
  // DioManager 클래스의 private 생성자 정의
  // MyClass._constructor()는 private 생성자로, 클래스 외부에서는 접근할 수 없음
  DioManager._constructor();

  // 생성자를 호출하고 반환된 Singleton 인스턴스를 _instance 변수에 할당
  static final DioManager _instance = DioManager._constructor();

  // DioManager 클래스의 팩토리 메서드
  // DioManager 호출시에 _instance 변수를 반환
  factory DioManager() => _instance;

  static final Dio _dio = _createDio(); // Dio 인스턴스 생성

  // Dio 인스턴스를 생성하고 설정하는 함수
  static Dio _createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: 'https://server.flexdate.co.kr/', // 기본 URL 설정
      receiveTimeout: const Duration(seconds: 30000), // 데이터 수신 제한 시간 설정
      connectTimeout: const Duration(seconds: 30000), // 서버 연결 시간 초과 설정
      sendTimeout: const Duration(seconds: 30000), // 데이터 전송 제한 시간 설정
    ));
    dio.httpClientAdapter =
        BrowserHttpClientAdapter(); // Dio에 브라우저용 HTTP 클라이언트 어댑터 설정
    dio.options.contentType =
        Headers.jsonContentType; // 기본 요청 시 JSON 형식의 컨텐츠 타입 설정
    return dio;
  }

  // GET 요청을 수행하는 함수
  Future<Map<String, dynamic>> get(String path,
      {Map<String, dynamic> query = const {}}) async {
    var response = await _dio.get(path, queryParameters: query);
    return response.data;
  }

  // PUT 요청을 수행하는 함수
  Future<Map<String, dynamic>> put(String path,
      {Map<String, dynamic> query = const {},
      Map<String, dynamic> requestBody = const {}}) async {
    var response = await putResp(path, query: query, requestBody: requestBody);
    return response.data;
  }

  // PATCH 요청을 수행하는 함수
  Future<Map<String, dynamic>> patch(String path, dynamic data) async {
    var response = await _dio.patch(path, data: data);
    return response.data;
  }

  // DELETE 요청을 수행하는 함수
  Future<Map<String, dynamic>> delete(String path,
      {Map<String, dynamic> query = const {},
      Map<String, dynamic> requestBody = const {}}) async {
    var response =
        await deleteResp(path, query: query, requestBody: requestBody);
    return response.data;
  }

  // POST 요청을 수행하는 함수
  Future<Map<String, dynamic>> post(String path,
      {dynamic data,
      Map<String, dynamic> query = const {},
      Map<String, dynamic> requestBody = const {}}) async {
    if (data != null) {
      var response = await _dio.post(path, queryParameters: query, data: data);
      return response.data;
    } else {
      var response =
          await postResp(path, query: query, requestBody: requestBody);
      return response.data;
    }
  }

  // GET 요청을 보내고 응답을 받는 함수
  Future<Response> getResp(String path,
      {Map<String, dynamic> query = const {}}) async {
    var response = await _dio.get(path, queryParameters: query);
    return response;
  }

  // PUT 요청을 보내고 응답을 받는 함수
  Future<Response> putResp(String path,
      {Map<String, dynamic> query = const {},
      Map<String, dynamic> requestBody = const {}}) async {
    var response =
        await _dio.put(path, queryParameters: query, data: requestBody);
    return response;
  }

  // DELETE 요청을 보내고 응답을 받는 함수
  Future<Response> deleteResp(String path,
      {Map<String, dynamic> query = const {},
      Map<String, dynamic> requestBody = const {}}) async {
    var response =
        await _dio.delete(path, queryParameters: query, data: requestBody);
    return response;
  }

  // POST 요청을 보내고 응답을 받는 함수
  Future<Response> postResp(String path,
      {Map<String, dynamic> query = const {},
      Map<String, dynamic> requestBody = const {}}) async {
    var response =
        await _dio.post(path, queryParameters: query, data: requestBody);
    return response;
  }

  // Form URL 인코딩된 데이터로 POST 요청을 수행하는 함수
  Future<Map<String, dynamic>> postFormUrlEncoded(String path,
      {Map<String, dynamic> query = const {},
      Map<String, dynamic> requestBody = const {}}) async {
    _dio.options.contentType =
        Headers.formUrlEncodedContentType; // 컨텐츠 타입을 Form URL 인코딩으로 설정
    var response =
        await _dio.post(path, queryParameters: query, data: requestBody);
    _dio.options.contentType = Headers.jsonContentType; // 컨텐츠 타입을 JSON으로 다시 설정
    return response.data;
  }

  // 멀티파트 폼 데이터로 POST 요청을 수행하는 함수
  Future<Map<String, dynamic>> postMultiPartFormData(String path,
      {Map<String, dynamic> query = const {},
      required FormData formData}) async {
    _dio.options.contentType = 'multipart/form-data'; // 컨텐츠 타입을 멀티파트 폼 데이터로 설정
    late Response response;
    try {
      response = await _dio.post(path,
          queryParameters: query, data: formData); // 요청 보내기
    } catch (e, s) {
      print(e); // 오류 출력
      print(s);
      throw 'throw : postMultiPartFormData'; // 오류 throw
    } finally {
      _dio.options.contentType =
          Headers.jsonContentType; // 컨텐츠 타입을 JSON으로 다시 설정
    }
    return response.data;
  }

  // 멀티파트 폼 데이터로 PUT 요청을 수행하는 함수
  Future<Map<String, dynamic>> putMultiPartFormData(String path,
      {Map<String, dynamic> query = const {},
      required FormData formData}) async {
    _dio.options.contentType = 'multipart/form-data'; // 컨텐츠 타입을 멀티파트 폼 데이터로 설정
    late Response response;
    try {
      response = await _dio.put(path,
          queryParameters: query, data: formData); // 요청 보내기
    } catch (e) {
      throw 'Throw 회원가입 PUT userProfile 실패'; // 오류 throw
    } finally {
      _dio.options.contentType =
          Headers.jsonContentType; // 컨텐츠 타입을 JSON으로 다시 설정
    }
    return response.data;
  }
}
