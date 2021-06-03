import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/nested_comment_screen_cubit.dart';
import 'package:golden_balance_flutter/constant/color.dart';
import 'package:golden_balance_flutter/constant/textstyle.dart';
import 'package:golden_balance_flutter/model/nested_comment/nested_comment.dart';

class NestedCommentWidget extends StatefulWidget {
  final int nestedCommentIndex;
  final NestedComment nestedComment;

  NestedCommentWidget(
      {required this.nestedCommentIndex, required this.nestedComment});
  @override
  _NestedCommentWidgetState createState() => _NestedCommentWidgetState();
}

class _NestedCommentWidgetState extends State<NestedCommentWidget> {
  //Todo: 나중에 실제 Comment에 맞게 바꾸기
  late NestedComment nestedComment;
  late int nestedCommentIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nestedComment = widget.nestedComment;
    nestedCommentIndex = widget.nestedCommentIndex;
  }

  String _createdOrUpdatedAt() {
    if (nestedComment.updatedAt == null) {
      return nestedComment.createdAt;
    } else {
      return nestedComment.updatedAt!;
    }
  }

  Widget _likeButton() => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            BlocProvider.of<NestedCommentScreenCubit>(context).pressLikeButton(
                nestedCommentIndex: nestedCommentIndex,
                userLikeCount: nestedComment.userLikeCount);
          });
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 16, top: 2),
          child: Column(
            children: [
              nestedComment.userLikeCount == 0
                  ? Icon(Icons.favorite_border_rounded,
                      size: 20, color: kWhiteColor.withOpacity(0.7))
                  : Icon(Icons.favorite_rounded,
                      size: 20, color: kAccentYellowColor),
              //SizedBox(width: 4),
              (nestedComment.userLikeCount == 0)
                  ? Text('')
                  : Text(nestedComment.likeCount.toString(),
                      style: kPostInfoNumberTextStyle.copyWith(
                          fontSize: 14.0,
                          color: Colors.white.withOpacity(0.7))),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  borderRadius: BorderRadius.circular(7.0), color: Colors.grey),
              child: nestedComment.profilePhotoUrl != null
                  ? Image.network(nestedComment.profilePhotoUrl!)
                  : Image.asset('images/default_profile_photo.png'),
            ),
            SizedBox(width: 11),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nestedComment.profileName + '  ' + _createdOrUpdatedAt(),
                  style: kCommentInfoTextStyle.copyWith(
                      color: kWhiteColor.withOpacity(0.7)),
                ),
                SizedBox(height: 4),
                Text(
                  nestedComment.text,
                  style: kCommentTextTextStyle,
                ),
              ],
            ),
          ],
        ),
        _likeButton(),
      ],
    );
  }
}
