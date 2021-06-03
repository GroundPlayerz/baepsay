import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/reported_post_cubit.dart';
import 'package:golden_balance_flutter/model/report/report.dart';

class PostReportScreen extends StatelessWidget {
  final int postId;

  const PostReportScreen({required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('게시물 신고 상세 내용'),
      ),
      body: FutureBuilder<List<Report>?>(
          future: BlocProvider.of<ReportedPostCubit>(context)
              .getPostReport(postId: postId),
          builder:
              (BuildContext context, AsyncSnapshot<List<Report>?> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    final report = snapshot.data![index];
                    return Card(
                      child: Column(children: [
                        Text(report.text),
                        Text(report.createdAt)
                      ]),
                    );
                  },
                  itemCount: snapshot.data!.length,
                );
              } else {
                return Center(child: Text('오류가 발생하였습니다.'));
              }
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
