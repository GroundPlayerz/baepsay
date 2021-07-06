import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:golden_balance_flutter/model/media_for_upload.dart';
import '../configuration.dart';
import '../util/dio_logging_interceptor.dart';

class MemberApiProvider {
  final Dio _dio = Dio();
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  MemberApiProvider() {
    _dio.options = dioOptions;
    _dio.interceptors.add(DioLoggingInterceptors(_dio));
    _dio.options.headers['requirestoken'] = true;
  }

  Future<Response> uploadPost({
    required String title,
    required String firstContentText,
    required String secondContentText,
    required List<MediaForUpload> mediaList,
  }) async {
    Reference imageRef = _firebaseStorage.ref().child('images');
    List mediaMetaDataList = [];
    if (mediaList.isNotEmpty) {
      for (MediaForUpload media in mediaList) {
        Map<String, dynamic> metaData = {};
        String mediaDownloadUrl;
        mediaDownloadUrl =
            await _uploadToStorageAndGetDownloadURL(imageRef, media.media);

        metaData['url'] = mediaDownloadUrl;
        metaData['type'] = media.type;
        metaData['size'] = media.media.length;
        metaData['content_order'] = media.contentOrder;
        mediaMetaDataList.add(metaData);
      }
    }

    Map<String, dynamic> data = {};
    data['title'] = title;
    data['first_content_text'] = firstContentText;
    data['second_content_text'] = secondContentText;
    data['media_list'] = mediaMetaDataList;

    Response response = await _dio.post('member/post', data: data);
    return response;
  }

  Future<Response> uploadProfilePhoto({required Uint8List imageBytes}) async {
    Reference imageRef = _firebaseStorage.ref().child('profile_photo');
    final String profilePhotoUrl =
        await _uploadToStorageAndGetDownloadURL(imageRef, imageBytes);
    Response response = await _dio.post('member/profile/photo',
        data: {'profile_photo_url': profilePhotoUrl});

    return response;
  }

  Future<Response> uploadProfileName({required String profileName}) async {
    Response response = await _dio
        .post('member/profile/name', data: {'profile_name': profileName});

    return response;
  }

  Future<String> _uploadToStorageAndGetDownloadURL(
      Reference storageRef, Uint8List bytes) async {
    var fileRef = storageRef.child(DateTime.now().toIso8601String());
    var storageUploadTask = fileRef.putData(bytes);
    await storageUploadTask.whenComplete(() {});
    var downloadURL = await fileRef.getDownloadURL();

    return downloadURL;
  }

  Future<Response> getHomeFeed({int? idCursor, double? scoreCursor}) async {
    Map<String, dynamic> queryParameters = {};
    if (scoreCursor != null) queryParameters['score_cursor'] = scoreCursor;
    if (idCursor != null) queryParameters['id_cursor'] = idCursor;
    var response =
        await _dio.get('member/feed', queryParameters: queryParameters);

    return response;
  }

  Future<Response> viewPost({required int postId}) async {
    Response response = await _dio.post('member/post/$postId/view');
    return response;
  }

  Future<Response> likePost({required int postId}) async {
    Response response = await _dio.post('member/post/$postId/like');
    return response;
  }

  Future<Response> cancelLikePost({required int postId}) async {
    Response response = await _dio.delete('member/post/$postId/like');
    return response;
  }

  Future<Response> voteToPost(
      {required int postId, required int choice}) async {
    Response response =
        await _dio.post('member/post/$postId/vote', data: {'choice': choice});
    return response;
  }

  //------댓글------
  Future<Response> createComment({required int postId, required text}) async {
    Response response = await _dio.post('member/post/$postId/comment', data: {
      'text': text,
    });
    return response;
  }

  Future<Response> likeComment({required int commentId}) async {
    Response response = await _dio.post('member/comment/$commentId/like');
    return response;
  }

  Future<Response> cancelLikeComment({required int commentId}) async {
    Response response = await _dio.delete('member/comment/$commentId/like');
    return response;
  }

  //------대댓글------

  Future<Response> createNestedComment(
      {required int commentId, required String text}) async {
    Response response = await _dio
        .post('member/comment/$commentId/nested', data: {'text': text});
    return response;
  }

  Future<Response> likeNestedComment({required int nestedCommentId}) async {
    Response response =
        await _dio.post('member/comment/nested/$nestedCommentId/like');
    return response;
  }

  Future<Response> cancelLikeNestedComment(
      {required int nestedCommentId}) async {
    Response response =
        await _dio.delete('member/comment/nested/$nestedCommentId/like');
    return response;
  }

  Future<Response> reportPost(
      {required int postId, required String text}) async {
    Response response =
        await _dio.post('member/post/$postId/report', data: {'text': text});
    return response;
  }

  Future<Response> reportComment(
      {required int commentId, required String text}) async {
    Response response = await _dio
        .post('member/comment/$commentId/report', data: {'text': text});
    return response;
  }

  Future<Response> reportNestedComment(
      {required int nestedCommentId, required String text}) async {
    Response response = await _dio.post(
        'member/comment/nested/$nestedCommentId/report',
        data: {'text': text});
    return response;
  }

  Future<Response> deletePost({required int postId}) async {
    Response response = await _dio.delete('member/post/$postId');

    return response;
  }

  Future<Response> updateComment(
      {required int commentId, required String text}) async {
    Response response =
        await _dio.put('member/comment/$commentId', data: {'text': text});

    return response;
  }

  Future<Response> deleteComment({required int commentId}) async {
    Response response = await _dio.delete('member/comment/$commentId');

    return response;
  }

  Future<Response> updateNestedComment(
      {required int nestedCommentId, required String text}) async {
    Response response = await _dio
        .put('member/comment/nested/$nestedCommentId', data: {'text': text});

    return response;
  }

  Future<Response> deleteNestedComment({required int nestedCommentId}) async {
    Response response =
        await _dio.delete('member/comment/nested/$nestedCommentId');

    return response;
  }

  Future<Response> getMyUploadedPost(
      {int? idCursor, double? scoreCursor}) async {
    Map<String, dynamic> queryParameters = {};
    if (scoreCursor != null) queryParameters['score_cursor'] = scoreCursor;
    if (idCursor != null) queryParameters['id_cursor'] = idCursor;
    var response = await _dio.get('member/profile/post/my',
        queryParameters: queryParameters);

    return response;
  }

  Future<Response> getMyVotedPost({int? idCursor, double? scoreCursor}) async {
    Map<String, dynamic> queryParameters = {};
    if (scoreCursor != null) queryParameters['score_cursor'] = scoreCursor;
    if (idCursor != null) queryParameters['id_cursor'] = idCursor;
    var response = await _dio.get('member/profile/post/vote',
        queryParameters: queryParameters);

    return response;
  }

  Future<Response> getMyComment({int? idCursor}) async {
    Map<String, dynamic> queryParameters = {};
    if (idCursor != null) queryParameters['id_cursor'] = idCursor;
    var response = await _dio.get('member/profile/comment',
        queryParameters: queryParameters);

    return response;
  }
}
