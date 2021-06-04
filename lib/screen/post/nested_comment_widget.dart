import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/nested_comment_screen_cubit.dart';
import 'package:golden_balance_flutter/bloc/state/nested_comment_screen_state.dart';
import 'package:golden_balance_flutter/constant/color.dart';
import 'package:golden_balance_flutter/constant/textstyle.dart';
import 'package:golden_balance_flutter/model/nested_comment/nested_comment.dart';

class NestedCommentWidget extends StatefulWidget {
  final int nestedCommentIndex;
  NestedCommentWidget({required this.nestedCommentIndex});
  @override
  _NestedCommentWidgetState createState() => _NestedCommentWidgetState();
}

class _NestedCommentWidgetState extends State<NestedCommentWidget> {
  //Todo: 나중에 실제 Comment에 맞게 바꾸기
  late int nestedCommentIndex;

  final double leftPadding = 16 + 31;
  final double photoWidth = 20;
  final double sizeboxWidthBetweenPhotoAndName = 11;
  final double sizeboxWidthBetweenTextAndLikeButton = 8;
  final double likebuttonWidth = 8 + 20 + 16;
  late double sumConstantsWidth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nestedCommentIndex = widget.nestedCommentIndex;

    sumConstantsWidth = leftPadding +
        photoWidth +
        sizeboxWidthBetweenPhotoAndName +
        sizeboxWidthBetweenTextAndLikeButton +
        likebuttonWidth;
  }

  String _createdOrUpdatedAt({required NestedComment nestedComment}) {
    if (nestedComment.updatedAt == null) {
      return nestedComment.createdAt;
    } else {
      return nestedComment.updatedAt!;
    }
  }

  Widget _likeButton({required NestedComment nestedComment}) => GestureDetector(
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
    return BlocBuilder<NestedCommentScreenCubit, NestedCommentScreenState>(
        builder: (context, state) {
      if (state is NestedCommentScreenLoaded) {
        NestedComment nestedComment =
            state.nestedCommentList[nestedCommentIndex];
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
                      child: nestedComment.profilePhotoUrl != null
                          ? Image.network(nestedComment.profilePhotoUrl!)
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
                            nestedComment.profileName +
                                '     ' +
                                _createdOrUpdatedAt(
                                        nestedComment: nestedComment)
                                    .split(' ')[0]
                                    .split('T')[0]
                                    .replaceAll('-', '/'),
                            style: kCommentInfoTextStyle.copyWith(
                                color: kWhiteColor.withOpacity(0.7)),
                          ),
                          SizedBox(height: 4),
                          Text(
                            nestedComment.text,
                            style: kCommentTextTextStyle,
                            softWrap: true,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                  ],
                ),
                _likeButton(nestedComment: nestedComment),
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
