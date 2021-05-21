import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:golden_balance_flutter/constant/textstyle.dart';
import 'package:golden_balance_flutter/screen/home/home_screen.dart';
import 'package:golden_balance_flutter/screen/upload/video_preview.dart';
import 'package:golden_balance_flutter/screen/upload/video_trimmer_screen.dart';
import 'package:golden_balance_flutter/util/widget.dart';

import 'package:video_compress/video_compress.dart';
import 'package:video_trimmer/video_trimmer.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../bloc/cubit/upload_cubit.dart';
import '../../bloc/state/upload_state.dart';
import '../../constant/color.dart';

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  FocusNode? myFocusNode;
  final TextEditingController postTitleController = TextEditingController();

  final TextEditingController firstContentController = TextEditingController();
  VideoPreview? firstVideoPreview;

  final TextEditingController secondContentController = TextEditingController();
  VideoPreview? secondVideoPreview;

  final Trimmer _trimmer = Trimmer();

  File? firstImageFile;
  File? firstVideoFile;
  bool isFirstVideo = false;
  bool isFirstMediaSelected = false;
  File? secondImageFile;
  File? secondVideoFile;
  bool isSecondVideo = false;
  bool isSecondMediaSelected = false;
  bool isScreenTouchable = true;

  Widget _contentTextField(double _convertRatio,
      {required TextEditingController controller}) {
    return IntrinsicWidth(
      child: TextField(
        controller: controller,
        focusNode: myFocusNode,
        decoration: InputDecoration(
          hintText: '항목 입력..',
          hintStyle: kNoto18R.copyWith(
              fontSize: 18 * _convertRatio,
              color: Colors.white.withOpacity(0.7)),
          border: InputBorder.none,
        ),
        style: kNoto18R.copyWith(
            fontSize: 18 * _convertRatio, color: Colors.white),
        keyboardType: TextInputType.multiline,
        maxLines: null,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _postTitleTextField(
    double _convertRatio, {
    required TextEditingController controller,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: kPostGradient70,
      ),
      child: TextField(
        controller: controller,
        focusNode: myFocusNode,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(top: 17, bottom: 17, left: 16, right: 16),
            hintText: '제목 입력..',
            hintStyle: kNoto18B.copyWith(
                fontSize: 18 * _convertRatio,
                color: Colors.white.withOpacity(0.7)),
            border: InputBorder.none,
            counterText: ""
            // alignLabelWithHint: false,
            ),
        style: kNoto18B.copyWith(
            fontSize: 18 * _convertRatio, color: Colors.white),
        maxLength: 100,
        keyboardType: TextInputType.multiline,
        maxLines: null,
      ),
    );
  }

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

  Future<MediaInfo?> compressVideoFileAndGetMediaInfo(File file) async {
    MediaInfo? mediaInfo = await VideoCompress.compressVideo(file.path,
        quality: VideoQuality.DefaultQuality, deleteOrigin: false);
    if (mediaInfo != null) {
      return mediaInfo;
    }
  }

  Widget _mediaButtonsArea({required int whichMedia}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            icon: Icon(
              Icons.image_outlined,
              color: Colors.white,
            ),
            onPressed: () async {
              initializeFile(whichMedia);

              final List<PlatformFile>? file =
                  await _openFileExplorer(FileType.image);
              Fluttertoast.showToast(
                msg: '파일을 불러오는 중입니다.',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0,
              );
              if (file != null && file.isNotEmpty) {
                setState(() {
                  if (whichMedia == 1) {
                    firstImageFile = File(file[0].path!);
                    isFirstMediaSelected = true;
                  } else {
                    secondImageFile = File(file[0].path!);
                    isSecondMediaSelected = true;
                  }
                });
              }
              setState(() {
                isScreenTouchable = true;
              });
            }),
        IconButton(
            icon: Icon(
              Icons.videocam_outlined,
              color: Colors.white,
            ),
            onPressed: () async {
              initializeFile(whichMedia);

              final List<PlatformFile>? file =
                  await _openFileExplorer(FileType.video);
              Fluttertoast.showToast(
                msg: '파일을 불러오는 중입니다.',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0,
              );
              if (file != null && file.isNotEmpty) {
                await _trimmer.loadVideo(videoFile: File(file[0].path!));
                File? videoFile = await Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return VideoTrimmerScreen(_trimmer);
                }));
                if (videoFile != null) {
                  setState(() {
                    if (whichMedia == 1) {
                      isFirstMediaSelected = true;
                      firstVideoFile = videoFile;
                      isFirstVideo = true;
                    } else {
                      isSecondMediaSelected = true;
                      secondVideoFile = videoFile;
                      isSecondVideo = true;
                    }
                  });
                }
              }
            }),
      ],
    );
  }

  void initializeFile(int whichMedia) {
    if (whichMedia == 1) {
      setState(() {
        isFirstVideo = false;
        firstImageFile = null;
        firstVideoFile = null;
        isFirstMediaSelected = false;
      });
    } else {
      setState(() {
        isSecondVideo = false;
        secondImageFile = null;
        secondVideoFile = null;
        isSecondMediaSelected = false;
      });
    }
  }

  Widget _imagePreview({required File imageFile, required int whichMedia}) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Stack(children: [
        Positioned.fill(
          child: Image.file(
            imageFile,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () async {
                initializeFile(whichMedia);
              }),
        )
      ]),
    );
  }

  Widget _videoPreview(
      {required File videoFile,
      required int whichMedia,
      required double mediaWidth,
      required double convertRatio}) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRect(
              child: SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  //alignment: Alignment.center,
                  child: VideoPreview(videoFile: videoFile),
                ),
              ),
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: IconButton(
                icon: Icon(
                  Icons.close,
                ),
                onPressed: () {
                  initializeFile(whichMedia);
                }),
          )
        ],
      ),
    );
  }

  Widget _decideMedia(
      {required int whichMedia,
      required double mediaWidth,
      required double convertRatio}) {
    if (whichMedia == 1) {
      if (firstVideoFile == null && firstImageFile == null)
        return _emptyMediaWidget();
      if (isFirstVideo) {
        return _videoPreview(
            videoFile: firstVideoFile!,
            whichMedia: 1,
            mediaWidth: mediaWidth,
            convertRatio: convertRatio);
      } else {
        return _imagePreview(imageFile: firstImageFile!, whichMedia: 1);
      }
    } else {
      if (secondVideoFile == null && secondImageFile == null)
        return _emptyMediaWidget();
      if (isSecondVideo) {
        return _videoPreview(
            videoFile: secondVideoFile!,
            whichMedia: 2,
            mediaWidth: mediaWidth,
            convertRatio: convertRatio);
      } else {
        return _imagePreview(imageFile: secondImageFile!, whichMedia: 2);
      }
    }
  }

  Widget _emptyMediaWidget() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
          //color: Colors.white.withOpacity(0.5),
          ),
    );
  }

  Widget _mediaWidget(
      {required int whichMedia,
      required double mediaWidth,
      required double convertRatio}) {
    return _decideMedia(
        whichMedia: whichMedia,
        mediaWidth: mediaWidth,
        convertRatio: convertRatio);
  }

  Widget _firstStackedWidget(double _convertRatio, double _mediaWidth) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(gradient: kPostGradient50),
          width: _mediaWidth,
          height: 305 * _convertRatio,
        ),
        Positioned.fill(
            child: _mediaWidget(
                whichMedia: 1,
                mediaWidth: _mediaWidth,
                convertRatio: _convertRatio)),
        !isFirstMediaSelected
            ? Positioned(
                bottom: 150 * _convertRatio,
                child: _mediaButtonsArea(whichMedia: 1),
              )
            : Container(),
        Positioned(
            bottom: 40 * _convertRatio,
            child: Container(
              width: _mediaWidth * 0.8,
              color: Colors.black.withOpacity(0.5),
              padding: EdgeInsets.only(
                  left: 20 * _convertRatio,
                  right: 20 * _convertRatio,
                  top: 6 * _convertRatio,
                  bottom: 6 * _convertRatio),
              child: _contentTextField(_convertRatio,
                  controller: firstContentController),
            )),
      ],
    );
  }

  Widget _secondStackedWidget(double _convertRatio, double _mediaWidth) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(gradient: kPostGradient50),
          width: _mediaWidth,
          height: 305 * _convertRatio,
        ),
        Positioned.fill(
          child: _mediaWidget(
              whichMedia: 2,
              mediaWidth: _mediaWidth,
              convertRatio: _convertRatio),
        ),
        Positioned(
            top: 40 * _convertRatio,
            child: Container(
              width: _mediaWidth * 0.8,
              color: Colors.black.withOpacity(0.5),
              padding: EdgeInsets.only(
                  left: 20 * _convertRatio,
                  right: 20 * _convertRatio,
                  top: 6 * _convertRatio,
                  bottom: 6 * _convertRatio),
              child: _contentTextField(_convertRatio,
                  controller: secondContentController),
            )),
        !isSecondMediaSelected
            ? Positioned(
                top: 150 * _convertRatio,
                child: _mediaButtonsArea(whichMedia: 2),
              )
            : Container(),
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<UploadCubit>(context).setDefaultState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _mediaWidth = MediaQuery.of(context).size.width;
    double _convertRatio = MediaQuery.of(context).size.width / 375;
    return BlocListener<UploadCubit, UploadState>(
      listener: (context, state) {
        if (state is Uploading) {
          Navigator.pop(context);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => HomeScreen()),
              (route) => false);
        } else if (state is Compressing) {
          showModalBottomSheet(
              context: context,
              isDismissible: false,
              builder: (BuildContext context) {
                return Container(
                  height: 100,
                  child: Row(
                    children: [
                      CircularProgressIndicator(),
                      Text('미디어 파일을 압축중입니다.')
                    ],
                  ),
                );
              });
        } else if (state is Uploaded) {
          // Fluttertoast.showToast(
          //   msg: "게시물이 성공적으로 업로드되었습니다.",
          //   toastLength: Toast.LENGTH_SHORT,
          //   gravity: ToastGravity.CENTER,
          //   timeInSecForIosWeb: 1,
          //   backgroundColor: Colors.red,
          //   textColor: Colors.white,
          //   fontSize: 16.0,
          // );
        } else if (state is Error) {
          showModalBottomSheet(
              isDismissible: false,
              context: context,
              builder: (BuildContext context) {
                print(state.message);
                return Container(
                  height: 100,
                  child: Text('문제가 발생하였습니다.'),
                );
              });
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        }
      },
      child: AbsorbPointer(
        absorbing: !isScreenTouchable,
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text('게시물 작성'),
            leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            iconTheme: IconThemeData(color: Colors.white),
            elevation: 0,
            actionsIconTheme: IconThemeData(color: Colors.white),
            actions: [
              TextButton(
                onPressed: () async {
                  BlocProvider.of<UploadCubit>(context).setCompressingState();
                  setState(() {
                    isScreenTouchable = false;
                  });
                  Uint8List? firstMedia;
                  String? firstMediaType;
                  Uint8List? secondMedia;
                  String? secondMediaType;
                  if (isFirstMediaSelected) {
                    if (isFirstVideo) {
                      MediaInfo? compressedMediaInfo =
                          await compressVideoFileAndGetMediaInfo(
                              firstVideoFile!);
                      firstMedia = compressedMediaInfo!.file!.readAsBytesSync();
                      firstMediaType = 'video';
                    } else {
                      firstMedia = await FlutterImageCompress.compressWithFile(
                        firstImageFile!.path,
                        quality: 50,
                      );
                      firstMediaType = 'image';
                    }
                  }

                  if (isSecondMediaSelected) {
                    if (isSecondVideo) {
                      MediaInfo? compressedMediaInfo =
                          await compressVideoFileAndGetMediaInfo(
                              secondVideoFile!);
                      secondMedia =
                          compressedMediaInfo!.file!.readAsBytesSync();
                      secondMediaType = 'video';
                    } else {
                      secondMedia = await FlutterImageCompress.compressWithFile(
                        secondImageFile!.path,
                        quality: 50,
                      );
                      secondMediaType = 'image';
                    }
                  }

                  BlocProvider.of<UploadCubit>(context).uploadPost(
                    title: postTitleController.text.trim(),
                    firstContentText: firstContentController.text.trim(),
                    secondContentText: secondContentController.text.trim(),
                    firstMedia: firstMedia,
                    firstMediaType: firstMediaType,
                    secondMedia: secondMedia,
                    secondMediaType: secondMediaType,
                  );
                },
                child: Text(
                  '완료',
                ),
              )
            ],
          ),
          body: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _postTitleTextField(_convertRatio,
                    controller: postTitleController),
                _firstStackedWidget(_convertRatio, _mediaWidth),
                divider(color: Colors.white),
                _secondStackedWidget(_convertRatio, _mediaWidth),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
