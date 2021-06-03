import 'package:flutter/material.dart';

class ReportedNestedCommentScreen extends StatefulWidget {
  @override
  _ReportedNestedCommentScreenState createState() =>
      _ReportedNestedCommentScreenState();
}

class _ReportedNestedCommentScreenState
    extends State<ReportedNestedCommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('신고된 대댓글'),
      ),
    );
  }
}
