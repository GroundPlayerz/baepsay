import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
          child: Column(children: [
        Text('네트워크에 문제가 생겼습니다. '),
        IconButton(
            onPressed: () {
              Phoenix.rebirth(context);
            },
            icon: Icon(Icons.restart_alt))
      ])),
    ));
  }
}
