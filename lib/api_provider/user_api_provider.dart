import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
    Uint8List? firstMedia,
    String? firstMediaType,
    Uint8List? secondMedia,
    String? secondMediaType,
  }) async {
    Reference videoRef = _firebaseStorage.ref().child('videos');
    Reference imageRef = _firebaseStorage.ref().child('images');
    String? firstMediaDownloadURL;
    String? secondMediaDownloadURL;
    if (firstMedia != null) {
      firstMediaDownloadURL = firstMediaType == 'video'
          ? await _uploadToStorageAndGetDownloadURL(videoRef, firstMedia)
          : await _uploadToStorageAndGetDownloadURL(imageRef, firstMedia);
    }
    if (secondMedia != null) {
      secondMediaDownloadURL = secondMediaType == 'video'
          ? await _uploadToStorageAndGetDownloadURL(videoRef, secondMedia)
          : await _uploadToStorageAndGetDownloadURL(imageRef, secondMedia);
    }

    Map<String, dynamic> data = {};
    data['title'] = title;
    data['first_content_text'] = firstContentText;
    data['second_content_text'] = secondContentText;
    if (firstMedia != null) {
      data['first_media_size'] = firstMedia.length;
      data['first_media_type'] = firstMediaType;
      data['first_media_url'] = firstMediaDownloadURL;
    }
    if (secondMedia != null) {
      data['second_media_size'] = secondMedia.length;
      data['second_media_type'] = secondMediaType;
      data['second_media_url'] = secondMediaDownloadURL;
    }

    Response response = await _dio.post('user/post', data: data);
    return response;
  }

  Future<String> _uploadToStorageAndGetDownloadURL(
      Reference storageRef, Uint8List bytes) async {
    Reference fileRef = storageRef.child(DateTime.now().toIso8601String());
    UploadTask storageUploadTask = fileRef.putData(bytes);
    await storageUploadTask.whenComplete(() {});
    String downloadURL = await fileRef.getDownloadURL();

    return downloadURL;
  }
}
