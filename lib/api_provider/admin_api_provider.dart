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

  Future<Response> scoreAllPost() async {
    Response response = await _dio.post('admin/post/scoring');

    return response;
  }

  Future<Response> getReportedPost(
      {int? reportCountCursor, int? idCursor}) async {
    Map<String, dynamic> queryParameters = {};
    if (reportCountCursor != null) {
      queryParameters['report_count_cursor'] = reportCountCursor;
    }
    if (idCursor != null) queryParameters['id_cursor'] = idCursor;
    Response response =
        await _dio.get('admin/report/post', queryParameters: queryParameters);

    return response;
  }

  Future<Response> getPostDetailReport({required int postId}) async {
    Response response = await _dio.get('admin/report/post/$postId');

    return response;
  }

  Future<Response> getReportedComment(
      {int? reportCountCursor, int? idCursor}) async {
    Map<String, dynamic> queryParameters = {};
    if (reportCountCursor != null) {
      queryParameters['report_count_cursor'] = reportCountCursor;
    }
    if (idCursor != null) {
      queryParameters['id_cursor'] = idCursor;
    }
    Response response = await _dio.get('admin/report/comment',
        queryParameters: queryParameters);

    return response;
  }

  Future<Response> getCommentDetailReport({required int commentId}) async {
    Response response = await _dio.get('admin/report/comment/$commentId');

    return response;
  }

  Future<Response> getReportedNestedComment(
      {int? reportCountCursor, int? idCursor}) async {
    Map<String, dynamic> queryParameters = {};
    if (reportCountCursor != null) {
      queryParameters['report_count_cursor'] = reportCountCursor;
    }
    if (idCursor != null) queryParameters['id_cursor'] = idCursor;
    Response response = await _dio.get('admin/report/comment/nested',
        queryParameters: queryParameters);

    return response;
  }

  Future<Response> getNestedCommentDetailReport(
      {required int nestedCommentId}) async {
    Response response =
        await _dio.get('admin/report/comment/nested/$nestedCommentId');
    return response;
  }
}
