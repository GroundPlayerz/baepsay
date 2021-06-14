import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:golden_balance_flutter/bloc/cubit/report_cubit.dart';
import 'package:golden_balance_flutter/bloc/state/report_state.dart';
import 'package:golden_balance_flutter/repository/member_repository.dart';
import 'package:golden_balance_flutter/screen/home/home_screen.dart';

class CommentReportScreen extends StatefulWidget {
  final int commentId;

  const CommentReportScreen({required this.commentId});

  @override
  _CommentReportScreenState createState() => _CommentReportScreenState();
}

class _CommentReportScreenState extends State<CommentReportScreen> {
  final TextEditingController controller = TextEditingController();
  late final commentId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    commentId = widget.commentId;
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
        title: Text('의견 신고하기'),
        actions: [
          TextButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  BlocProvider.of<ReportCubit>(context).reportComment(
                      commentId: commentId, text: controller.text.trim());
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
            Fluttertoast.showToast(
              msg: '문제가 발생하였습니다.',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
            Navigator.pop(context);
          }
        },
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                '어떤 점이 불편하신가요? 신고 내용을 적어주세요.',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
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
          ],
        ),
      ),
    );
  }
}
