import 'package:dio/dio.dart';
import 'package:golden_balance_flutter/util/dio_logging_interceptor.dart';

import '../configuration.dart';

class CommentApiProvider {
  final Dio _dio = Dio();
  CommentApiProvider() {
    _dio.options = dioOptions;
    _dio.interceptors.add(DioLoggingInterceptors(_dio));
    _dio.options.headers['requirestoken'] = true;
  }

  Future<Response> getNestedCommentList(
      {required int commentId, int? idCursor}) async {
    Map<String, dynamic> queryParameters = {};
    if (idCursor != null) queryParameters['id_cursor'] = idCursor;

    Response response = await _dio.get('comment/$commentId/nested',
        queryParameters: queryParameters);
    return response;
  }
}
