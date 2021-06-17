import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/admin_feed_cubit.dart';
import 'package:golden_balance_flutter/bloc/cubit/auth_cubit.dart';
import 'package:golden_balance_flutter/bloc/state/admin_feed_state.dart';
import 'package:golden_balance_flutter/model/post/simple_post.dart';
import 'package:golden_balance_flutter/screen/post/single_post_widget.dart';

class AdminFeedScreen extends StatefulWidget {
  @override
  _AdminFeedScreenState createState() => _AdminFeedScreenState();
}

class _AdminFeedScreenState extends State<AdminFeedScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<AuthCubit>(context).getAccessTokenByState().then((_) {
      BlocProvider.of<AdminFeedCubit>(context).getInitialAdminFeed();
    });
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
        title: Text('관리자 어젠다 피드'),
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
                      final SimplePost post = state.feed[index];
                      return GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SinglePostWidget(postId: post.id)));
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('생성일자: ' +
                                        post.createdAt.split('T')[0]),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                        '점수: ' + post.score.toStringAsFixed(2)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Divider()
                              ]),
                        ),
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
