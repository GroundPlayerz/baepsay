import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/auth_cubit.dart';
import 'package:golden_balance_flutter/constant/color.dart';
import 'package:golden_balance_flutter/screen/setting/account_setting_screen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<AuthCubit>(context).getAccessTokenByState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('설정'),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AccountSettingScreen()));
            },
            child: Container(
              padding: EdgeInsets.all(16.0),
              width: double.infinity,
              child: Text(
                '계정 정보',
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
            ),
          ),
          Divider(),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              BlocProvider.of<AuthCubit>(context).firebaseSignOut();
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              child: Text('로그아웃',
                  style: TextStyle(color: kAccentPurpleColor, fontSize: 16.0)),
            ),
          ),
        ],
      ),
    );
  }
}
