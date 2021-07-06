import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/nested_comment_screen_cubit.dart';
import 'package:golden_balance_flutter/model/nested_comment/nested_comment.dart';
import 'package:golden_balance_flutter/util/widget.dart';

class NestedCommentEditScreen extends StatefulWidget {
  final NestedComment nestedComment;
  final int nestedCommentIndex;

  const NestedCommentEditScreen(
      {required this.nestedComment, required this.nestedCommentIndex});

  @override
  _NestedCommentEditScreenState createState() =>
      _NestedCommentEditScreenState();
}

class _NestedCommentEditScreenState extends State<NestedCommentEditScreen> {
  late final NestedComment nestedComment;
  late final TextEditingController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nestedComment = widget.nestedComment;
    controller = TextEditingController(text: nestedComment.text);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('답글 수정하기'),
        actions: [
          TextButton(
            onPressed: () {
              if (controller.text.trim().isEmpty) {
                showToast(msg: '내용을 입력하세요');
              } else {
                BlocProvider.of<NestedCommentScreenCubit>(context)
                    .updateNestedComment(
                        nestedCommentIndex: widget.nestedCommentIndex,
                        text: controller.text.trim());
                Navigator.pop(context);
              }
            },
            child: Text('완료'),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          controller: controller,
          keyboardType: TextInputType.multiline,
          maxLines: 20,
        ),
      ),
    );
  }
}
