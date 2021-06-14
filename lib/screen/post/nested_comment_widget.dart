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
  //
  // Widget _likeButton({required NestedComment nestedComment}) => GestureDetector(
  //       behavior: HitTestBehavior.opaque,
  //       onTap: () {
  //         setState(() {
  //           BlocProvider.of<NestedCommentScreenCubit>(context).pressLikeButton(
  //               nestedCommentIndex: nestedCommentIndex,
  //               userLikeCount: nestedComment.memberLikeCount);
  //         });
  //       },
  //       child: Padding(
  //         padding: const EdgeInsets.only(left: 8, right: 16, top: 2),
  //         child: Column(
  //           children: [
  //             nestedComment.memberLikeCount == 0
  //                 ? Icon(Icons.favorite_border_rounded,
  //                     size: 20, color: kWhiteColor.withOpacity(0.7))
  //                 : Icon(Icons.favorite_rounded,
  //                     size: 20, color: kAccentPinkColor),
  //             //SizedBox(width: 4),
  //             (nestedComment.memberLikeCount == 0)
  //                 ? Text('')
  //                 : Text(nestedComment.likeCount.toString(),
  //                     style: kPostInfoNumberTextStyleOld.copyWith(
  //                         fontSize: 14.0,
  //                         color: Colors.white.withOpacity(0.7))),
  //           ],
  //         ),
  //       ),
  //     );

  Widget _likeButton({required NestedComment nestedComment}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            BlocProvider.of<NestedCommentScreenCubit>(context).pressLikeButton(
              nestedCommentIndex: nestedCommentIndex,
              userLikeCount: nestedComment.memberLikeCount,
            );
          });
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              nestedComment.memberLikeCount == 0
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
              (nestedComment.likeCount == 0)
                  ? Text('')
                  : Text(nestedComment.likeCount.toString(),
                      style: kCommentInfoTextStyle),
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
                            child: nestedComment.profilePhotoUrl != null
                                ? Image.network(
                                    nestedComment.profilePhotoUrl!,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    'images/default_profile_photo.png',
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          SizedBox(width: sizeboxWidthBetweenPhotoAndName),
                          Text(nestedComment.profileName + '     ',
                              style: kCommentInfoTextStyle),
                          Text(
                              _createdOrUpdatedAt(nestedComment: nestedComment)
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
                    nestedComment.text,
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
                _likeButton(nestedComment: nestedComment),
              ],
            ),
          ],
        );
        // return Column(
        //   children: [
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Row(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Container(
        //               width: 20,
        //               height: 20,
        //               clipBehavior: Clip.antiAlias,
        //               decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(7.0),
        //                   color: Colors.grey),
        //               child: nestedComment.profilePhotoUrl != null
        //                   ? Image.network(nestedComment.profilePhotoUrl!)
        //                   : Image.asset('images/default_profile_photo.png'),
        //             ),
        //             SizedBox(width: sizeboxWidthBetweenPhotoAndName),
        //             SizedBox(
        //               width:
        //                   MediaQuery.of(context).size.width - sumConstantsWidth,
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Text(
        //                     nestedComment.profileName +
        //                         '     ' +
        //                         _createdOrUpdatedAt(
        //                                 nestedComment: nestedComment)
        //                             .split(' ')[0]
        //                             .split('T')[0]
        //                             .replaceAll('-', '/'),
        //                     style: kCommentInfoTextStyle.copyWith(
        //                         color: kWhiteColor.withOpacity(0.7)),
        //                   ),
        //                   SizedBox(height: 4),
        //                   Text(
        //                     nestedComment.text,
        //                     style: kCommentTextTextStyle,
        //                     softWrap: true,
        //                   ),
        //                 ],
        //               ),
        //             ),
        //             SizedBox(width: 8),
        //           ],
        //         ),
        //         _likeButton(nestedComment: nestedComment),
        //       ],
        //     ),
        //   ],
        // );
      } else {
        //Todo: 스켈레톤
        return Container();
      }
    });
  }
}
