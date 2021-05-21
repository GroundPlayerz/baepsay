import 'package:flutter/material.dart';

class OthersProfileScreen extends StatefulWidget {
  @override
  _OthersProfileScreenState createState() => _OthersProfileScreenState();
}

class _OthersProfileScreenState extends State<OthersProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('내 프로필'),
      ),
    );
  }
}
