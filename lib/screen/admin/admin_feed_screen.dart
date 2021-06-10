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
                      final SimplePost post = state.feed[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SinglePostWidget(postId: post.id)));
                        },
                        child: Card(
                          color: Colors.green,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('제목: ' + post.title),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(post.firstContentText),
                                      Text('vs'),
                                      Text(post.secondContentText),
                                    ]),
                                Text('생성일: ' + post.createdAt),
                                Text('점수: ' + post.score.toString()),
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
