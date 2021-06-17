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
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              comment.memberLikeCount == 0
                  ? Image.asset(
                      'icons/post_screen_icon_like_default@3x.png',
                      color: kIconGreyColor_CBCBCB,
                      width: 22,
                    )
                  : Image.asset(
                      'icons/post_screen_icon_like_pressed@3x.png',
                      color: kAccentPinkColor,
                      width: 22,
                    ),
              SizedBox(width: 10),
              (comment.likeCount == 0)
                  ? Text('')
                  : Text(comment.likeCount.toString(),
                      style: kCommentInfoTextStyle),
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
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        title: Text('답글', style: kNoto16R),
        centerTitle: true,
        titleSpacing: 0,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0.5),
          child: Divider(),
        ),
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
            //원래 댓글
            BlocBuilder<CommentScreenCubit, CommentScreenState>(
                builder: (context, state) {
              if (state is CommentScreenLoaded) {
                Comment comment = state.commentList[commentIndex];
                return Container(
                  color: kBackgroundGreyColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 0),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 24,
                                      height: 24,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey),
                                      child: comment.profilePhotoUrl != null
                                          ? Image.network(
                                              comment.profilePhotoUrl!,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.asset(
                                              'images/default_profile_photo.png',
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                    SizedBox(
                                        width: sizeboxWidthBetweenPhotoAndName),
                                    Text(comment.profileName + '     ',
                                        style: kCommentInfoTextStyle),
                                    Text(
                                        _createdOrUpdatedAt(comment: comment)
                                            .split(' ')[0]
                                            .split('T')[0]
                                            .replaceAll('-', '.'),
                                        style: kCommentInfoTextStyle.copyWith(
                                            color: kGreyColor2_999999)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    //더보기 버튼
                                    GestureDetector(
                                      onTap: () {
                                        //Todo
                                      },
                                      behavior: HitTestBehavior.opaque,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 13, horizontal: 10),
                                        child: SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: Icon(
                                            Icons.more_horiz_sharp,
                                            color: kIconGreyColor_CBCBCB,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 3),
                            Text(
                              comment.text,
                              style: kCommentTextTextStyle,
                              softWrap: true,
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          _likeButton(comment: comment),
                        ],
                      ),
                    ],
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
            Divider(),

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
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                children: [
                                  NestedCommentWidget(
                                      nestedCommentIndex: nestedCommentIndex),
                                  Divider(indent: 20),
                                ],
                              ),
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
                      child: Center(
                        child: Container(
                          width: 15,
                          height: 15,
                          child: CircularProgressIndicator(),
                        ),
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
    );
  }
}
