import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/nested_comment_screen_cubit.dart';
import 'package:golden_balance_flutter/bloc/state/nested_comment_screen_state.dart';
import 'package:golden_balance_flutter/constant/textstyle.dart';
import 'package:golden_balance_flutter/model/comment/comment.dart';
import 'package:golden_balance_flutter/screen/post/nested_comment_widget.dart';

class NestedCommentScreen extends StatefulWidget {
  final Comment comment;
  const NestedCommentScreen({required this.comment});
  @override
  _NestedCommentScreenState createState() => _NestedCommentScreenState();
}

class _NestedCommentScreenState extends State<NestedCommentScreen> {
  late Comment comment;
  bool _isUploadingNestedComment = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    comment = widget.comment;
    BlocProvider.of<NestedCommentScreenCubit>(context).setEmptyState();
    BlocProvider.of<NestedCommentScreenCubit>(context)
        .getNestedCommentList(commentId: comment.id);
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
        title: Text('대댓', style: kNoto18B.copyWith(fontSize: 20.0)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              !_isUploadingNestedComment
                  ? Container()
                  : SizedBox(
                      width: 15,
                      height: 15,
                      child: CircularProgressIndicator(),
                    ),
              BlocBuilder<NestedCommentScreenCubit, NestedCommentScreenState>(
                builder: (context, nestedCommentScreenState) {
                  if (nestedCommentScreenState is Loaded) {
                    return Expanded(
                      child: ListView.builder(
                        // scrollDirection: Axis.vertical,
                        itemCount:
                            nestedCommentScreenState.nestedCommentList.length,
                        itemBuilder:
                            (BuildContext context, int nestedCommentIndex) {
                          return NestedCommentWidget(
                            nestedComment: nestedCommentScreenState
                                .nestedCommentList[nestedCommentIndex],
                            nestedCommentIndex: nestedCommentIndex,
                          );
                        },
                      ),
                    );
                  } else if (nestedCommentScreenState
                      is NestedCommentPageError) {
                    print(nestedCommentScreenState.message);
                  } else if (nestedCommentScreenState is Loading) {
                    return Text('스켈레톤');
                  }
                  return Text(nestedCommentScreenState.toString());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
