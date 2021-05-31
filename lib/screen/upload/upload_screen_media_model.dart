import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:golden_balance_flutter/screen/upload/video_trimmer_screen.dart';
import 'package:video_trimmer/video_trimmer.dart';

class UploadScreenMediaModel {
  File? mediaFile;
  String? mediaFileType;

  Future<List<PlatformFile>?> _openFileExplorer(
    FileType pickingType,
  ) async {
    try {
      List<PlatformFile>? _paths = (await FilePicker.platform.pickFiles(
        type: pickingType,
        allowMultiple: false,
      ))
          ?.files;
      return _paths;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
      return null;
    } catch (ex) {
      print(ex);
      return null;
    }
  }

  Future<void> setImageFile() async {
    final List<PlatformFile>? file = await _openFileExplorer(FileType.image);
    if (file != null && file.isNotEmpty) {
      mediaFile = File(file[0].path!);
      mediaFileType = 'image';
    }
  }

  Future<void> setVideoFile(BuildContext context,
      {required Trimmer trimmer}) async {
    final List<PlatformFile>? file = await _openFileExplorer(FileType.video);
    if (file != null && file.isNotEmpty) {
      await trimmer.loadVideo(videoFile: File(file[0].path!));
      File? videoFile = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return VideoTrimmerScreen(trimmer);
        },
      ));
      mediaFile = videoFile;
      mediaFileType = 'video';
    }
  }

  void deleteMediaFile() {
    mediaFile = null;
    mediaFileType = null;
  }
}
