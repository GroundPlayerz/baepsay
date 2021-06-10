import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:golden_balance_flutter/model/media_for_upload.dart';

import '../api_provider/member_api_provider.dart';

class MemberRepository {
  final memberApiProvider = MemberApiProvider();

  //========프로필===========
  Future<Response> uploadProfilePhoto({required Uint8List imageBytes}) async =>
      await memberApiProvider.uploadProfilePhoto(imageBytes: imageBytes);

  Future<Response> uploadProfileName({required String profileName}) async =>
      await memberApiProvider.uploadProfileName(profileName: profileName);

  Future<Response> getMyUploadedPost(
          {int? idCursor, double? scoreCursor}) async =>
      await memberApiProvider.getMyUploadedPost(
          idCursor: idCursor, scoreCursor: scoreCursor);

  Future<Response> getMyVotedPost({int? idCursor, double? scoreCursor}) async =>
      await memberApiProvider.getMyVotedPost(
          idCursor: idCursor, scoreCursor: scoreCursor);

  Future<Response> getMyComment({int? idCursor}) async =>
      await memberApiProvider.getMyComment(idCursor: idCursor);

  //=======피드==========

  Future<Response> getHomeFeed({int? idCursor, double? scoreCursor}) async =>
      await memberApiProvider.getHomeFeed(
          idCursor: idCursor, scoreCursor: scoreCursor);

  //=========게시물===========

  Future<Response> uploadPost({
    required String title,
    required String firstContentText,
    required String secondContentText,
    required List<MediaForUpload> mediaList,
  }) async =>
      await memberApiProvider.uploadPost(
          title: title,
          firstContentText: firstContentText,
          secondContentText: secondContentText,
          mediaList: mediaList);

  Future<Response> viewPost({required int postId}) async =>
      await memberApiProvider.viewPost(postId: postId);

  Future<Response> voteToPost(
          {required int postId, required int choice}) async =>
      await memberApiProvider.voteToPost(postId: postId, choice: choice);

  Future<Response> likePost({required int postId}) async =>
      await memberApiProvider.likePost(postId: postId);

  Future<Response> cancelLikePost({required int postId}) async =>
      await memberApiProvider.cancelLikePost(postId: postId);

  Future<Response> deletePost({required int postId}) async =>
      await memberApiProvider.deletePost(postId: postId);

  Future<Response> reportPost(
          {required int postId, required String text}) async =>
      await memberApiProvider.reportPost(postId: postId, text: text);

  //------댓글------
  Future<Response> createComment({required int postId, required text}) async =>
      await memberApiProvider.createComment(postId: postId, text: text);

  Future<Response> likeComment({required int commentId}) async =>
      await memberApiProvider.likeComment(commentId: commentId);

  Future<Response> cancelLikeComment({required int commentId}) async =>
      await memberApiProvider.cancelLikeComment(commentId: commentId);

  Future<Response> reportComment(
          {required int commentId, required String text}) async =>
      await memberApiProvider.reportComment(commentId: commentId, text: text);

  Future<Response> updateComment(
          {required int commentId, required String text}) async =>
      await memberApiProvider.updateComment(commentId: commentId, text: text);

  Future<Response> deleteComment({required int commentId}) async =>
      await memberApiProvider.deleteComment(commentId: commentId);

  //------대댓글------

  Future<Response> createNestedComment(
          {required int commentId, required String text}) async =>
      await memberApiProvider.createNestedComment(
          commentId: commentId, text: text);

  Future<Response> likeNestedComment({required int nestedCommentId}) async =>
      await memberApiProvider.likeNestedComment(
          nestedCommentId: nestedCommentId);

  Future<Response> cancelLikeNestedComment(
          {required int nestedCommentId}) async =>
      await memberApiProvider.cancelLikeNestedComment(
          nestedCommentId: nestedCommentId);

  Future<Response> updateNestedComment(
          {required int nestedCommentId, required String text}) async =>
      await memberApiProvider.updateNestedComment(
          nestedCommentId: nestedCommentId, text: text);

  Future<Response> deleteNestedComment({required int nestedCommentId}) async =>
      await memberApiProvider.deleteNestedComment(
          nestedCommentId: nestedCommentId);

  Future<Response> reportNestedComment(
          {required int nestedCommentId, required String text}) async =>
      await memberApiProvider.reportNestedComment(
          nestedCommentId: nestedCommentId, text: text);
}
