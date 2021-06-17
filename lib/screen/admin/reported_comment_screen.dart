import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/auth_cubit.dart';
import 'package:golden_balance_flutter/bloc/cubit/reported_comment_cubit.dart';
import 'package:golden_balance_flutter/bloc/state/reported_comment_state.dart';
import 'package:golden_balance_flutter/screen/admin/comment_detail_report_screen.dart';

class ReportedCommentScreen extends StatefulWidget {
  @override
  _ReportedCommentScreenState createState() => _ReportedCommentScreenState();
}

class _ReportedCommentScreenState extends State<ReportedCommentScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<AuthCubit>(context).getAccessTokenByState().then((_) {
      BlocProvider.of<ReportedCommentCubit>(context)
          .getInitialReportedComment();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('신고된 의견'),
      ),
      body: BlocBuilder<ReportedCommentCubit, ReportedCommentState>(
        builder: (context, state) {
          if (state is Loaded) {
            if (state.feed.isNotEmpty) {
              return RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<ReportedCommentCubit>(context)
                      .getInitialReportedComment();
                },
                child: ListView.builder(
                    itemCount: state.feed.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index < state.feed.length) {
                        final comment = state.feed[index];
                        return GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CommentDetailReportScreen(
                                            commentId: comment.id)));
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  comment.text,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('신고 수: ' + comment.reportCount.toString()),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(comment.createdAt.split('T')[0]),
                                SizedBox(
                                  height: 5,
                                ),
                                Divider()
                              ],
                            ),
                          ),
                        );
                      }
                      if (!state.isLoadingMore && state.hasMore) {
                        BlocProvider.of<ReportedCommentCubit>(context)
                            .getReportedComment();
                      }

                      if (state.hasMore) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return Container();
                      }
                    }),
              );
            } else {
              return Center(child: Text('신고된 댓글이 없습니다.'));
            }
          } else if (state is Error) {
            return Center(child: Text(state.message));
          } else if (state is Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
