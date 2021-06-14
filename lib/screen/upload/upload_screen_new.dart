import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/auth_cubit.dart';
import 'package:golden_balance_flutter/constant/spacings.dart';
import 'package:golden_balance_flutter/constant/textstyle.dart';
import 'package:golden_balance_flutter/model/media_for_upload.dart';
import 'package:golden_balance_flutter/screen/home/home_screen.dart';
import 'package:golden_balance_flutter/screen/upload/upload_screen_media_model.dart';
import 'package:golden_balance_flutter/util/widget.dart';
import 'package:pedantic/pedantic.dart';

import 'package:fluttertoast/fluttertoast.dart';

import '../../bloc/cubit/upload_cubit.dart';
import '../../bloc/state/upload_state.dart';
import '../../constant/color.dart';

class UploadScreen extends StatefulWidget {
  final double safeAreaTopHeight;
  final double safeAreaVerticalHeight;

  UploadScreen(
      {required this.safeAreaTopHeight, required this.safeAreaVerticalHeight});

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  bool isMediaQueryCalculationDone = false;
  late final double mediaWidthHeight;
  late final double completeButtonWidth;

  late double safeAreaTopHeight;
  late double safeAreaVerticalHeight;

  FocusNode? myFocusNode;
  final TextEditingController postTitleController = TextEditingController();
  final TextEditingController firstContentController = TextEditingController();
  final TextEditingController secondContentController = TextEditingController();
  UploadScreenMediaModel firstUploadMediaModel = UploadScreenMediaModel();
  UploadScreenMediaModel secondUploadMediaModel = UploadScreenMediaModel();
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
              setState(() {
                isScreenTouchable = false;
              });
              unawaited(Fluttertoast.showToast(
                msg: '파일을 불러오는 중입니다.',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0,
              ));
              if (whichMedia == 1) {
                await firstUploadMediaModel.setImageFile();
              } else {
                await secondUploadMediaModel.setImageFile();
              }
              setState(() {
                isScreenTouchable = true;
              });
            }),
      ],
    );
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
                if (whichMedia == 1) {
                  firstUploadMediaModel.deleteMediaFile();
                } else {
                  secondUploadMediaModel.deleteMediaFile();
                }
                setState(() {});
              }),
        )
      ]),
    );
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
          child: Builder(
            builder: (context) {
              if (firstUploadMediaModel.mediaFile == null) {
                return _emptyMediaWidget();
              } else {
                return _imagePreview(
                    imageFile: firstUploadMediaModel.mediaFile!, whichMedia: 1);
              }
            },
          ),
        ),
        firstUploadMediaModel.mediaFile == null
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
          child: Builder(
            builder: (context) {
              if (secondUploadMediaModel.mediaFile == null) {
                return _emptyMediaWidget();
              } else {
                return _imagePreview(
                    imageFile: secondUploadMediaModel.mediaFile!,
                    whichMedia: 2);
              }
            },
          ),
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
        secondUploadMediaModel.mediaFile == null
            ? Positioned(
                top: 150 * _convertRatio,
                child: _mediaButtonsArea(whichMedia: 2),
              )
            : Container(),
      ],
    );
  }

  bool isNextButtonEnabled() {
    if (postTitleController.text.trim().length >= 2 &&
        firstContentController.text.trim().length >= 2 &&
        secondContentController.text.trim().length >= 2) {
      return true;
    } else {
      return false;
    }
  }

  Widget _completeButtonDeactivated() => Opacity(
        opacity: 0.3,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: kIconGreyColor_CBCBCB,
            borderRadius: BorderRadius.all(Radius.circular(11)),
          ),
          child: Center(
            child: Text(
              '완료',
              style: kNoto16M.copyWith(color: kWhiteColor),
            ),
          ),
        ),
      );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<AuthCubit>(context).getAccessTokenByState();
    BlocProvider.of<UploadCubit>(context).setDefaultState();

    safeAreaTopHeight = widget.safeAreaTopHeight;
    safeAreaVerticalHeight = widget.safeAreaVerticalHeight;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    myFocusNode?.dispose();
    firstContentController.dispose();
    secondContentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!isMediaQueryCalculationDone) {
      mediaWidthHeight = (MediaQuery.of(context).size.width -
              (kOuterHorizontalPadding + kInnerHorizontalPadding) * 2 -
              24) /
          2;
      completeButtonWidth = MediaQuery.of(context).size.width -
          (kOuterHorizontalPadding + kInnerHorizontalPadding) * 2;
      isMediaQueryCalculationDone = true;
    }

    double _mediaWidth = MediaQuery.of(context).size.width;
    double _convertRatio = MediaQuery.of(context).size.width / 375;
    return BlocListener<UploadCubit, UploadState>(
      listener: (context, state) {
        if (state is Uploading) {
          Fluttertoast.showToast(
            msg: '게시물을 업로드 중입니다.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        } else if (state is Compressing) {
          Fluttertoast.showToast(
            msg: '미디어 파일을 압축중입니다.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        } else if (state is Uploaded) {
          Fluttertoast.showToast(
            msg: '게시물이 성공적으로 업로드되었습니다.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => HomeScreen()),
              (route) => false);
        } else if (state is Error) {
          Fluttertoast.showToast(
            msg: '문제가 발생하였습니다.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => HomeScreen()),
              (route) => false);
        }
      },
      child: IgnorePointer(
        ignoring: !isScreenTouchable,
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            leadingWidth: 0,
            titleSpacing: 0,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('닫기', style: kNoto16R),
                  ),
                ),
                Text(''),
                GestureDetector(
                  onTap: isNextButtonEnabled()
                      ? () async {
                          // ToDo: CircularIndicator Alert Dialogue 띄우기
                          setState(() {
                            isScreenTouchable = false;
                          });
                          List<MediaForUpload> mediaList = [];
                          if (firstUploadMediaModel.mediaFileType == 'image') {
                            Uint8List? firstImage =
                                await BlocProvider.of<UploadCubit>(context)
                                    .compressImage(
                                        imageFile:
                                            firstUploadMediaModel.mediaFile!);
                            if (firstImage != null) {
                              mediaList.add(MediaForUpload(
                                  media: firstImage,
                                  type: 'image',
                                  contentOrder: 1));
                            }
                          }
                          if (secondUploadMediaModel.mediaFileType == 'image') {
                            Uint8List? secondImage =
                                await BlocProvider.of<UploadCubit>(context)
                                    .compressImage(
                                        imageFile:
                                            secondUploadMediaModel.mediaFile!);
                            if (secondImage != null) {
                              mediaList.add(MediaForUpload(
                                  media: secondImage,
                                  type: 'image',
                                  contentOrder: 2));
                            }
                          }
                          BlocProvider.of<UploadCubit>(context).uploadPost(
                            title: postTitleController.text.trim(),
                            firstContentText:
                                firstContentController.text.trim(),
                            secondContentText:
                                secondContentController.text.trim(),
                            mediaList: mediaList,
                          );
                        }
                      : () {},
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('등록',
                        style: kNoto16M.copyWith(
                          color: isNextButtonEnabled()
                              ? kAccentPurpleColor
                              : kAccentPurpleColor.withOpacity(0.4),
                        )),
                  ),
                ),
              ],
            ),
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
                Container(
                  height: MediaQuery.of(context).size.height -
                      (safeAreaTopHeight + AppBar().preferredSize.height),
                  width: double.infinity,
                  child: SafeArea(
                    child: ListView(children: [
                      SizedBox(height: 5),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            minHeight: MediaQuery.of(context).size.height -
                                AppBar().preferredSize.height -
                                safeAreaVerticalHeight -
                                15),

                        //Rounded 컨테이너
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: kOuterHorizontalPadding),
                          decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                spreadRadius: 0,
                                blurRadius: 6,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //-----덩어리시작1------
                              Column(
                                children: [
                                  SizedBox(height: 40),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: kInnerHorizontalPadding),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '제목',
                                          // post.title,
                                          style: kPostTitleTextStyle,
                                        ),
                                        SizedBox(height: 30.0),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            //항목 1
                                            Column(
                                              children: [
                                                // mediaList[0]['type'] == 'image'
                                                //     ? Container(
                                                //         decoration:
                                                //             BoxDecoration(),
                                                //         width: mediaWidthHeight,
                                                //         height:
                                                //             mediaWidthHeight,
                                                //         child: ClipRRect(
                                                //           borderRadius:
                                                //               BorderRadius
                                                //                   .circular(10),
                                                //           child:
                                                //               CachedNetworkImage(
                                                //             imageUrl:
                                                //                 mediaList[0]
                                                //                     ['url'],
                                                //             fit: BoxFit.cover,
                                                //           ),
                                                //         ),
                                                //       )
                                                //     : SizedBox(),
                                                SizedBox(height: 13),
                                                // Container(
                                                //   width: mediaWidthHeight,
                                                //   child: Text(
                                                //     post.firstContentText,
                                                //     style:
                                                //         kPostContentTextStyle,
                                                //     textAlign: TextAlign.center,
                                                //   ),
                                                // ),
                                                Container(
                                                  width: mediaWidthHeight,
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                  // padding: EdgeInsets.only(
                                                  //     left: 20 * _convertRatio,
                                                  //     right: 20 * _convertRatio,
                                                  //     top: 6 * _convertRatio,
                                                  //     bottom: 6 * _convertRatio),
                                                  child: _contentTextField(
                                                      _convertRatio,
                                                      controller:
                                                          firstContentController),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                // mediaList[0]['type'] == 'image'
                                                //     ? Container(
                                                //         decoration:
                                                //             BoxDecoration(),
                                                //         width: mediaWidthHeight,
                                                //         height:
                                                //             mediaWidthHeight,
                                                //         child: ClipRRect(
                                                //           borderRadius:
                                                //               BorderRadius
                                                //                   .circular(10),
                                                //           child:
                                                //               CachedNetworkImage(
                                                //             imageUrl:
                                                //                 mediaList[1]
                                                //                     ['url'],
                                                //             fit: BoxFit.cover,
                                                //           ),
                                                //         ),
                                                //       )
                                                //     : SizedBox(),
                                                SizedBox(height: 13),
                                                Container(
                                                  width: mediaWidthHeight,
                                                  child: Text(
                                                    '2번째',
                                                    // post.secondContentText,
                                                    style:
                                                        kPostContentTextStyle,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            //항목 2
                                          ],
                                        ),
                                        SizedBox(height: 38.0),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              //----덩어리시작 2----
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: kInnerHorizontalPadding),
                                    child: Column(
                                      children: [
                                        //투표 버튼
                                        Row(
                                          children: [
                                            //항목 1 선택버튼
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  width: 44,
                                                  height: 44,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: kWhiteColor,
                                                    border: Border.all(
                                                      width: 2,
                                                      color: Color(0xffD5D5D5),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            //항목 2 선택버튼
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  width: 44,
                                                  height: 44,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: kWhiteColor,
                                                    border: Border.all(
                                                      width: 2,
                                                      color: Color(0xffD5D5D5),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 49.0),
                                        //투표 버튼, 투표 결과 영역
                                        _completeButtonDeactivated(),
                                        SizedBox(
                                          height: 23,
                                        ),
                                      ],
                                    ),
                                  ),
                                  //좋아요, 댓글 버튼
                                  SizedBox(height: 10),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                    ]),
                  ),
                  //---------------여기까지--------
                ),
                // _postTitleTextField(_convertRatio,
                //     controller: postTitleController),
                // _firstStackedWidget(_convertRatio, _mediaWidth),
                // divider(color: Colors.white),
                // _secondStackedWidget(_convertRatio, _mediaWidth),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
