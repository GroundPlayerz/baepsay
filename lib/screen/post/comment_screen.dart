import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/comment_screen_cubit.dart';
import 'package:golden_balance_flutter/bloc/state/comment_screen_state.dart';
import 'package:golden_balance_flutter/constant/color.dart';
import 'package:golden_balance_flutter/constant/textstyle.dart';
import 'package:golden_balance_flutter/model/post/post.dart';
import 'package:golden_balance_flutter/repository/post_repository.dart';
import 'package:golden_balance_flutter/repository/user_repository.dart';

import 'comment_widget.dart';

class CommentScreen extends StatefulWidget {
  final int postId;
  CommentScreen({required this.postId});
  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  FocusNode? myFocusNode;
  bool isTextFieldTapped = false;
  bool _canPost = false;

  bool _isUploadingComment = false;
  final TextEditingController _textController = TextEditingController();

  late int postId;

  void onTapOutsideOfTextField() {
    myFocusNode?.unfocus();
    setState(() {
      isTextFieldTapped = false;
    });
  }

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    _textController.addListener(() {
      setState(() => _canPost = _textController.text.isNotEmpty);
    });

    postId = widget.postId;
    BlocProvider.of<CommentScreenCubit>(context).setEmptyState();
    BlocProvider.of<CommentScreenCubit>(context).getCommentList(postId: postId);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textController.dispose();
    myFocusNode?.unfocus();
    myFocusNode?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapOutsideOfTextField();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 10,
          elevation: 0,
          title: BlocBuilder<CommentScreenCubit, CommentScreenState>(
            builder: (context, commentScreenState) {
              if (commentScreenState is Loaded) {
                return Row(
                  children: [
                    Text('댓글  ', style: kNoto18B.copyWith(fontSize: 20.0)),
                    Text(commentScreenState.commentList.length.toString(),
                        style: kSkia18B.copyWith(fontSize: 18.0)),
                  ],
                );
              } else if (commentScreenState is CommentPageError) {
                print(commentScreenState.message);
              } else if (commentScreenState is Loading) {
                return Text('댓글  ', style: kNoto18B.copyWith(fontSize: 20.0));
              }
              return Text(commentScreenState.toString());
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
                    fontSize: 14.0, color: kWhiteColor.withOpacity(0.7)),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Todo: 광고 영역
              Container(
                color: Colors.white54,
                width: MediaQuery.of(context).size.width,
                height: 75,
                child: Center(child: Text('광고 영역')),
              ),
              SizedBox(height: 10),
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
                  if (commentScreenState is Loaded) {
                    if (commentScreenState.commentList.length == 0) {
                      return Expanded(
                        child: Container(
                          //height: 100,
                          width: MediaQuery.of(context).size.width,
                          //color: Colors.red,
                          //child: Text('아직 댓글이 없습니다.'),
                        ),
                      );
                    }
                    return Expanded(
                      child: ListView.builder(
                        itemCount: commentScreenState.commentList.length,
                        itemBuilder: (BuildContext context, int commentIndex) {
                          return Padding(
                            padding:
                                EdgeInsets.only(left: 16, top: 7, bottom: 7),
                            child: CommentWidget(
                              commentIndex: commentIndex,
                            ),
                          );
                        },
                      ),
                    );
                  } else if (commentScreenState is CommentPageError) {
                    print(commentScreenState.message);
                  } else if (commentScreenState is Loading) {
                    return CircularProgressIndicator();
                  }
                  return Text(commentScreenState.toString());
                },
              ),

              //댓글 입력 textfield
              Container(
                //color: Colors.grey,
                child: SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
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
                                    .requestFocus(myFocusNode);
                              },
                              child: Container(
                                constraints: BoxConstraints(maxHeight: 150),
                                color: Colors.transparent,
                                child: IgnorePointer(
                                  child: TextField(
                                    maxLength: 2200,
                                    focusNode: myFocusNode,
                                    controller: _textController,
                                    keyboardType: TextInputType.multiline,
                                    minLines: 1,
                                    maxLines: null,
                                    decoration: InputDecoration(
                                      counterText: '',
                                      hintStyle:
                                          kCommentScreenTextFieldHintTextStyle,
                                      contentPadding: EdgeInsets.only(
                                          left: 18, top: 0, bottom: 0),
                                      hintText: '댓글 쓰기',
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
                                myFocusNode?.unfocus();
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
                                  backgroundColor: kAccentYellowColor,
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
