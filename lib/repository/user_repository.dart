import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../api_provider/user_api_provider.dart';
import '../api_provider/user_api_provider.dart';

class UserRepository {
  final userApiProvider = UserApiProvider();

  Future<Response> uploadPost({
    required String title,
    required String firstContentText,
    required String secondContentText,
    Uint8List? firstMedia,
    String? firstMediaType,
    Uint8List? secondMedia,
    String? secondMediaType,
  }) async =>
      await userApiProvider.uploadPost(
          title: title,
          firstContentText: firstContentText,
          secondContentText: secondContentText,
          firstMedia: firstMedia,
          firstMediaType: firstMediaType,
          secondMedia: secondMedia,
          secondMediaType: secondMediaType);
}
