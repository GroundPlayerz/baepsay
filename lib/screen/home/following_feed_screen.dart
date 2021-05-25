import 'package:flutter/material.dart';

class FollowingFeedScreen extends StatefulWidget {
  @override
  _FollowingFeedScreenState createState() => _FollowingFeedScreenState();
}

class _FollowingFeedScreenState extends State<FollowingFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('팔로잉 피드'),
      ),
    );
  }
}
