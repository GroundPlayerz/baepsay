import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/auth_cubit.dart';
import 'package:golden_balance_flutter/bloc/cubit/comment_screen_cubit.dart';
import 'package:golden_balance_flutter/bloc/state/auth_state.dart';
import 'package:golden_balance_flutter/bloc/state/comment_screen_state.dart';
import 'package:golden_balance_flutter/constant/color.dart';
import 'package:golden_balance_flutter/constant/textstyle.dart';

import 'comment_widget.dart';

class CommentScreen extends StatefulWidget {
  final int postId;
  final int postCommentCount;
  CommentScreen({required this.postId, required this.postCommentCount});
  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
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
                style: kNoto16R.copyWith(
                    fontSize: 14.0, color: kGreyColor1_767676),
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
              //Todo: 광고 영역
              Container(
                color: Colors.grey,
                width: MediaQuery.of(context).size.width,
                height: 75,
                child: Center(child: Text('광고 영역')),
              ),
              //SizedBox(height: 10),
              //댓글 업로드중 생기는 circularindicator
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
                          //height: 100,
                          //color: Colors.red,
                          //child: Text('아직 댓글이 없습니다.'),
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
                    print(commentScreenState.message);
                  } else if (commentScreenState
                      is CommentScreenInitialLoading) {
                    return CircularProgressIndicator();
                  }
                  return Text(commentScreenState.toString());
                },
              ),

              //댓글 입력 textfield
              Container(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, bottom: 5, top: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: kLightGreyColor_F4F4F4,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isTextFieldTapped = true;
                                });
                                FocusScope.of(context)
                                    .requestFocus(_myFocusNode);
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
                                    //scrollController: _scrollController,
                                    style: kCommentScreenTextFieldTextStyle,
                                    maxLength: 2200,
                                    minLines: 1,
                                    maxLines: null,
                                    decoration: InputDecoration(
                                      counterText: '',
                                      hintStyle:
                                          kCommentScreenTextFieldHintTextStyle,
                                      contentPadding: EdgeInsets.only(
                                          left: 18, top: 3, bottom: 3),
                                      hintText: '당신의 의견을 말해주세요..',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (_canPost) {
                                //Todo: 작성한 댓글 없애고, 업로드중엔 로딩 indicator 띄우기
                                setState(() {
                                  _isUploadingComment = true;
                                });
                                await BlocProvider.of<CommentScreenCubit>(
                                        context)
                                    .createComment(
                                        postId: postId,
                                        text: _textController.value.text);

                                _textController.clear();
                                _myFocusNode?.unfocus();
                                setState(() {
                                  _isUploadingComment = false;
                                });
                                //Todo: 업로드된 댓글 나타나는지 확인하기
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Opacity(
                                opacity: _canPost ? 1 : 0.4,
                                child: CircleAvatar(
                                  radius: 19,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
