import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:golden_balance_flutter/model/media_for_upload.dart';

import '../api_provider/user_api_provider.dart';

class UserRepository {
  final userApiProvider = UserApiProvider();

  Future<Response> uploadPost({
    required String title,
    required String firstContentText,
    required String secondContentText,
    required List<MediaForUpload> mediaList,
  }) async =>
      await userApiProvider.uploadPost(
          title: title,
          firstContentText: firstContentText,
          secondContentText: secondContentText,
          mediaList: mediaList);

  Future<Response> getHomeFeed({int? cursor}) async =>
      await userApiProvider.getHomeFeed(cursor: cursor);

  Future<Response> viewPost({required int postId}) async =>
      await userApiProvider.viewPost(postId: postId);

  Future<Response> voteToPost(
          {required int postId, required int choice}) async =>
      await userApiProvider.voteToPost(postId: postId, choice: choice);

  Future<Response> likePost({required int postId}) async =>
      await userApiProvider.likePost(postId: postId);

  Future<Response> cancelLikePost({required int postId}) async =>
      await userApiProvider.cancelLikePost(postId: postId);
}
