import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:golden_balance_flutter/api_provider/comment_api_provider.dart';

class CommentRepository {
  final commentApiProvider = CommentApiProvider();

  Future<Response> getNestedCommentList(
          {required int commentId, int? idCursor}) async =>
      await commentApiProvider.getNestedCommentList(
          commentId: commentId, idCursor: idCursor);
}
