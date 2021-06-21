import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/auth_cubit.dart';
import 'package:golden_balance_flutter/bloc/cubit/my_post_cubit.dart';
import 'package:golden_balance_flutter/bloc/state/my_post_state.dart';
import 'package:golden_balance_flutter/constant/color.dart';
import 'package:golden_balance_flutter/model/post/simple_post.dart';
import 'package:golden_balance_flutter/screen/post/single_post_screen.dart';
import 'package:golden_balance_flutter/screen/post/single_post_screen.dart';
import 'package:golden_balance_flutter/util/widget.dart';

class MyPostListWidget extends StatefulWidget {
  @override
  _MyPostListWidgetState createState() => _MyPostListWidgetState();
}

class _MyPostListWidgetState extends State<MyPostListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<AuthCubit>(context).getAccessTokenByState().then((_) {
      BlocProvider.of<MyPostCubit>(context).getInitialPostList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyPostCubit, MyPostState>(builder: (context, state) {
      if (state is Loaded) {
        if (state.postList.isNotEmpty) {
          return RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<MyPostCubit>(context).getInitialPostList();
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
                          padding: EdgeInsets.all(10),
                          child: Column(children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                        Text(post.createdAt.split('T')[0]),
                                      ]),
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.more_vert_sharp,
                                      color: kIconGreyColor_CBCBCB,
                                    ),
                                    onPressed: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Builder(builder: (context) {
                                                  return ListTile(
                                                    onTap: () {
                                                      showDeleteAlertDialog(
                                                          context,
                                                          title: '어젠다 삭제',
                                                          content:
                                                              '정말로 어젠다를 삭제하시겠습니까?',
                                                          onPressed: () {
                                                        Navigator.pop(context);
                                                        BlocProvider.of<
                                                                    MyPostCubit>(
                                                                context)
                                                            .deletePost(
                                                                postIndex:
                                                                    index);
                                                      });
                                                    },
                                                    leading: Icon(Icons.delete),
                                                    title: Text('삭제하기'),
                                                  );
                                                }),
                                              ],
                                            );
                                          });
                                    }),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Divider()
                          ])),
                    );
                  }
                  if (!state.isLoadingMore && state.hasMore) {
                    BlocProvider.of<MyPostCubit>(context).getPostList();
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
          return Center(child: Text('어젠다를 업로드하고 의견을 공유해보세요'));
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
