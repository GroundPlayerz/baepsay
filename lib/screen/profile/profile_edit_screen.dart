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
import 'package:golden_balance_flutter/util/widget.dart';
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
          showToast(msg: '변경된 정보를 적용중입니다.');
        } else if (state is Compressing) {
          showToast(msg: '이미지 파일을 압축중입니다.');
        } else if (state is Uploaded) {
          showToast(msg: '프로필이 성공적으로 변경되었습니다.');
          Phoenix.rebirth(context);
        } else if (state is Error) {
          showToast(msg: '문제가 발생하였습니다.');
          Phoenix.rebirth(context);
        }
      },
      child: IgnorePointer(
        ignoring: !isScreenTouchable,
        child: Scaffold(
          appBar: AppBar(
            title: Text('프로필 편집'),
            elevation: 0,
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
                    showToast(msg: '프로필 이름을 작성해주세요');
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '프로필 사진',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    showToast(msg: '파일을 불러오는 중입니다.');
                                    await uploadMediaModel.setImageFile();
                                    setState(() {});
                                  },
                                  child: Text('편집'),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Builder(
                              builder: (context) {
                                if (authState.member.profilePhotoUrl != null &&
                                    uploadMediaModel.mediaFile == null) {
                                  return CircleAvatar(
                                    radius: 40.5,
                                    foregroundImage: CachedNetworkImageProvider(
                                      authState.member.profilePhotoUrl!,
                                    ),
                                    backgroundColor: Colors.white,
                                  );
                                }

                                if (uploadMediaModel.mediaFile != null) {
                                  return Container(
                                      height: 81,
                                      width: 81,
                                      child: Image.file(
                                        uploadMediaModel.mediaFile!,
                                        fit: BoxFit.cover,
                                      ));
                                }

                                return Container(
                                  color: Colors.grey,
                                  height: 81,
                                  width: 81,
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Divider(),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '이름',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                ),
                                SizedBox(
                                  width: 16.0,
                                ),
                                Expanded(
                                  child: Container(
                                    child: TextField(
                                      focusNode: myFocusNode,
                                      controller: _controller,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(),
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
