import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/user_repository.dart';
import '../state/upload_state.dart';

class UploadCubit extends Cubit<UploadState> {
  final UserRepository repository;

  UploadCubit({required this.repository}) : super(Default());

  setDefaultState() {
    emit(Default());
  }

  setCompressingState() {
    emit(Compressing());
  }

  uploadPost({
    required String title,
    required String firstContentText,
    required String secondContentText,
    Uint8List? firstMedia,
    String? firstMediaType,
    Uint8List? secondMedia,
    String? secondMediaType,
  }) async {
    try {
      emit(Uploading());
      final Response response = await repository.uploadPost(
          title: title,
          firstContentText: firstContentText,
          secondContentText: secondContentText,
          firstMedia: firstMedia,
          firstMediaType: firstMediaType,
          secondMedia: secondMedia,
          secondMediaType: secondMediaType);
      emit(Uploaded());
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
