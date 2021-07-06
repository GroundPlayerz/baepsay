import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/auth_cubit.dart';
import 'package:golden_balance_flutter/bloc/cubit/comment_screen_cubit.dart';
import 'package:golden_balance_flutter/bloc/state/comment_screen_state.dart';
import 'package:golden_balance_flutter/configuration.dart';
import 'package:golden_balance_flutter/constant/color.dart';
import 'package:golden_balance_flutter/constant/textstyle.dart';
import 'package:golden_balance_flutter/screen/error_screen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'comment_widget.dart';

class CommentScreen extends StatefulWidget {
  final int postId;
  final int postCommentCount;
  CommentScreen({required this.postId, required this.postCommentCount});
  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  BannerAd? banner;
  late int postId;
  late int postCommentCount;
  FocusNode? _myFocusNode;
  bool isTextFieldTapped = false;
  bool _canPost = false;

  bool _isUploadingComment = false;
  bool isLoadingMore = false;
  final TextEditingController _textController = TextEditingController();

  void onTapOutsideOfTextField() {
    _myFocusNode?.unfocus();
    setState(() {
      isTextFieldTapped = false;
    });
  }

  @override
  void initState() {
    super.initState();
    postCommentCount = widget.postCommentCount;
    _myFocusNode = FocusNode();
    _textController.addListener(() {
      setState(() => _canPost = _textController.text.isNotEmpty);
    });
    postId = widget.postId;
    BlocProvider.of<AuthCubit>(context).getAccessTokenByState().then((_) {
      BlocProvider.of<CommentScreenCubit>(context).setEmptyState();
      BlocProvider.of<CommentScreenCubit>(context)
          .getInitialCommentList(postId: postId);
    });
    banner = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: Platform.isIOS ? iosUnitId : androidUnitId,
      listener: BannerAdListener(),
      request: AdRequest(),
    )..load();
  }

  Widget _textField({required String hintText, required onTap}) {
    return Column(
      children: [
        Divider(),
        Container(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 0, bottom: 5, top: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isTextFieldTapped = true;
                      });
                      FocusScope.of(context).requestFocus(_myFocusNode);
                    },
                    child: Container(
                      constraints: BoxConstraints(maxHeight: 100),
                      color: Colors.transparent,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        reverse: true,
                        child: TextField(
                          focusNode: _myFocusNode,
                          controller: _textController,
                          keyboardType: TextInputType.multiline,
                          style: kCommentScreenTextFieldTextStyle,
                          maxLength: 2200,
                          minLines: 1,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: hintText,
                            hintStyle: kCommentScreenTextFieldHintTextStyle
                                .copyWith(fontWeight: FontWeight.w500),
                            contentPadding:
                                EdgeInsets.only(left: 0, top: 5, bottom: 5),
                            counterText: '',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Opacity(
                      opacity: _canPost ? 1 : 0.4,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: kAccentPinkColor,
                        child: Icon(Icons.arrow_upward_rounded,
                            color: kWhiteColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textController.dispose();
    _myFocusNode?.unfocus();
    _myFocusNode?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapOutsideOfTextField();
      },
      child: Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          backgroundColor: kWhiteColor,
          automaticallyImplyLeading: false,
          centerTitle: false,
          titleSpacing: 20,
          elevation: 0,
          title: BlocBuilder<CommentScreenCubit, CommentScreenState>(
            builder: (context, commentScreenState) {
              if (commentScreenState is CommentScreenLoaded) {
                return Row(
                  children: [
                    Text('의견 ', style: kCommentAppBarTextStyle),
                    Text('(' + postCommentCount.toString() + ')',
                        style: kCommentAppBarSmallTextStyle),
                  ],
                );
              } else if (commentScreenState is CommentScreenError) {
                return Text('...', style: kCommentAppBarTextStyle);
                //print(commentScreenState.message);
              } else if (commentScreenState is CommentScreenInitialLoading) {
                return Text('...', style: kCommentAppBarTextStyle);
              }
              return Text('...', style: kCommentAppBarTextStyle);
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                '닫기',
                style:
                    kNoto16R.copyWith(fontSize: 14.0, color: kGreyColor_767676),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0.5),
            child: Divider(),
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: banner!.size.height.toDouble(),
                child: banner == null
                    ? Container()
                    : AdWidget(
                        ad: banner!,
                      ),
              ),
              !_isUploadingComment
                  ? Container()
                  : SizedBox(
                      width: 15,
                      height: 15,
                      child: CircularProgressIndicator(),
                    ),
              BlocBuilder<CommentScreenCubit, CommentScreenState>(
                builder: (context, commentScreenState) {
                  if (commentScreenState is CommentScreenLoaded) {
                    if (commentScreenState.commentList.isEmpty) {
                      return Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                        ),
                      );
                    }
                    return Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          BlocProvider.of<CommentScreenCubit>(context)
                              .getInitialCommentList(postId: postId);
                        },
                        child: ListView.builder(
                          itemCount: commentScreenState.commentList.length + 1,
                          itemBuilder:
                              (BuildContext context, int commentIndex) {
                            if (commentIndex <
                                commentScreenState.commentList.length) {
                              return Column(
                                children: [
                                  CommentWidget(
                                    commentIndex: commentIndex,
                                  ),
                                  Divider(indent: 20),
                                ],
                              );
                            }

                            if (!commentScreenState.isLoadingMore &&
                                commentScreenState.hasMore) {
                              BlocProvider.of<CommentScreenCubit>(context)
                                  .getCommentList(postId: postId);
                            }

                            if (commentScreenState.hasMore) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ),
                    );
                  } else if (commentScreenState is CommentScreenError) {
                    return ErrorScreen();
                  } else if (commentScreenState
                      is CommentScreenInitialLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
              _textField(
                hintText: '당신의 의견을 말해주세요..',
                onTap: () async {
                  if (_canPost) {
                    setState(() {
                      _isUploadingComment = true;
                    });
                    await BlocProvider.of<CommentScreenCubit>(context)
                        .createComment(
                            postId: postId, text: _textController.value.text);

                    _textController.clear();
                    _myFocusNode?.unfocus();
                    setState(() {
                      _isUploadingComment = false;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
