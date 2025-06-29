import 'dart:developer';

import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final String apiKey;
  AuthInterceptor({required this.apiKey});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({'appid': apiKey});
    handler.next(options);
  }
}

class LoggerInterceptor extends Interceptor {
  static const _logPrefix = 'Dio';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('Request: ${options.method} ${options.uri}', name: _logPrefix);
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log(
      'Error: ${err.response?.statusCode} ${err.response?.data ?? err.message}',
      name: _logPrefix,
    );
    super.onError(err, handler);
  }
}
