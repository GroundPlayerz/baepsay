import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:golden_balance_flutter/constant/color.dart';
import 'package:golden_balance_flutter/constant/spacings.dart';
import 'package:golden_balance_flutter/constant/textstyle.dart';
import 'package:golden_balance_flutter/screen/admin/admin_screen.dart';
import 'package:golden_balance_flutter/screen/error_screen.dart';
import 'package:golden_balance_flutter/screen/profile/my_comment_list_widget.dart';
import 'package:golden_balance_flutter/screen/profile/my_post_list_widget.dart';
import 'package:golden_balance_flutter/screen/profile/my_voted_post_list_widget.dart';
import 'package:golden_balance_flutter/screen/profile/profile_edit_screen.dart';
import 'package:golden_balance_flutter/screen/setting/settings_screen.dart';

import '../../bloc/cubit/auth_cubit.dart';
import '../../bloc/state/auth_state.dart';

class AuthProfileScreen extends StatefulWidget {
  @override
  _AuthProfileScreenState createState() => _AuthProfileScreenState();
}

class _AuthProfileScreenState extends State<AuthProfileScreen> {
  int selectedTabIndex = 0;

  Widget selectButtonTab({required textButtonTitle, required index}) {
    return Expanded(
      child: Column(
        children: [
          TextButton(
              onPressed: () {
                setState(() {
                  selectedTabIndex = index;
                });
              },
              child: Text(
                textButtonTitle,
                style: selectedTabIndex == index
                    ? kNoto14B
                    : kNoto14M.copyWith(color: kGreyColor_999999),
              )),
          selectedTabIndex == index
              ? Container(
                  height: 2.0,
                  color: kAccentPinkColor,
                )
              : Column(
                  children: [
                    SizedBox(height: 1.5),
                    Container(
                      height: 0.5,
                      color: kIconGreyColor_CBCBCB,
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is FirebaseSignedOut) {
          Phoenix.rebirth(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBackgroundGreyColor,
          elevation: 0.0,
          title: Text(
            BlocProvider.of<AuthCubit>(context).getProfileName() != null
                ? BlocProvider.of<AuthCubit>(context).getProfileName()!
                : '이름없음',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SafeArea(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: Text('프로필 편집'),
                              leading: Icon(Icons.edit),
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProfileEditScreen()));
                              },
                            ),
                            ListTile(
                              title: Text('설정'),
                              leading: Icon(Icons.settings),
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SettingsScreen()));
                              },
                            ),
                          ],
                        ),
                      );
                    });
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8, top: 8, bottom: 8, right: 20),
                child: Image.asset(
                  'icons/profile_screen_icon_setting@3x.png',
                  color: kBlackColor,
                  width: 24,
                ),
              ),
            ),
          ],
        ),
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is FirebaseSignedIn) {
              return Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  state.member.profilePhotoUrl != null
                      ? CircleAvatar(
                          radius: 40.5,
                          foregroundImage: CachedNetworkImageProvider(
                            state.member.profilePhotoUrl!,
                          ),
                          backgroundColor: Colors.white,
                        )
                      : Container(),
                  state.member.role == 'admin'
                      ? TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdminScreen()));
                          },
                          child: Text(
                            '관리자 페이지',
                            style: TextStyle(color: kAccentPinkColor),
                          ),
                        )
                      : Container(),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: kBlackColor.withOpacity(0.08),
                            spreadRadius: 5,
                            blurRadius: 20,
                            offset: Offset(0, -3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kListViewOuterHorizontalPadding),
                            child: Row(
                              children: [
                                selectButtonTab(
                                    textButtonTitle: '내 어젠다', index: 0),
                                selectButtonTab(
                                    textButtonTitle: '내 의견', index: 1),
                                selectButtonTab(
                                    textButtonTitle: '투표한 어젠다', index: 2),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Builder(builder: (context) {
                              if (selectedTabIndex == 0) {
                                return MyPostListWidget();
                              } else if (selectedTabIndex == 1) {
                                return MyCommentListWidget();
                              } else {
                                return MyVotedPostListWidget();
                              }
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is AuthError) {
              return ErrorScreen();
            }
            return Container();
          },
        ),
      ),
    );
  }
}
