// import 'package:flutter/material.dart';
// import 'package:golden_balance_flutter/constant/color.dart';
// import 'package:golden_balance_flutter/constant/textstyle.dart';
//
// import 'nested_comment_widget.dart';
//
// class NestedCommentShowingWidget extends StatefulWidget {
//   int nestedCommentCount;
//   NestedCommentShowingWidget({required this.nestedCommentCount});
//   @override
//   _NestedCommentShowingWidgetState createState() =>
//       _NestedCommentShowingWidgetState();
// }
//
// class _NestedCommentShowingWidgetState
//     extends State<NestedCommentShowingWidget> {
//   late int nestedCommentCount;
//   bool isNestedCommentShowed = false;
//
//   void pressShowNestedCommentButton() {
//     if (isNestedCommentShowed == false) {
//       setState(() {
//         isNestedCommentShowed = true;
//       });
//     } else {
//       setState(() {
//         isNestedCommentShowed = false;
//       });
//     }
//   }
//
//   Column _nestedCommentWidgetColumn() {
//     //Todo: DB에서 대댓글 불러오기
//     return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//       Padding(
//         padding: EdgeInsets.only(left: 0, top: 6, bottom: 6),
//         child: NestedCommentWidget(
//           authorProfileName: '대댓글 테스트 1',
//           authorProfilePhotoUrl: '',
//           text: '그냥 둘다 안먹을게요',
//           likeCount: 0,
//           isLikeButtonPressed: false,
//           createdAt: '7분',
//         ),
//       ),
//       Padding(
//         padding: EdgeInsets.only(left: 0, top: 6, bottom: 6),
//         child: NestedCommentWidget(
//           authorProfileName: '대댓글 테스트 2',
//           authorProfilePhotoUrl: '',
//           text: '그냥 둘다 안먹을게요',
//           likeCount: 0,
//           isLikeButtonPressed: false,
//           createdAt: '7분',
//         ),
//       ),
//     ]);
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     nestedCommentCount = widget.nestedCommentCount;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Widget _showOrCloseNestedCommentButton = GestureDetector(
//       onTap: () {
//         //Todo: 대댓글 창 열기
//         pressShowNestedCommentButton();
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(6),
//         child: !isNestedCommentShowed
//             ? Row(
//                 children: [
//                   Text(
//                     '대댓(' + nestedCommentCount.toString() + ')',
//                     style: kNestedCommentButtonsTextStyle.copyWith(
//                         color: kWhiteColor.withOpacity(0.6)),
//                   ),
//                   SizedBox(width: 2),
//                   Icon(
//                     Icons.keyboard_arrow_down_rounded,
//                     size: 15,
//                     color: kWhiteColor.withOpacity(0.6),
//                   ),
//                 ],
//               )
//             : Row(
//                 children: [
//                   Text(
//                     '접기',
//                     style: kNestedCommentButtonsTextStyle.copyWith(
//                         color: kWhiteColor.withOpacity(0.6)),
//                   ),
//                   SizedBox(width: 4),
//                   Icon(
//                     Icons.keyboard_arrow_up_rounded,
//                     size: 15,
//                     color: kWhiteColor.withOpacity(0.6),
//                   ),
//                 ],
//               ),
//       ),
//     );
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _showOrCloseNestedCommentButton,
//         !isNestedCommentShowed ? Container() : _nestedCommentWidgetColumn(),
//       ],
//     );
//   }
// }
