import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:golden_balance_flutter/model/media_for_upload.dart';
import 'package:video_compress/video_compress.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../repository/user_repository.dart';
import '../state/upload_state.dart';

class UploadCubit extends Cubit<UploadState> {
  final UserRepository repository;

  UploadCubit({required this.repository}) : super(Default());

  setDefaultState() {
    emit(Default());
  }

  Future<MediaInfo?> compressVideo({required File videoFile}) async {
    emit(Compressing());
    MediaInfo? mediaInfo = await VideoCompress.compressVideo(videoFile.path,
        quality: VideoQuality.MediumQuality, deleteOrigin: false);
    if (mediaInfo != null) {
      return mediaInfo;
    }
  }

  Future<Uint8List?> getVideoThumbnailFile(File file) async {
    final thumbnailFile = await VideoThumbnail.thumbnailData(
      video: file.path,
      imageFormat: ImageFormat.JPEG,
      maxWidth:
          128, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
      quality: 50,
    );

    return thumbnailFile;
  }

  Future<Uint8List?> compressImage({required File imageFile}) async {
    emit(Compressing());
    Uint8List? image = await FlutterImageCompress.compressWithFile(
      imageFile.path,
      quality: 70,
    );

    if (image != null) {
      return image;
    }
  }

  void uploadPost({
    required String title,
    required String firstContentText,
    required String secondContentText,
    required List<MediaForUpload> mediaList,
  }) async {
    try {
      emit(Uploading());
      final response = await repository.uploadPost(
          title: title,
          firstContentText: firstContentText,
          secondContentText: secondContentText,
          mediaList: mediaList);
      emit(Uploaded());
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
