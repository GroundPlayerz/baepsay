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
            child: Text('모든 어젠다 확인하기'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReportedPostScreen()));
            },
            child: Text('신고된 어젠다'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReportedCommentScreen()));
            },
            child: Text('신고된 의견'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReportedNestedCommentScreen()));
            },
            child: Text('신고된 답글'),
          ),
          TextButton(
              onPressed: () {
                BlocProvider.of<AdminScoringCubit>(context).scorePost();
              },
              child: Text('어젠다 스코어링')),
          BlocBuilder<AdminScoringCubit, AdminScoringState>(
              builder: (context, state) {
            if (state is Processing) {
              return Center(child: CircularProgressIndicator());
            } else if (state is Complete) {
              return Center(
                  child: Text('총 어젠다 수: ' + state.scoringPostCount.toString()));
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
