import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:golden_balance_flutter/model/media_for_upload.dart';
import '../configuration.dart';
import '../util/dio_logging_interceptor.dart';

class UserApiProvider {
  final Dio _dio = Dio();
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserApiProvider() {
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
    Reference videoRef = _firebaseStorage.ref().child('videos');
    Reference imageRef = _firebaseStorage.ref().child('images');
    Reference thumbnailRef = _firebaseStorage.ref().child('thumbnail');
    List mediaMetaDataList = [];
    if (mediaList.isNotEmpty) {
      for (MediaForUpload media in mediaList) {
        Map<String, dynamic> metaData = {};
        String mediaDownloadUrl;
        if (media.type == 'video') {
          mediaDownloadUrl =
              await _uploadToStorageAndGetDownloadURL(videoRef, media.media);
        } else if (media.type == 'image') {
          mediaDownloadUrl =
              await _uploadToStorageAndGetDownloadURL(imageRef, media.media);
        } else {
          mediaDownloadUrl = await _uploadToStorageAndGetDownloadURL(
              thumbnailRef, media.media);
        }
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

    Response response = await _dio.post('user/post', data: data);
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

  Future<Response> getHomeFeed({int? cursor}) async {
    Map<String, dynamic> queryParameters = {};
    if (cursor != null) queryParameters['cursor'] = cursor;
    queryParameters['type'] = 'home';
    var response =
        await _dio.get('user/feed', queryParameters: queryParameters);

    return response;
  }

  Future<Response> viewPost({required int postId}) async {
    Response response = await _dio.post('user/post/$postId/view');
    return response;
  }

  Future<Response> likePost({required int postId}) async {
    Response response = await _dio.post('user/post/$postId/like');
    return response;
  }

  Future<Response> cancelLikePost({required int postId}) async {
    Response response = await _dio.delete('user/post/$postId/like');
    return response;
  }

  Future<Response> voteToPost(
      {required int postId, required int choice}) async {
    Response response =
        await _dio.post('user/post/$postId/vote', data: {'choice': choice});
    return response;
  }
}
