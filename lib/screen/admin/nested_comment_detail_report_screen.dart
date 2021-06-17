import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/reported_comment_cubit.dart';
import 'package:golden_balance_flutter/bloc/cubit/reported_nested_comment_cubit.dart';

import 'package:golden_balance_flutter/model/report/report.dart';

class NestedCommentDetailReportScreen extends StatelessWidget {
  final int nestedCommentId;

  const NestedCommentDetailReportScreen({required this.nestedCommentId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('의견 신고 상세 내용'),
        actions: [
          TextButton(onPressed: () {}, child: Text('게시물로 이동')),
        ],
      ),
      body: SafeArea(
        child: FutureBuilder<List<Report>?>(
            future: BlocProvider.of<ReportedNestedCommentCubit>(context)
                .getNestedCommentDetailReport(nestedCommentId: nestedCommentId),
            builder:
                (BuildContext context, AsyncSnapshot<List<Report>?> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data != null) {
                  return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      final report = snapshot.data![index];
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                report.text,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(report.createdAt.split('T')[0]),
                              SizedBox(height: 5),
                              Divider()
                            ]),
                      );
                    },
                    itemCount: snapshot.data!.length,
                  );
                } else {
                  return Center(child: Text('오류가 발생하였습니다.'));
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
