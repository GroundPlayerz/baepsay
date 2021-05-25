import 'package:dio/dio.dart';
import 'package:golden_balance_flutter/configuration.dart';
import 'package:golden_balance_flutter/util/dio_logging_interceptor.dart';

class UnauthorizedUserApiProvider {
  final Dio _dio = Dio();

  UnauthorizedUserApiProvider() {
    _dio.options = dioOptions;
    _dio.interceptors.add(DioLoggingInterceptors(_dio));
  }

  Future<Response> getHomeFeed({int? cursor}) async {
    Map<String, dynamic> queryParameters = {};
    if (cursor != null) queryParameters['cursor'] = cursor;
    Response response = await _dio.get('unauthorized/user/feed',
        queryParameters: queryParameters);

    return response;
  }
}
