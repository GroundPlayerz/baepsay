import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
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
              child: Text(textButtonTitle)),
          selectedTabIndex == index
              ? Container(
                  height: 2.0,
                  color: Colors.black,
                )
              : Container(
                  height: 1.0,
                  color: Colors.grey,
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
          title: Text(
            BlocProvider.of<AuthCubit>(context).getProfileName() != null
                ? BlocProvider.of<AuthCubit>(context).getProfileName()!
                : '이름없음',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () {
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
                }),
          ],
        ),
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is FirebaseSignedIn) {
              return Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  state.member.profilePhotoUrl != null
                      ? CircleAvatar(
                          radius: 36,
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
                          child: Text('관리자 페이지'),
                        )
                      : Container(),
                  Row(
                    children: [
                      selectButtonTab(textButtonTitle: '내 어젠다', index: 0),
                      selectButtonTab(textButtonTitle: '투표한 어젠다', index: 1),
                      selectButtonTab(textButtonTitle: '내가 쓴 의견', index: 2),
                    ],
                  ),
                  Expanded(
                    child: Builder(builder: (context) {
                      if (selectedTabIndex == 0) {
                        return MyPostListWidget();
                      } else if (selectedTabIndex == 1) {
                        return MyVotedPostListWidget();
                      } else {
                        return MyCommentListWidget();
                      }
                    }),
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
