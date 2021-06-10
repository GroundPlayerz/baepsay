import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/comment_screen_cubit.dart';
import 'package:golden_balance_flutter/bloc/state/comment_screen_state.dart';
import 'package:golden_balance_flutter/constant/color.dart';
import 'package:golden_balance_flutter/constant/textstyle.dart';
import 'package:golden_balance_flutter/model/comment/comment.dart';
import 'package:golden_balance_flutter/screen/post/nested_comment_screen.dart';

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
          padding: EdgeInsets.only(left: 8, right: 16, top: 2),
          child: Column(
            children: [
              comment.memberLikeCount == 0
                  ? Icon(Icons.favorite_border_rounded,
                      size: photoWidth, color: kWhiteColor.withOpacity(0.7))
                  : Icon(Icons.favorite_rounded,
                      size: photoWidth, color: kAccentPinkColor),
              //SizedBox(width: 4),
              (comment.likeCount == 0)
                  ? Text('')
                  : Text(comment.likeCount.toString(),
                      style: kPostInfoNumberTextStyleOld.copyWith(
                          fontSize: 14.0,
                          color: Colors.white.withOpacity(0.7))),
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
          children: [
            Row(
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
                          : Image.asset('images/default_profile_photo.png'),
                    ),
                    SizedBox(width: sizeboxWidthBetweenPhotoAndName),
                    SizedBox(
                      width:
                          MediaQuery.of(context).size.width - sumConstantsWidth,
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
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  //대댓 열기 버튼
                  comment.nestedCommentCount != 0
                      ? Padding(
                          padding: const EdgeInsets.only(right: 0.0),
                          child: GestureDetector(
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
                              padding: EdgeInsets.all(6.0),
                              child: Text(
                                '대댓 보기(' +
                                    comment.nestedCommentCount.toString() +
                                    ')',
                                style: kNestedCommentButtonsTextStyle.copyWith(
                                    color: kWhiteColor.withOpacity(0.6)),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(height: 0),
                  //대댓 쓰기 버튼
                  GestureDetector(
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
                      padding: EdgeInsets.all(6),
                      child: Text(
                        '대댓 쓰기',
                        style: kNestedCommentButtonsTextStyle.copyWith(
                            color: kWhiteColor.withOpacity(0.6)),
                      ),
                    ),
                  ),
                ],
              ),
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
