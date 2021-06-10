import 'package:dio/dio.dart';
import 'package:golden_balance_flutter/api_provider/post_api_provider.dart';

class PostRepository {
  final postApiProvider = PostApiProvider();

  Future<Response> getCommentList({required int postId, int? idCursor}) async =>
      await postApiProvider.getCommentList(postId: postId, idCursor: idCursor);

  Future<Response> getPostById({required int postId}) async =>
      await postApiProvider.getPostById(postId: postId);
}
