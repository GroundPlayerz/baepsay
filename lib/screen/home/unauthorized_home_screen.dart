import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/auth_cubit.dart';
import 'package:golden_balance_flutter/bloc/cubit/home_feed_cubit.dart';
import 'package:golden_balance_flutter/bloc/state/auth_state.dart';
import 'package:golden_balance_flutter/constant/color.dart';
import 'package:golden_balance_flutter/constant/textstyle.dart';
import 'package:golden_balance_flutter/screen/home/following_feed_screen.dart';
import 'package:golden_balance_flutter/screen/home/post_widget.dart';
import 'package:golden_balance_flutter/screen/notification_screen.dart';
import 'package:golden_balance_flutter/screen/profile/my_profile_screen.dart';
import 'package:golden_balance_flutter/screen/upload/upload_screen.dart';

class UnauthorizedHomeScreen extends StatefulWidget {
  @override
  _UnauthorizedHomeScreenState createState() => _UnauthorizedHomeScreenState();
}

class _UnauthorizedHomeScreenState extends State<UnauthorizedHomeScreen> {
  bool isForYouSelected = true;
  bool isStateChecked = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeFeedCubit>(context).getUnauthorizedUserHomeFeed();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kBackgroundNavyColor,
          leadingWidth: 0,
          titleSpacing: 0,
          title: Row(
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    '추천',
                    style: isForYouSelected
                        ? kHomeScreenSelectedTabTextStyle
                        : kHomeScreenUnselectedTabTextStyle,
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyProfileScreen()));
                  },
                  child: Text('팔로잉',
                      style: !isForYouSelected
                          ? kHomeScreenSelectedTabTextStyle
                          : kHomeScreenUnselectedTabTextStyle)),
            ],
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyProfileScreen()));
                }),
            IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyProfileScreen()));
                }),
            IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyProfileScreen()));
                }),
          ],
        ),
        backgroundColor: kBackgroundNavyColor,
        body: Text('Unauthorized'),
      );
    });
  }
}
