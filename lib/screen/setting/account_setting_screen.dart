import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/auth_cubit.dart';

class AccountSettingScreen extends StatefulWidget {
  @override
  _AccountSettingScreenState createState() => _AccountSettingScreenState();
}

class _AccountSettingScreenState extends State<AccountSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('계정 정보'),
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              '연결 계정',
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '구글',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                Text(BlocProvider.of<AuthCubit>(context)
                    .getCurrentMember()!
                    .email!)
              ],
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '가입일',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                Text(BlocProvider.of<AuthCubit>(context)
                    .getCurrentMember()!
                    .createdAt
                    .split('T')[0])
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
