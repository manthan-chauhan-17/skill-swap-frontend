import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:skill_swap_frontend/imports.dart';
import 'package:skill_swap_frontend/services/api_service/rest_client.dart';

final restClient = RestClient(dio);

final dio = getDio();

Dio getDio() {
  BaseOptions options = BaseOptions(
    receiveDataWhenStatusError: true,
    contentType: "application/json",
    sendTimeout: const Duration(seconds: 30),
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  );

  Dio dio = Dio(options);
  dio.interceptors.add(LogInterceptor());
  dio.interceptors.add(InterceptorsWrapper(onRequest: (request, handler) {
    log('Api Request Body: ${request.data}');
    return handler.next(request);
  }, onResponse: (Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 200) {
      debugPrint('status code 200');
    }
    log('Api Response: ${response.data}');
    return handler.next(response);
  }, onError: (DioException e, handler) {
    final response = e.response;
    log('Api Error --> statusCode: ${response?.statusCode} --> ${response?.statusMessage} : Error ==> ${e.toString()}');
    return handler.next(e);
  }));
  return dio;
}
