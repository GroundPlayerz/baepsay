import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/my_comment_cubit.dart';
import 'package:golden_balance_flutter/bloc/state/my_comment_state.dart';
import 'package:golden_balance_flutter/constant/color.dart';
import 'package:golden_balance_flutter/constant/spacings.dart';
import 'package:golden_balance_flutter/constant/textstyle.dart';
import 'package:golden_balance_flutter/model/comment/comment.dart';
import 'package:golden_balance_flutter/screen/error_screen.dart';
import 'package:golden_balance_flutter/screen/post/single_post_screen.dart';
import 'package:golden_balance_flutter/screen/post/single_post_screen.dart';

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
                shrinkWrap: true,
                itemCount: state.commentList.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index < state.commentList.length) {
                    final Comment comment = state.commentList[index];
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SinglePostWidget(postId: comment.postId)));
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            left: kListViewOuterHorizontalPadding,
                            right: kListViewOuterHorizontalPadding,
                            top: 17,
                            bottom: 0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: kListViewInnerHorizontalPadding),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      comment.text,
                                      style: kNoto14M.copyWith(fontSize: 15),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      comment.createdAt.split('T')[0],
                                      style: kNoto13R.copyWith(
                                          color: kGreyColor_999999),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      '-  ' + comment.postTitle,
                                      style: kNoto13R.copyWith(
                                          color: kGreyColor_767676),
                                    ),
                                    SizedBox(height: 14),
                                  ],
                                ),
                              ),
                              Divider()
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
          return Center(child: Text('투표한 어젠다에 의견을 작성해보세요'));
        }
      } else if (state is Error) {
        return ErrorScreen();
      } else if (state is Loading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return Container();
    });
  }
}
