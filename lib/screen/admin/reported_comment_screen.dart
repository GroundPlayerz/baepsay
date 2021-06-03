import 'package:flutter/material.dart';

class ReportedCommentScreen extends StatefulWidget {
  @override
  _ReportedCommentScreenState createState() => _ReportedCommentScreenState();
}

class _ReportedCommentScreenState extends State<ReportedCommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('신고된 댓글'),
      ),
    );
  }
}
