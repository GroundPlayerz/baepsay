import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';

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

  void deleteMediaFile() {
    mediaFile = null;
    mediaFileType = null;
  }
}
