import 'package:flutter/material.dart';
import 'package:golden_balance_flutter/screen/setting/account_setting_screen.dart';
import 'package:golden_balance_flutter/screen/setting/notification_setting_screen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('설정'),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationSettingScreen()));
              },
              child: Text('알림')),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AccountSettingScreen()));
              },
              child: Text('계정')),
          TextButton(onPressed: () {}, child: Text('로그아웃')),
        ],
      ),
    );
  }
}
