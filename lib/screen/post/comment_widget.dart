import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_balance_flutter/constant/color.dart';
import 'package:golden_balance_flutter/constant/textstyle.dart';

import 'nested_comment_showing_widget.dart';

class CommentWidget extends StatefulWidget {
  // Todo: 바꾸기
  final String authorProfileName;
  final String authorProfilePhotoUrl;
  final String text;
  int likeCount;
  bool isLikeButtonPressed = false;
  int nestedCommentCount;

  late final String createdAt;
  late final String? updatedAt;

  CommentWidget({
    required this.authorProfileName,
    required this.authorProfilePhotoUrl,
    required this.text,
    required this.likeCount,
    required this.isLikeButtonPressed,
    required this.nestedCommentCount,
    required this.createdAt,
    this.updatedAt = '',
  });
  @override
  _CommentWidgetState createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  //Todo: 나중에 실제 Comment에 맞게 바꾸기
  late final String authorProfileName;
  late final String? authorProfilePhotoUrl;
  late final String text;
  late int likeCount;
  late bool isLikeButtonPressed;
  late int nestedCommentCount;
  late final String createdAt;
  late final String? updatedAt;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authorProfileName = widget.authorProfileName;
    authorProfilePhotoUrl = widget.authorProfilePhotoUrl;
    text = widget.text;
    likeCount = widget.likeCount;
    isLikeButtonPressed = widget.isLikeButtonPressed;
    nestedCommentCount = widget.nestedCommentCount;

    createdAt = widget.createdAt;
    updatedAt = widget.updatedAt;
  }

  String _createdOrUpdatedAt() {
    if (updatedAt == null) {
      return createdAt;
    } else {
      return updatedAt!;
    }
  }

  Widget _likeButton() => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            if (!isLikeButtonPressed) {
              setState(() {
                likeCount++;
              });
              isLikeButtonPressed = true;
              //ToDo: 좋아요 누른거 DB와 연동
            } else {
              likeCount--;
              isLikeButtonPressed = false;
              //ToDo: 좋아요 누른거 DB와 연동
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 16, top: 2),
          child: Column(
            children: [
              !isLikeButtonPressed
                  ? Icon(Icons.favorite_border_rounded,
                      size: 20, color: kWhiteColor.withOpacity(0.7))
                  : Icon(Icons.favorite_rounded,
                      size: 20, color: kAccentYellowColor),
              //SizedBox(width: 4),
              (likeCount == 0)
                  ? Text('')
                  : Text(likeCount.toString(),
                      style: kPostInfoNumberTextStyle.copyWith(
                          fontSize: 14.0,
                          color: Colors.white.withOpacity(0.7))),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
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
                  child: authorProfilePhotoUrl != null
                      ? Image.network(authorProfilePhotoUrl!)
                      : Image.asset('images/default_profile_photo.png'),
                ),
                SizedBox(width: 11),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      authorProfileName + '  ' + _createdOrUpdatedAt(),
                      style: kCommentInfoTextStyle.copyWith(
                          color: kWhiteColor.withOpacity(0.7)),
                    ),
                    SizedBox(height: 4),
                    Text(
                      text,
                      style: kCommentTextTextStyle,
                    ),
                  ],
                ),
              ],
            ),
            _likeButton(),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Row(
            children: [
              //대댓 열기 버튼
              nestedCommentCount != 0
                  ? Padding(
                      padding: const EdgeInsets.only(right: 0.0),
                      child: NestedCommentShowingWidget(
                        nestedCommentCount: nestedCommentCount,
                      ),
                    )
                  : SizedBox(height: 0),
              //대댓 쓰기 버튼
              GestureDetector(
                onTap: () {},
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
  }
}
