import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:golden_balance_flutter/model/media_for_upload.dart';
import '../../repository/user_repository.dart';
import '../state/upload_state.dart';

class UploadCubit extends Cubit<UploadState> {
  final UserRepository repository;

  UploadCubit({required this.repository}) : super(Default());

  setDefaultState() {
    emit(Default());
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
