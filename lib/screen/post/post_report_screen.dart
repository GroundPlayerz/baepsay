import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:golden_balance_flutter/bloc/cubit/report_cubit.dart';
import 'package:golden_balance_flutter/bloc/state/report_state.dart';
import 'package:golden_balance_flutter/repository/member_repository.dart';
import 'package:golden_balance_flutter/screen/home/home_screen.dart';

class PostReportScreen extends StatefulWidget {
  final int postId;

  const PostReportScreen({required this.postId});

  @override
  _PostReportScreenState createState() => _PostReportScreenState();
}

class _PostReportScreenState extends State<PostReportScreen> {
  final TextEditingController controller = TextEditingController();
  late final postId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    postId = widget.postId;
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
        title: Text('어젠다 신고하기'),
      ),
      body: BlocListener<ReportCubit, ReportState>(
        listener: (context, state) {
          if (state is Success) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
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
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          }
        },
        child: Column(
          children: [
            Text('어떤 점이 불편하신가요? 신고 내용을 적어주세요.'),
            Container(
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            ),
            TextButton(
                onPressed: () {
                  BlocProvider.of<ReportCubit>(context)
                      .reportPost(postId: postId, text: controller.text.trim());
                },
                child: Text('신고하기'))
          ],
        ),
      ),
    );
  }
}
