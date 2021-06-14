import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/admin_scoring_cubit.dart';
import 'package:golden_balance_flutter/bloc/state/admin_scoring_state.dart';
import 'package:golden_balance_flutter/screen/admin/admin_feed_screen.dart';
import 'package:golden_balance_flutter/screen/admin/reported_comment_screen.dart';
import 'package:golden_balance_flutter/screen/admin/reported_nested_comment_screen.dart';
import 'package:golden_balance_flutter/screen/admin/reported_post_screen.dart';

class AdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('관리자 페이지'),
      ),
      body: ListView(
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdminFeedScreen()));
            },
            child: Text('게시물 리스트'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReportedPostScreen()));
            },
            child: Text('신고된 게시물'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReportedCommentScreen()));
            },
            child: Text('신고된 댓글'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReportedNestedCommentScreen()));
            },
            child: Text('신고된 대댓글'),
          ),
          TextButton(
              onPressed: () {
                BlocProvider.of<AdminScoringCubit>(context).scorePost();
              },
              child: Text('게시물 스코어링')),
          BlocBuilder<AdminScoringCubit, AdminScoringState>(
              builder: (context, state) {
            if (state is Processing) {
              return CircularProgressIndicator();
            } else if (state is Complete) {
              return Text(state.scoringPostCount.toString());
            } else if (state is Error) {
              return Text(state.message);
            }
            return Container();
          })
        ],
      ),
    );
  }
}
