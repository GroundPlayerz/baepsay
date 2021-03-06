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
    return Container(
      child: TextField(
        cursorColor: kAccentPinkColor,
        controller: controller,
        focusNode: myFocusNode,
        decoration: InputDecoration(
          hintText: '?????? ??????..',
          hintStyle: kPostContentTextStyle.copyWith(color: kGreyColor_999999),
          border: InputBorder.none,
        ),
        style: kPostContentTextStyle,
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
      decoration: BoxDecoration(),
      child: TextField(
        controller: controller,
        focusNode: myFocusNode,
        cursorColor: kAccentPinkColor,
        cursorWidth: 2.2,
        decoration: InputDecoration(
          //contentPadding: EdgeInsets.all(0),
          hintText: '?????? ??????..',
          hintStyle: kPostTitleTextStyle.copyWith(color: kGreyColor_999999),
          border: InputBorder.none,
          counterText: '',
        ),
        style: kPostTitleTextStyle,
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
              color: kIconGreyColor_CBCBCB,
            ),
            onPressed: () async {
              setState(() {
                isScreenTouchable = false;
              });
              showToast(msg: '????????? ???????????? ????????????.');
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

  bool checkIsUploadable() {
    if (postTitleController.text.trim().isNotEmpty &&
        firstContentController.text.trim().isNotEmpty &&
        secondContentController.text.trim().isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void _showUnuploadableAlertDialog() {
    if (postTitleController.text.trim().isEmpty) {
      showPostUploadAlertDialog(context, title: '????????? ????????? ?????????.');
    } else if (firstContentController.text.trim().isEmpty ||
        secondContentController.text.trim().isEmpty) {
      showPostUploadAlertDialog(context, title: '????????? ????????? ?????????.');
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
              '??????',
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
              (kPostOuterHorizontalPadding + kPostInnerHorizontalPadding) * 2 -
              24) /
          2;
      completeButtonWidth = MediaQuery.of(context).size.width -
          (kPostOuterHorizontalPadding + kPostInnerHorizontalPadding) * 2;
      isMediaQueryCalculationDone = true;
    }
    //
    // double _mediaWidth = MediaQuery.of(context).size.width;
    double _convertRatio = MediaQuery.of(context).size.width / 375;

    Widget _mediaStack(
            {required UploadScreenMediaModel whichUploadMediaModel,
            required int whichMedia}) =>
        Stack(
          children: [
            Container(
              width: mediaWidthHeight,
              height: mediaWidthHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kLightGreyColor_F4F4F4,
              ),
            ),
            whichUploadMediaModel.mediaFile == null
                ? SizedBox()
                : Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: _imagePreview(
                          imageFile: whichUploadMediaModel.mediaFile!,
                          whichMedia: whichMedia),
                    ),
                  ),
            whichUploadMediaModel.mediaFile == null
                ? Positioned.fill(
                    child: _mediaButtonsArea(whichMedia: whichMedia))
                : SizedBox(),
          ],
        );

    return BlocListener<UploadCubit, UploadState>(
      listener: (context, state) {
        if (state is Uploading) {
          showToast(msg: '???????????? ????????? ????????????.');
        } else if (state is Compressing) {
          showToast(msg: '????????? ????????? ??????????????????.');
        } else if (state is Uploaded) {
          showToast(msg: '???????????? ??????????????? ????????????????????????.');

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => HomeScreen()),
              (route) => false);
        } else if (state is Error) {
          showToast(msg: '????????? ?????????????????????.');
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
                    child: Text('??????', style: kNoto16R),
                  ),
                ),
                Text(''),
                GestureDetector(
                  onTap: () async {
                    // ToDo: CircularIndicator Alert Dialogue ?????????
                    if (checkIsUploadable()) {
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
                        firstContentText: firstContentController.text.trim(),
                        secondContentText: secondContentController.text.trim(),
                        mediaList: mediaList,
                      );
                    } else {
                      _showUnuploadableAlertDialog();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('??????',
                        style: kNoto16M.copyWith(
                          color: kAccentPinkColor,
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

                        //Rounded ????????????
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: kPostOuterHorizontalPadding),
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
                              //-----???????????????1------
                              Column(
                                children: [
                                  SizedBox(height: 30),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            kPostInnerHorizontalPadding),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        _postTitleTextField(_convertRatio,
                                            controller: postTitleController),
                                        SizedBox(height: 18.0),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            //?????? 1
                                            Column(
                                              children: [
                                                _mediaStack(
                                                    whichUploadMediaModel:
                                                        firstUploadMediaModel,
                                                    whichMedia: 1),
                                                SizedBox(height: 1),
                                                Container(
                                                  width: mediaWidthHeight,
                                                  child: _contentTextField(
                                                      _convertRatio,
                                                      controller:
                                                          firstContentController),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                _mediaStack(
                                                    whichUploadMediaModel:
                                                        secondUploadMediaModel,
                                                    whichMedia: 2),
                                                SizedBox(height: 1),
                                                Container(
                                                  width: mediaWidthHeight,
                                                  child: _contentTextField(
                                                      _convertRatio,
                                                      controller:
                                                          secondContentController),
                                                ),
                                              ],
                                            ),
                                            //?????? 2
                                          ],
                                        ),
                                        SizedBox(height: 38.0),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              //----??????????????? 2----
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            kPostInnerHorizontalPadding),
                                    child: Column(
                                      children: [
                                        //?????? ??????
                                        Row(
                                          children: [
                                            //?????? 1 ????????????
                                            Expanded(
                                              child: Opacity(
                                                opacity: 0.3,
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
                                                        color:
                                                            Color(0xffD5D5D5),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            //?????? 2 ????????????
                                            Expanded(
                                              child: Opacity(
                                                opacity: 0.3,
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
                                                        color:
                                                            Color(0xffD5D5D5),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 49.0),
                                        //?????? ??????, ?????? ?????? ??????
                                        _completeButtonDeactivated(),
                                        SizedBox(
                                          height: 23,
                                        ),
                                      ],
                                    ),
                                  ),
                                  //?????????, ?????? ??????
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
