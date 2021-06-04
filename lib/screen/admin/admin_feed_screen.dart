import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/admin_feed_cubit.dart';
import 'package:golden_balance_flutter/bloc/state/admin_feed_state.dart';

class AdminFeedScreen extends StatefulWidget {
  @override
  _AdminFeedScreenState createState() => _AdminFeedScreenState();
}

class _AdminFeedScreenState extends State<AdminFeedScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addListenerToScrollController(context);
    BlocProvider.of<AdminFeedCubit>(context).getInitialAdminFeed();
  }

  addListenerToScrollController(BuildContext context) {
    _scrollController.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.height * 0.20;
      if (maxScroll - currentScroll <= delta) {
        BlocProvider.of<AdminFeedCubit>(context).getAdminFeed();
      }
    });
  }

  _onScroll() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      BlocProvider.of<AdminFeedCubit>(context).getAdminFeed();
    }
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
        title: Text('Admin Screen'),
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
                  controller: _scrollController,
                  itemCount: state.feed.length,
                  itemBuilder: (BuildContext context, int index) {
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(post.viewCount.toString() + ' views'),
                                Text(post.likeCount.toString() + 'likes'),
                                Text(post.score.toString() + 'score'),
                                Text(post.createdAt)
                              ],
                            )
                          ]),
                    );
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
