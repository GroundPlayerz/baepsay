import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/reported_post_cubit.dart';
import 'package:golden_balance_flutter/bloc/state/reported_post_state.dart';
import 'package:golden_balance_flutter/screen/admin/post_report_screen.dart';

class ReportedPostScreen extends StatefulWidget {
  @override
  _ReportedPostScreenState createState() => _ReportedPostScreenState();
}

class _ReportedPostScreenState extends State<ReportedPostScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ReportedPostCubit>(context).getInitialReportedPost();
    addListenerToScrollController(context);
  }

  addListenerToScrollController(BuildContext context) {
    _scrollController.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.height * 0.20;
      if (maxScroll - currentScroll <= delta) {
        BlocProvider.of<ReportedPostCubit>(context).getReportedPost();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
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
                        controller: _scrollController,
                        itemCount: state.feed.length,
                        itemBuilder: (BuildContext context, int index) {
                          final post = state.feed[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PostReportScreen(postId: post.id)));
                            },
                            child: Card(
                              child: Column(
                                children: [
                                  Text(post.title),
                                  Text('신고 수: ' + post.reportCount.toString()),
                                ],
                              ),
                            ),
                          );
                        }));
              } else {
                return Center(child: Text('No Data'));
              }
            } else if (state is Error) {
              return Text(state.message);
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
