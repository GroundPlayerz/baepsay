import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/auth_cubit.dart';
import 'package:golden_balance_flutter/bloc/cubit/reported_post_cubit.dart';
import 'package:golden_balance_flutter/bloc/state/reported_post_state.dart';
import 'package:golden_balance_flutter/screen/admin/post_detail_report_screen.dart';

class ReportedPostScreen extends StatefulWidget {
  @override
  _ReportedPostScreenState createState() => _ReportedPostScreenState();
}

class _ReportedPostScreenState extends State<ReportedPostScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<AuthCubit>(context).getAccessTokenByState().then((_) {
      BlocProvider.of<ReportedPostCubit>(context).getInitialReportedPost();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('신고된 게시물'),
        ),
        body: BlocBuilder<ReportedPostCubit, ReportedPostState>(
          builder: (context, state) {
            if (state is Loaded) {
              if (state.feed.isNotEmpty) {
                return RefreshIndicator(
                  onRefresh: () async {
                    BlocProvider.of<ReportedPostCubit>(context)
                        .getInitialReportedPost();
                  },
                  child: ListView.builder(
                      itemCount: state.feed.length + 1,
                      itemBuilder: (BuildContext context, int index) {
                        if (index < state.feed.length) {
                          final post = state.feed[index];
                          return GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PostDetailReportScreen(
                                              postId: post.id)));
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      post.title,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      post.firstContentText +
                                          ', ' +
                                          post.secondContentText,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Colors.grey),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text('생성일자: ' +
                                            post.createdAt.split('T')[0]),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('점수: ' + post.score.toString()),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('신고수: ' +
                                            post.reportCount.toString()),
                                      ],
                                    ),
                                    Divider()
                                  ]),
                            ),
                          );
                        }

                        if (!state.isLoadingMore && state.hasMore) {
                          BlocProvider.of<ReportedPostCubit>(context)
                              .getReportedPost();
                        }

                        if (state.hasMore) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return Container();
                        }
                      }),
                );
              } else {
                return Center(child: Text('신고된 게시물이 없습니다.'));
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
        ));
  }
}
