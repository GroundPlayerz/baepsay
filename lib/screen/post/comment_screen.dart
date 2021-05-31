import 'package:flutter/material.dart';
import 'package:golden_balance_flutter/constant/color.dart';
import 'package:golden_balance_flutter/constant/textstyle.dart';

import 'comment_widget.dart';

class CommentScreen extends StatefulWidget {
  final int postIndex;
  CommentScreen({required this.postIndex});
  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  late int postIndex;

  @override
  void initState() {
    super.initState();
    postIndex = widget.postIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 10,
        elevation: 0,
        title: Row(
          children: [
            Text('댓글  ', style: kNoto18B.copyWith(fontSize: 20.0)),
            Text('5', style: kSkia18B.copyWith(fontSize: 18.0)),
          ],
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
      body: ListView(
        children: [
          Container(
            color: Colors.white70,
            width: MediaQuery.of(context).size.width,
            height: 71,
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 6, bottom: 6),
            child: CommentWidget(
              authorProfileName: '잉카',
              authorProfilePhotoUrl: '',
              text: '그냥 둘다 안먹을게요',
              likeCount: 13,
              isLikeButtonPressed: false,
              nestedCommentCount: 2,
              createdAt: '7분',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 6, bottom: 6),
            child: CommentWidget(
              authorProfileName: '잉카',
              authorProfilePhotoUrl: '',
              text: '그냥 둘다 안먹을게요',
              likeCount: 13,
              isLikeButtonPressed: false,
              nestedCommentCount: 2,
              createdAt: '7분',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 6, bottom: 6),
            child: CommentWidget(
              authorProfileName: '기수범수방구',
              authorProfilePhotoUrl: '',
              text: '내 방구냄새는 지독하지',
              likeCount: 200,
              isLikeButtonPressed: true,
              nestedCommentCount: 0,
              createdAt: '7분',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 6, bottom: 6),
            child: CommentWidget(
              authorProfileName: '기수범수방구',
              authorProfilePhotoUrl: '',
              text: '내 방구냄새는 지독하지',
              likeCount: 200,
              isLikeButtonPressed: true,
              nestedCommentCount: 0,
              createdAt: '7분',
            ),
          ),
        ],
      ),
    );
  }
}
