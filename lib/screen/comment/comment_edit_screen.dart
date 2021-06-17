import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/comment_screen_cubit.dart';
import 'package:golden_balance_flutter/model/comment/comment.dart';
import 'package:golden_balance_flutter/util/widget.dart';

class CommentEditScreen extends StatefulWidget {
  final Comment comment;
  final int commentIndex;

  const CommentEditScreen({required this.comment, required this.commentIndex});

  @override
  _CommentEditScreenState createState() => _CommentEditScreenState();
}

class _CommentEditScreenState extends State<CommentEditScreen> {
  late final Comment comment;
  late final TextEditingController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    comment = widget.comment;
    controller = TextEditingController(text: comment.text);
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
        title: Text('의견 수정하기'),
        actions: [
          TextButton(
            onPressed: () {
              if (controller.text.trim().isEmpty) {
                showToast(msg: '내용을 입력하세요');
              } else {
                BlocProvider.of<CommentScreenCubit>(context).updateComment(
                    commentIndex: widget.commentIndex,
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
            border: OutlineInputBorder(),
          ),
          controller: controller,
          keyboardType: TextInputType.multiline,
          maxLines: 20,
        ),
      ),
    );
  }
}
