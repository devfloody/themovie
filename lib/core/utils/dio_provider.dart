import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';

import '../constants/api.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final dio = Dio(
    BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        responseType: ResponseType.json,
        connectTimeout: 3000,
        receiveTimeout: 5000,
        headers: {
          "content-type": "application/json",
        }),
  );
  dio.interceptors.add(HttpFormatter());
  return dio;
}
