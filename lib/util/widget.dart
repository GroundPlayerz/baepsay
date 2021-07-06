import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:golden_balance_flutter/constant/color.dart';
import 'package:golden_balance_flutter/constant/textstyle.dart';
import 'package:pedantic/pedantic.dart';

Widget divider({required Color color}) {
  return Container(
    color: color,
    height: 1,
    width: double.infinity,
  );
}

//업로드 스크린 AlertDialog.
void showPostUploadAlertDialog(
  BuildContext context, {
  required String title,
}) async {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        contentPadding: EdgeInsets.only(top: 20.0, bottom: 10),
        content: Container(
          // width: 300.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: kNoto16M,
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Future.delayed(Duration.zero, () {
                    Navigator.pop(context);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    decoration: BoxDecoration(
                      color: kLightGreyColor_F4F4F4,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '확인',
                      style: kNoto16M.copyWith(color: kAccentPinkColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
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
              onPressed();
              Navigator.pop(context);
            },
            child: Text('삭제'),
          ),
        ],
      );
    },
  );
}

void showToast({required String msg}) => unawaited(Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: kAccentPinkColor,
      textColor: Colors.white,
      fontSize: 16.0,
    ));
