import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/auth_cubit.dart';
import 'package:golden_balance_flutter/bloc/cubit/comment_screen_cubit.dart';
import 'package:golden_balance_flutter/bloc/state/comment_screen_state.dart';
import 'package:golden_balance_flutter/constant/color.dart';
import 'package:golden_balance_flutter/constant/textstyle.dart';
import 'package:golden_balance_flutter/model/comment/comment.dart';
import 'package:golden_balance_flutter/screen/post/comment_report_screen.dart';
import 'package:golden_balance_flutter/screen/post/nested_comment_screen.dart';
import 'package:golden_balance_flutter/util/widget.dart';

class CommentWidget extends StatefulWidget {
  //Comment comment;
  int commentIndex;
  CommentWidget({required this.commentIndex});
  @override
  _CommentWidgetState createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  //Todo: 나중에 실제 Comment에 맞게 바꾸기
  // late Comment comment;
  late int commentIndex;

  final double leftPadding = 16;
  final double photoWidth = 20;
  final double sizeboxWidthBetweenPhotoAndName = 11;
  final double sizeboxWidthBetweenTextAndLikeButton = 8;
  final double likebuttonWidth = 8 + 20 + 16;
  late double sumConstantsWidth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    commentIndex = widget.commentIndex;

    sumConstantsWidth = leftPadding +
        photoWidth +
        sizeboxWidthBetweenPhotoAndName +
        sizeboxWidthBetweenTextAndLikeButton +
        likebuttonWidth;
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
  Widget _commentButton({required Comment comment}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NestedCommentScreen(
                        commentId: comment.id,
                        commentIndex: commentIndex,
                      )));
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Image.asset(
                'icons/post_screen_icon_comment@3x.png',
                color: kIconGreyColor_CBCBCB,
                height: 20,
              ),
              SizedBox(width: 10),
              (comment.nestedCommentCount == 0)
                  ? Text('')
                  : Text(comment.nestedCommentCount.toString() + '개 답글',
                      style: kCommentInfoTextStyle),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentScreenCubit, CommentScreenState>(
        builder: (context, state) {
      if (state is CommentScreenLoaded) {
        Comment comment = state.commentList[commentIndex];

        return Column(
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
                                shape: BoxShape.circle, color: Colors.grey),
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
                          SizedBox(width: sizeboxWidthBetweenPhotoAndName),
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
                              //Todo 다른사람 댓글이면 신고하기, 내 댓글이면 수정하기, 삭제하기 일단 요청을 보내고 프론트에서만 처리하기
                              int? currentMemberId =
                                  BlocProvider.of<AuthCubit>(context)
                                      .getMemberId();
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SafeArea(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ListTile(
                                            title: Text('신고하기'),
                                            leading: Icon(Icons.report),
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          CommentReportScreen(
                                                            commentId:
                                                                comment.id,
                                                          )));
                                            },
                                          ),
                                          comment.memberId == currentMemberId
                                              ? ListTile(
                                                  title: Text('삭제하기'),
                                                  leading: Icon(Icons.delete),
                                                  onTap: () {
                                                    showDeleteAlertDialog(
                                                        context,
                                                        title: '의견 삭제',
                                                        content:
                                                            '정말로 의견을 삭제하시겠습니까?',
                                                        onPressed: () {
                                                      BlocProvider.of<
                                                                  CommentScreenCubit>(
                                                              context)
                                                          .deleteComment(
                                                              commentIndex:
                                                                  commentIndex);
                                                    });
                                                  },
                                                )
                                              : Container(),
                                          comment.memberId == currentMemberId
                                              ? ListTile(
                                                  title: Text('수정하기'),
                                                  leading: Icon(Icons.edit),
                                                  onTap: () {},
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    );
                                  });
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
                _commentButton(comment: comment),
              ],
            ),
          ],
        );
      } else {
        //Todo: 스켈레톤
        return Container();
      }
    });
  }
}
