import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/admin_feed_cubit.dart';
import 'package:golden_balance_flutter/bloc/cubit/auth_cubit.dart';
import 'package:golden_balance_flutter/bloc/state/admin_feed_state.dart';

class AdminFeedScreen extends StatefulWidget {
  @override
  _AdminFeedScreenState createState() => _AdminFeedScreenState();
}

class _AdminFeedScreenState extends State<AdminFeedScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<AuthCubit>(context).getAccessTokenByState();
    BlocProvider.of<AdminFeedCubit>(context).getInitialAdminFeed();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('관리자 게시물 피드'),
      ),
      //backgroundColor: Colors.white,
      body: BlocBuilder<AdminFeedCubit, AdminFeedState>(
          builder: (context, state) {
        if (state is Loaded) {
          if (state.feed.isNotEmpty) {
            return RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<AdminFeedCubit>(context).getInitialAdminFeed();
              },
              child: ListView.builder(
                  itemCount: state.feed.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index < state.feed.length) {
                      final post = state.feed[index];
                      return Card(
                        color: Colors.green,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(post.title),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text(post.firstContentText),
                                        Text(post.firstContentVoteCount
                                            .toString()),
                                      ],
                                    ),
                                    Text('vs'),
                                    Column(
                                      children: [
                                        Text(post.secondContentText),
                                        Text(post.secondContentVoteCount
                                            .toString()),
                                      ],
                                    ),
                                  ]),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(post.viewCount.toString() + ' views'),
                                  Text(post.likeCount.toString() + 'likes'),
                                  Text(post.score.toString() + 'score'),
                                  Text(post.createdAt)
                                ],
                              )
                            ]),
                      );
                    }
                    if (!state.isLoadingMore && state.hasMore) {
                      BlocProvider.of<AdminFeedCubit>(context).getAdminFeed();
                    }

                    if (state.hasMore) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Container();
                    }
                  }),
            );
          } else {
            return Center(child: Text('No Data'));
          }
        } else if (state is FeedError) {
          return Text(state.message);
        } else if (state is Loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container();
      }),
    );
  }
}
