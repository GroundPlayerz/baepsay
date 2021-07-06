import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/my_voted_post_cubit.dart';
import 'package:golden_balance_flutter/bloc/state/my_voted_post_state.dart';
import 'package:golden_balance_flutter/constant/color.dart';
import 'package:golden_balance_flutter/constant/spacings.dart';
import 'package:golden_balance_flutter/constant/textstyle.dart';
import 'package:golden_balance_flutter/model/post/simple_post.dart';
import 'package:golden_balance_flutter/screen/post/single_post_screen.dart';

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
                shrinkWrap: true,
                itemCount: state.postList.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index < state.postList.length) {
                    final SimplePost post = state.postList[index];
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
                                      post.title,
                                      style: kNoto14M.copyWith(fontSize: 15),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      post.firstContentText +
                                          ', ' +
                                          post.secondContentText,
                                      style: kNoto13R.copyWith(
                                          color: kGreyColor_767676),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      post.createdAt.split('T')[0],
                                      style: kNoto13R.copyWith(
                                          color: kGreyColor_999999),
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
          return Center(child: Text('관심있는 어젠다에 투표하고 의견을 공유해보세요'));
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
