import 'package:dio/dio.dart';

import '../main.dart';

class NetworkCommon {
  static final NetworkCommon _singleton = NetworkCommon._internal();

  factory NetworkCommon() {
    return _singleton;
  }

  NetworkCommon._internal();

  Dio get dio {
    Dio dio = Dio();

    dio.interceptors.add(alice.getDioInterceptor());

    /** Cat API **/
    // dio.options.baseUrl = 'https://catfact.ninja/';
    dio.options.baseUrl = 'https://official-joke-api.appspot.com/';
    dio.options.connectTimeout = const Duration(seconds: 150); //5s
    dio.options.receiveTimeout = const Duration(seconds: 150);
    dio.interceptors.add(LogInterceptor(responseBody: true, error: true));
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handle) async {

      return handle.next(options); //continue
    }, onResponse: (response, handler) async {
      return handler.next(response); // continue
    }, onError: (DioException e, handler) {
        throw e;
    }));
    return dio;
  }
}

class UnothorizedException implements Exception {}
