import 'package:dio/dio.dart';
import 'package:golden_balance_flutter/api_provider/admin_api_provider.dart';

class AdminRepository {
  AdminApiProvider adminApiProvider = AdminApiProvider();

  Future<Response> getAdminFeed({double? scoreCursor, int? idCursor}) async =>
      await adminApiProvider.getAdminFeed(
          scoreCursor: scoreCursor, idCursor: idCursor);

  Future<Response> getReportedPost(
          {int? reportCountCursor, int? idCursor}) async =>
      await adminApiProvider.getReportedPost(
          reportCountCursor: reportCountCursor, idCursor: idCursor);

  Future<Response> getPostReport({required int postId}) async =>
      await adminApiProvider.getPostReport(postId: postId);

  Future<Response> getReportedComment(
          {int? reportCountCursor, int? idCursor}) async =>
      await adminApiProvider.getReportedComment(
          reportCountCursor: reportCountCursor, idCursor: idCursor);

  Future<Response> getCommentReport({required int commentId}) async =>
      await adminApiProvider.getCommentReport(commentId: commentId);

  Future<Response> getReportedNestedComment(
          {int? reportCountCursor, int? idCursor}) async =>
      await adminApiProvider.getReportedNestedComment(
          reportCountCursor: reportCountCursor, idCursor: idCursor);

  Future<Response> getNestedCommentReportDetail(
          {required int nestedCommentId}) async =>
      adminApiProvider.getNestedCommentReportDetail(
          nestedCommentId: nestedCommentId);
}
