import 'dart:io';

import 'package:flutter/material.dart';

Widget divider({required Color color}) {
  return Container(
    color: color,
    height: 1,
    width: double.infinity,
  );
}

void showDeleteAlertDialog(BuildContext context,
    {required String title,
    required String content,
    required Function onPressed}) async {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('취소'),
          ),
          TextButton(
            onPressed: () {
              onPressed;
              Navigator.pop(context);
            },
            child: Text('삭제'),
          ),
        ],
      );
    },
  );
}
