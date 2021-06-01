import 'package:dio/dio.dart';
import 'package:golden_balance_flutter/configuration.dart';
import 'package:golden_balance_flutter/util/dio_logging_interceptor.dart';

class AdminApiProvider {
  final Dio _dio = Dio();

  AdminApiProvider() {
    _dio.options = dioOptions;
    _dio.interceptors.add(DioLoggingInterceptors(_dio));
    _dio.options.headers['requirestoken'] = true;
  }

  Future<Response> getAdminFeed({double? scoreCursor, int? idCursor}) async {
    Map<String, dynamic> queryParameters = {};
    if (scoreCursor != null) queryParameters['score_cursor'] = scoreCursor;
    if (idCursor != null) queryParameters['id_cursor'] = idCursor;
    Response response =
        await _dio.get('admin/feed', queryParameters: queryParameters);

    return response;
  }
}
