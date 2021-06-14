import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:golden_balance_flutter/bloc/cubit/auth_cubit.dart';
import 'package:golden_balance_flutter/bloc/cubit/upload_cubit.dart';
import 'package:golden_balance_flutter/bloc/state/auth_state.dart';
import 'package:golden_balance_flutter/bloc/state/upload_state.dart';
import 'package:golden_balance_flutter/screen/error_screen.dart';
import 'package:golden_balance_flutter/screen/upload/upload_screen_media_model.dart';
import 'package:pedantic/pedantic.dart';

class ProfileEditScreen extends StatefulWidget {
  @override
  _ProfileEditScreenState createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final TextEditingController _controller = TextEditingController();
  UploadScreenMediaModel uploadMediaModel = UploadScreenMediaModel();
  bool isScreenTouchable = true;
  FocusNode? myFocusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<AuthCubit>(context).getAccessTokenByState();
    myFocusNode = FocusNode();
    _controller.text =
        BlocProvider.of<AuthCubit>(context).getProfileName() ?? '오류 발생';
    BlocProvider.of<UploadCubit>(context).setDefaultState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    myFocusNode?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UploadCubit, UploadState>(
      listener: (context, state) {
        if (state is Uploading) {
          Fluttertoast.showToast(
            msg: '변경된 정보를 적용중입니다.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        } else if (state is Compressing) {
          Fluttertoast.showToast(
            msg: '이미지 파일을 압축중입니다.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        } else if (state is Uploaded) {
          Fluttertoast.showToast(
            msg: '프로필이 성공적으로 변경되었습니다.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          Phoenix.rebirth(context);
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
          Phoenix.rebirth(context);
        }
      },
      child: IgnorePointer(
        ignoring: !isScreenTouchable,
        child: Scaffold(
          appBar: AppBar(
            title: Text('프로필 편집'),
            actions: [
              TextButton(
                onPressed: () async {
                  if (_controller.text.isNotEmpty) {
                    setState(() {
                      isScreenTouchable = false;
                    });
                    Uint8List? imageBytes;
                    if (uploadMediaModel.mediaFile != null) {
                      imageBytes = await BlocProvider.of<UploadCubit>(context)
                          .compressProfileImage(
                              imageFile: uploadMediaModel.mediaFile!);
                    }
                    BlocProvider.of<UploadCubit>(context).uploadProfile(
                      profileName: _controller.text.trim(),
                      imageBytes: imageBytes,
                    );
                  } else {
                    unawaited(Fluttertoast.showToast(
                      msg: '프로필 이름을 작성해주세요',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.grey,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    ));
                  }
                },
                child: Text('완료'),
              ),
            ],
          ),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SafeArea(
              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, authState) {
                  if (authState is FirebaseSignedIn) {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text('프로필 사진'),
                              Builder(builder: (context) {
                                if (authState.member.profilePhotoUrl != null &&
                                    uploadMediaModel.mediaFile == null) {
                                  return CircleAvatar(
                                    radius: 24,
                                    foregroundImage: CachedNetworkImageProvider(
                                      authState.member.profilePhotoUrl!,
                                    ),
                                    backgroundColor: Colors.white,
                                  );
                                }

                                if (uploadMediaModel.mediaFile != null) {
                                  return Container(
                                      height: 100,
                                      width: 100,
                                      child: Image.file(
                                        uploadMediaModel.mediaFile!,
                                        fit: BoxFit.cover,
                                      ));
                                }

                                return Container(
                                  color: Colors.grey,
                                  height: 100,
                                  width: 100,
                                );
                              }),
                              TextButton(
                                onPressed: () async {
                                  unawaited(Fluttertoast.showToast(
                                    msg: '파일을 불러오는 중입니다.',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.grey,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  ));
                                  await uploadMediaModel.setImageFile();
                                  setState(() {});
                                },
                                child: Text('프로필 사진 변경'),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text('프로필 이름'),
                              Container(
                                width: 100,
                                child: TextField(
                                  focusNode: myFocusNode,
                                  controller: _controller,
                                ),
                              )
                            ],
                          )
                        ]);
                  } else if (authState is AuthError) {
                    return ErrorScreen();
                  }
                  return Container();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
