import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/auth_cubit.dart';
import 'package:golden_balance_flutter/bloc/cubit/comment_screen_cubit.dart';
import 'package:golden_balance_flutter/bloc/cubit/nested_comment_screen_cubit.dart';
import 'package:golden_balance_flutter/bloc/state/comment_screen_state.dart';
import 'package:golden_balance_flutter/bloc/state/nested_comment_screen_state.dart';
import 'package:golden_balance_flutter/constant/color.dart';
import 'package:golden_balance_flutter/constant/textstyle.dart';
import 'package:golden_balance_flutter/model/comment/comment.dart';
import 'package:golden_balance_flutter/screen/post/nested_comment_widget.dart';

class NestedCommentScreen extends StatefulWidget {
  final int commentIndex;
  final int commentId;
  const NestedCommentScreen({
    required this.commentIndex,
    required this.commentId,
  });
  @override
  _NestedCommentScreenState createState() => _NestedCommentScreenState();
}

class _NestedCommentScreenState extends State<NestedCommentScreen> {
  late int commentIndex;
  late int commentId;

  final double leftPadding = 16;
  final double photoWidth = 20;
  final double sizeboxWidthBetweenPhotoAndName = 11;
  final double sizeboxWidthBetweenTextAndLikeButton = 8;
  final double likebuttonWidth = 8 + 20 + 16;
  late double sumConstantsWidth;

  FocusNode? _myFocusNode;
  bool isTextFieldTapped = false;
  bool _canPost = false;

  bool _isUploadingNestedComment = false;
  final TextEditingController _textController = TextEditingController();

  void onTapOutsideOfTextField() {
    _myFocusNode?.unfocus();
    setState(() {
      isTextFieldTapped = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<AuthCubit>(context).getAccessTokenByState();
    commentIndex = widget.commentIndex;
    commentId = widget.commentId;

    sumConstantsWidth = leftPadding +
        photoWidth +
        sizeboxWidthBetweenPhotoAndName +
        sizeboxWidthBetweenTextAndLikeButton +
        likebuttonWidth;

    _myFocusNode = FocusNode();
    _textController.addListener(() {
      setState(() => _canPost = _textController.text.isNotEmpty);
    });

    BlocProvider.of<NestedCommentScreenCubit>(context).setEmptyState();
    BlocProvider.of<NestedCommentScreenCubit>(context)
        .getInitialNestedCommentList(commentId: commentId);
  }

  String _createdOrUpdatedAt({required Comment comment}) {
    if (comment.updatedAt == null) {
      return comment.createdAt;
    } else {
      return comment.updatedAt!;
    }
  }

  Widget _likeButton({required Comment comment}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            BlocProvider.of<CommentScreenCubit>(context).pressLikeButton(
              commentIndex: commentIndex,
              memberLikeCount: comment.memberLikeCount,
            );
          });
        },
        child: Padding(
          padding: EdgeInsets.only(left: 8, right: 16, top: 2),
          child: Column(
            children: [
              comment.memberLikeCount == 0
                  ? Icon(Icons.favorite_border_rounded,
                      size: photoWidth, color: kWhiteColor.withOpacity(0.7))
                  : Icon(Icons.favorite_rounded,
                      size: photoWidth, color: kAccentYellowColor),
              //SizedBox(width: 4),
              (comment.likeCount == 0)
                  ? Text('')
                  : Text(comment.likeCount.toString(),
                      style: kPostInfoNumberTextStyle.copyWith(
                          fontSize: 14.0,
                          color: Colors.white.withOpacity(0.7))),
            ],
          ),
        ),
      );

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
    return Scaffold(
      appBar: AppBar(
        title: Text('대댓', style: kNoto18B),
        centerTitle: false,
        titleSpacing: 0,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //로딩 circularindicator
            !_isUploadingNestedComment
                ? Container()
                : SizedBox(
                    width: 15,
                    height: 15,
                    child: CircularProgressIndicator(),
                  ),
            //divider
            Container(
              width: double.infinity,
              height: 1,
              color: kWhiteColor.withOpacity(0.3),
            ),
            //원래 댓글
            BlocBuilder<CommentScreenCubit, CommentScreenState>(
                builder: (context, state) {
              if (state is CommentScreenLoaded) {
                Comment comment = state.commentList[commentIndex];
                return Container(
                  color: kWhiteColor.withOpacity(0.1),
                  child: Padding(
                    padding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: Colors.grey),
                              child: comment.profilePhotoUrl != null
                                  ? Image.network(comment.profilePhotoUrl!)
                                  : Image.asset(
                                      'images/default_profile_photo.png'),
                            ),
                            SizedBox(width: sizeboxWidthBetweenPhotoAndName),
                            SizedBox(
                              width: MediaQuery.of(context).size.width -
                                  sumConstantsWidth,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    comment.profileName +
                                        '     ' +
                                        _createdOrUpdatedAt(comment: comment)
                                            .split(' ')[0]
                                            .split('T')[0]
                                            .replaceAll('-', '/'),
                                    style: kCommentInfoTextStyle.copyWith(
                                        color: kWhiteColor.withOpacity(0.7)),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    comment.text,
                                    style: kCommentTextTextStyle,
                                    softWrap: true,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 8),
                          ],
                        ),
                        _likeButton(comment: comment),
                      ],
                    ),
                  ),
                );
              } else {
                //Todo: 스켈레톤
                return Expanded(
                    child: Container(
                  color: Colors.red,
                ));
              }
            }),

            //divider
            Container(
              width: double.infinity,
              height: 1,
              color: kWhiteColor.withOpacity(0.3),
            ),

            //대댓글 listview
            BlocBuilder<NestedCommentScreenCubit, NestedCommentScreenState>(
              builder: (context, nestedCommentScreenState) {
                if (nestedCommentScreenState is NestedCommentScreenLoaded) {
                  if (nestedCommentScreenState.nestedCommentList.isEmpty) {
                    return Expanded(
                      child: Container(
                        //height: 100,
                        width: MediaQuery.of(context).size.width,
                        //color: Colors.red,
                        // child: Text('아직 댓글이 없습니다.'),
                      ),
                    );
                  }
                  return Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        BlocProvider.of<NestedCommentScreenCubit>(context)
                            .getInitialNestedCommentList(commentId: commentId);
                      },
                      child: ListView.builder(
                        itemCount:
                            nestedCommentScreenState.nestedCommentList.length +
                                1,
                        itemBuilder:
                            (BuildContext context, int nestedCommentIndex) {
                          if (nestedCommentIndex <
                              nestedCommentScreenState
                                  .nestedCommentList.length) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: 16 + 31,
                                  top: nestedCommentIndex == 0 ? 17 : 7,
                                  bottom: 13),
                              child: NestedCommentWidget(
                                  nestedCommentIndex: nestedCommentIndex),
                            );
                          }
                          if (!nestedCommentScreenState.isLoadingMore &&
                              nestedCommentScreenState.hasMore) {
                            BlocProvider.of<NestedCommentScreenCubit>(context)
                                .getNestedCommentList(commentId: commentId);
                          }

                          if (nestedCommentScreenState.hasMore) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            print(nestedCommentScreenState.hasMore);
                            return Container();
                          }
                        },
                      ),
                    ),
                  );
                } else if (nestedCommentScreenState
                    is NestedCommentScreenError) {
                  print(nestedCommentScreenState.message);
                } else if (nestedCommentScreenState
                    is NestedCommentScreenInitialLoading) {
                  return Expanded(
                    child: Container(
                      width: double.infinity,
                      child: Container(
                        width: 15,
                        height: 15,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                }
                return Text(nestedCommentScreenState.toString());
              },
            ),

            //대댓 작성 Textfield
            Container(
              //color: Colors.grey,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, bottom: 5, top: 5),
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
                                    hintText: '대댓글 쓰기..',
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
                                _isUploadingNestedComment = true;
                              });
                              await BlocProvider.of<NestedCommentScreenCubit>(
                                      context)
                                  .createNestedComment(
                                      commentId: commentId,
                                      text: _textController.value.text);

                              _textController.clear();
                              _myFocusNode?.unfocus();
                              setState(() {
                                _isUploadingNestedComment = false;
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
    );
  }
}
