// import 'dart:io';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:golden_balance_flutter/bloc/cubit/auth_cubit.dart';
// import 'package:golden_balance_flutter/constant/textstyle.dart';
// import 'package:golden_balance_flutter/model/media_for_upload.dart';
// import 'package:golden_balance_flutter/screen/home/home_screen.dart';
// import 'package:golden_balance_flutter/screen/upload/upload_screen_media_model.dart';
// import 'package:golden_balance_flutter/util/widget.dart';
// import 'package:pedantic/pedantic.dart';
//
// import 'package:fluttertoast/fluttertoast.dart';
//
// import '../../bloc/cubit/upload_cubit.dart';
// import '../../bloc/state/upload_state.dart';
// import '../../constant/color.dart';
//
// class UploadScreen extends StatefulWidget {
//   @override
//   _UploadScreenState createState() => _UploadScreenState();
// }
//
// class _UploadScreenState extends State<UploadScreen> {
//   FocusNode? myFocusNode;
//   final TextEditingController postTitleController = TextEditingController();
//   final TextEditingController firstContentController = TextEditingController();
//   final TextEditingController secondContentController = TextEditingController();
//   UploadScreenMediaModel firstUploadMediaModel = UploadScreenMediaModel();
//   UploadScreenMediaModel secondUploadMediaModel = UploadScreenMediaModel();
//   bool isScreenTouchable = true;
//
//   Widget _contentTextField(double _convertRatio,
//       {required TextEditingController controller}) {
//     return IntrinsicWidth(
//       child: TextField(
//         controller: controller,
//         focusNode: myFocusNode,
//         decoration: InputDecoration(
//           hintText: '항목 입력..',
//           hintStyle: kNoto18R.copyWith(
//               fontSize: 18 * _convertRatio,
//               color: Colors.white.withOpacity(0.7)),
//           border: InputBorder.none,
//         ),
//         style: kNoto18R.copyWith(
//             fontSize: 18 * _convertRatio, color: Colors.white),
//         keyboardType: TextInputType.multiline,
//         maxLines: null,
//         textAlign: TextAlign.center,
//       ),
//     );
//   }
//
//   Widget _postTitleTextField(
//     double _convertRatio, {
//     required TextEditingController controller,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: kPostGradient70,
//       ),
//       child: TextField(
//         controller: controller,
//         focusNode: myFocusNode,
//         decoration: InputDecoration(
//             contentPadding:
//                 EdgeInsets.only(top: 17, bottom: 17, left: 16, right: 16),
//             hintText: '제목 입력..',
//             hintStyle: kNoto18B.copyWith(
//                 fontSize: 18 * _convertRatio,
//                 color: Colors.white.withOpacity(0.7)),
//             border: InputBorder.none,
//             counterText: ""
//             // alignLabelWithHint: false,
//             ),
//         style: kNoto18B.copyWith(
//             fontSize: 18 * _convertRatio, color: Colors.white),
//         maxLength: 100,
//         keyboardType: TextInputType.multiline,
//         maxLines: null,
//       ),
//     );
//   }
//
//   Widget _mediaButtonsArea({required int whichMedia}) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         IconButton(
//             icon: Icon(
//               Icons.image_outlined,
//               color: Colors.white,
//             ),
//             onPressed: () async {
//               setState(() {
//                 isScreenTouchable = false;
//               });
//               unawaited(Fluttertoast.showToast(
//                 msg: '파일을 불러오는 중입니다.',
//                 toastLength: Toast.LENGTH_SHORT,
//                 gravity: ToastGravity.CENTER,
//                 timeInSecForIosWeb: 1,
//                 backgroundColor: Colors.red,
//                 textColor: Colors.white,
//                 fontSize: 16.0,
//               ));
//               if (whichMedia == 1) {
//                 await firstUploadMediaModel.setImageFile();
//               } else {
//                 await secondUploadMediaModel.setImageFile();
//               }
//               setState(() {
//                 isScreenTouchable = true;
//               });
//             }),
//       ],
//     );
//   }
//
//   Widget _imagePreview({required File imageFile, required int whichMedia}) {
//     return GestureDetector(
//       behavior: HitTestBehavior.translucent,
//       onTap: () {
//         FocusScope.of(context).unfocus();
//       },
//       child: Stack(children: [
//         Positioned.fill(
//           child: Image.file(
//             imageFile,
//             fit: BoxFit.cover,
//           ),
//         ),
//         Positioned(
//           top: 5,
//           right: 5,
//           child: IconButton(
//               icon: Icon(Icons.close),
//               onPressed: () async {
//                 if (whichMedia == 1) {
//                   firstUploadMediaModel.deleteMediaFile();
//                 } else {
//                   secondUploadMediaModel.deleteMediaFile();
//                 }
//                 setState(() {});
//               }),
//         )
//       ]),
//     );
//   }
//
//   Widget _emptyMediaWidget() {
//     return GestureDetector(
//       behavior: HitTestBehavior.translucent,
//       onTap: () {
//         FocusScope.of(context).unfocus();
//       },
//       child: Container(
//           //color: Colors.white.withOpacity(0.5),
//           ),
//     );
//   }
//
//   Widget _firstStackedWidget(double _convertRatio, double _mediaWidth) {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         Container(
//           decoration: BoxDecoration(gradient: kPostGradient50),
//           width: _mediaWidth,
//           height: 305 * _convertRatio,
//         ),
//         Positioned.fill(
//           child: Builder(
//             builder: (context) {
//               if (firstUploadMediaModel.mediaFile == null) {
//                 return _emptyMediaWidget();
//               } else {
//                 return _imagePreview(
//                     imageFile: firstUploadMediaModel.mediaFile!, whichMedia: 1);
//               }
//             },
//           ),
//         ),
//         firstUploadMediaModel.mediaFile == null
//             ? Positioned(
//                 bottom: 150 * _convertRatio,
//                 child: _mediaButtonsArea(whichMedia: 1),
//               )
//             : Container(),
//         Positioned(
//             bottom: 40 * _convertRatio,
//             child: Container(
//               width: _mediaWidth * 0.8,
//               color: Colors.black.withOpacity(0.5),
//               padding: EdgeInsets.only(
//                   left: 20 * _convertRatio,
//                   right: 20 * _convertRatio,
//                   top: 6 * _convertRatio,
//                   bottom: 6 * _convertRatio),
//               child: _contentTextField(_convertRatio,
//                   controller: firstContentController),
//             )),
//       ],
//     );
//   }
//
//   Widget _secondStackedWidget(double _convertRatio, double _mediaWidth) {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         Container(
//           decoration: BoxDecoration(gradient: kPostGradient50),
//           width: _mediaWidth,
//           height: 305 * _convertRatio,
//         ),
//         Positioned.fill(
//           child: Builder(
//             builder: (context) {
//               if (secondUploadMediaModel.mediaFile == null) {
//                 return _emptyMediaWidget();
//               } else {
//                 return _imagePreview(
//                     imageFile: secondUploadMediaModel.mediaFile!,
//                     whichMedia: 2);
//               }
//             },
//           ),
//         ),
//         Positioned(
//             top: 40 * _convertRatio,
//             child: Container(
//               width: _mediaWidth * 0.8,
//               color: Colors.black.withOpacity(0.5),
//               padding: EdgeInsets.only(
//                   left: 20 * _convertRatio,
//                   right: 20 * _convertRatio,
//                   top: 6 * _convertRatio,
//                   bottom: 6 * _convertRatio),
//               child: _contentTextField(_convertRatio,
//                   controller: secondContentController),
//             )),
//         secondUploadMediaModel.mediaFile == null
//             ? Positioned(
//                 top: 150 * _convertRatio,
//                 child: _mediaButtonsArea(whichMedia: 2),
//               )
//             : Container(),
//       ],
//     );
//   }
//
//   bool isNextButtonEnabled() {
//     if (postTitleController.text.trim().length >= 2 &&
//         firstContentController.text.trim().length >= 2 &&
//         secondContentController.text.trim().length >= 2) {
//       return true;
//     } else {
//       return false;
//     }
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     BlocProvider.of<AuthCubit>(context).getAccessTokenByState();
//     BlocProvider.of<UploadCubit>(context).setDefaultState();
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     myFocusNode?.dispose();
//     firstContentController.dispose();
//     secondContentController.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double _mediaWidth = MediaQuery.of(context).size.width;
//     double _convertRatio = MediaQuery.of(context).size.width / 375;
//     return BlocListener<UploadCubit, UploadState>(
//       listener: (context, state) {
//         if (state is Uploading) {
//           Fluttertoast.showToast(
//             msg: '게시물을 업로드 중입니다.',
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.CENTER,
//             timeInSecForIosWeb: 1,
//             backgroundColor: Colors.red,
//             textColor: Colors.white,
//             fontSize: 16.0,
//           );
//         } else if (state is Compressing) {
//           Fluttertoast.showToast(
//             msg: '미디어 파일을 압축중입니다.',
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.CENTER,
//             timeInSecForIosWeb: 1,
//             backgroundColor: Colors.red,
//             textColor: Colors.white,
//             fontSize: 16.0,
//           );
//         } else if (state is Uploaded) {
//           Fluttertoast.showToast(
//             msg: '게시물이 성공적으로 업로드되었습니다.',
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.CENTER,
//             timeInSecForIosWeb: 1,
//             backgroundColor: Colors.red,
//             textColor: Colors.white,
//             fontSize: 16.0,
//           );
//           Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(
//                   builder: (BuildContext context) => HomeScreen()),
//               (route) => false);
//         } else if (state is Error) {
//           Fluttertoast.showToast(
//             msg: '문제가 발생하였습니다.',
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.CENTER,
//             timeInSecForIosWeb: 1,
//             backgroundColor: Colors.red,
//             textColor: Colors.white,
//             fontSize: 16.0,
//           );
//           Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(
//                   builder: (BuildContext context) => HomeScreen()),
//               (route) => false);
//         }
//       },
//       child: IgnorePointer(
//         ignoring: !isScreenTouchable,
//         child: Scaffold(
//           // resizeToAvoidBottomInset: false,
//           appBar: AppBar(
//             title: Text('게시물 작성'),
//             leading: IconButton(
//               icon: Icon(Icons.close),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//             iconTheme: IconThemeData(color: Colors.white),
//             elevation: 0,
//             actionsIconTheme: IconThemeData(color: Colors.white),
//             actions: [
//               TextButton(
//                 onPressed: isNextButtonEnabled()
//                     ? () async {
//                         // ToDo: CircularIndicator Alert Dialogue 띄우기
//                         setState(() {
//                           isScreenTouchable = false;
//                         });
//                         List<MediaForUpload> mediaList = [];
//                         if (firstUploadMediaModel.mediaFileType == 'image') {
//                           Uint8List? firstImage =
//                               await BlocProvider.of<UploadCubit>(context)
//                                   .compressImage(
//                                       imageFile:
//                                           firstUploadMediaModel.mediaFile!);
//                           if (firstImage != null) {
//                             mediaList.add(MediaForUpload(
//                                 media: firstImage,
//                                 type: 'image',
//                                 contentOrder: 1));
//                           }
//                         }
//                         if (secondUploadMediaModel.mediaFileType == 'image') {
//                           Uint8List? secondImage =
//                               await BlocProvider.of<UploadCubit>(context)
//                                   .compressImage(
//                                       imageFile:
//                                           secondUploadMediaModel.mediaFile!);
//                           if (secondImage != null) {
//                             mediaList.add(MediaForUpload(
//                                 media: secondImage,
//                                 type: 'image',
//                                 contentOrder: 2));
//                           }
//                         }
//                         BlocProvider.of<UploadCubit>(context).uploadPost(
//                           title: postTitleController.text.trim(),
//                           firstContentText: firstContentController.text.trim(),
//                           secondContentText:
//                               secondContentController.text.trim(),
//                           mediaList: mediaList,
//                         );
//                       }
//                     : () {},
//                 child: Text(
//                   '완료',
//                   style: TextStyle(
//                     color: isNextButtonEnabled()
//                         ? kAccentPinkColor
//                         : kAccentPinkColor.withOpacity(0.4),
//                   ),
//                 ),
//               )
//             ],
//           ),
//           body: GestureDetector(
//             behavior: HitTestBehavior.translucent,
//             onTap: () {
//               FocusScope.of(context).unfocus();
//             },
//             child: ListView(
//               // mainAxisAlignment: MainAxisAlignment.start,
//               // crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 _postTitleTextField(_convertRatio,
//                     controller: postTitleController),
//                 _firstStackedWidget(_convertRatio, _mediaWidth),
//                 divider(color: Colors.white),
//                 _secondStackedWidget(_convertRatio, _mediaWidth),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
