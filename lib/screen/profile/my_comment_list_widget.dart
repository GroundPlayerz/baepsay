import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/my_comment_cubit.dart';
import 'package:golden_balance_flutter/bloc/state/my_comment_state.dart';
import 'package:golden_balance_flutter/model/comment/comment.dart';
import 'package:golden_balance_flutter/screen/post/single_post_widget.dart';

class MyCommentListWidget extends StatefulWidget {
  @override
  _MyCommentListWidgetState createState() => _MyCommentListWidgetState();
}

class _MyCommentListWidgetState extends State<MyCommentListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<MyCommentCubit>(context).getInitialCommentList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCommentCubit, MyCommentState>(
        builder: (context, state) {
      if (state is Loaded) {
        if (state.commentList.isNotEmpty) {
          return RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<MyCommentCubit>(context).getInitialCommentList();
            },
            child: ListView.builder(
                itemCount: state.commentList.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index < state.commentList.length) {
                    final Comment comment = state.commentList[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SinglePostWidget(postId: comment.postId)));
                      },
                      child: Card(
                        color: Colors.green,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('댓글 내용: ' + comment.text),
                              Text('생성일: ' + comment.createdAt),
                            ]),
                      ),
                    );
                  }
                  if (!state.isLoadingMore && state.hasMore) {
                    BlocProvider.of<MyCommentCubit>(context).getCommentList();
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
