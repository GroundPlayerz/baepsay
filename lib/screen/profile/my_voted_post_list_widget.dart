import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/my_voted_post_cubit.dart';
import 'package:golden_balance_flutter/bloc/state/my_voted_post_state.dart';
import 'package:golden_balance_flutter/model/post/simple_post.dart';
import 'package:golden_balance_flutter/screen/post/single_post_widget.dart';

class MyVotedPostListWidget extends StatefulWidget {
  @override
  _MyVotedPostListWidgetState createState() => _MyVotedPostListWidgetState();
}

class _MyVotedPostListWidgetState extends State<MyVotedPostListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<MyVotedPostCubit>(context).getInitialPostList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyVotedPostCubit, MyVotedPostState>(
        builder: (context, state) {
      if (state is Loaded) {
        if (state.postList.isNotEmpty) {
          return RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<MyVotedPostCubit>(context).getInitialPostList();
            },
            child: ListView.builder(
                itemCount: state.postList.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index < state.postList.length) {
                    final SimplePost post = state.postList[index];
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
                    BlocProvider.of<MyVotedPostCubit>(context).getPostList();
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
      } else if (state is Error) {
        return Text(state.message);
      } else if (state is Loading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return Container();
    });
  }
}