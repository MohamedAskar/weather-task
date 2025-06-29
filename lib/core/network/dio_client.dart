import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../configuration/configuration.dart';
import 'interceptors.dart';

part 'dio_client.g.dart';

@riverpod
DioClient dioClient(Ref ref) {
  return DioClient(ref);
}

class DioClient {
  final Ref ref;
  late Dio _dio;
  Dio get dio => _dio;

  DioClient(this.ref) {
    _dio = Dio(
      BaseOptions(
        responseType: ResponseType.json,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.addAll([
      AuthInterceptor(apiKey: configuration.apiKey),
      LoggerInterceptor(),
    ]);
  }
}
