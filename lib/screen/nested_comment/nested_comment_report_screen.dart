import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:golden_balance_flutter/bloc/cubit/report_cubit.dart';
import 'package:golden_balance_flutter/bloc/state/report_state.dart';
import 'package:golden_balance_flutter/repository/member_repository.dart';
import 'package:golden_balance_flutter/screen/home/home_screen.dart';
import 'package:golden_balance_flutter/util/widget.dart';

class NestedCommentReportScreen extends StatefulWidget {
  final int nestedCommentId;

  const NestedCommentReportScreen({required this.nestedCommentId});

  @override
  _NestedCommentReportScreenState createState() =>
      _NestedCommentReportScreenState();
}

class _NestedCommentReportScreenState extends State<NestedCommentReportScreen> {
  final TextEditingController controller = TextEditingController();
  late final nestedCommentId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nestedCommentId = widget.nestedCommentId;
    BlocProvider.of<ReportCubit>(context).setDefaultState();
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
        title: Text('답글 신고하기'),
        actions: [
          TextButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  BlocProvider.of<ReportCubit>(context).reportNestedComment(
                      nestedCommentId: nestedCommentId,
                      text: controller.text.trim());
                }
              },
              child: Text('완료')),
        ],
      ),
      body: BlocListener<ReportCubit, ReportState>(
        listener: (context, state) {
          if (state is Success) {
            Navigator.pop(context);
          } else if (state is Error) {
            showToast(msg: '문제가 발생하였습니다.');
            Navigator.pop(context);
          }
        },
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '어떤 점이 불편하신가요?',
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
          ],
        ),
      ),
    );
  }
}
