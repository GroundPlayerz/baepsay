import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:golden_balance_flutter/screen/admin/admin_screen.dart';
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
  int selectedTab = 0;

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
          title: Text('내 프로필'),
          actions: [
            IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SafeArea(
                          child: Container(
                            height: 150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: TextButton(
                                  child: Text('프로필 편집'),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProfileEditScreen()));
                                  },
                                )),
                                Expanded(
                                    child: TextButton(
                                  child: Text('설정'),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SettingsScreen()));
                                  },
                                )),
                              ],
                            ),
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
                  Row(children: [
                    Expanded(child: Text(state.member.profileName)),
                    state.member.profilePhotoUrl != null
                        ? CircleAvatar(
                            radius: 24,
                            foregroundImage: CachedNetworkImageProvider(
                              state.member.profilePhotoUrl!,
                            ),
                            backgroundColor: Colors.white,
                          )
                        : Container(),
                  ]),
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
                      TextButton(
                          onPressed: () {
                            setState(() {
                              selectedTab = 0;
                            });
                          },
                          child: Text('내 게시물')),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              selectedTab = 1;
                            });
                          },
                          child: Text('투표한 게시물')),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              selectedTab = 2;
                            });
                          },
                          child: Text('내가 쓴 댓글')),
                    ],
                  ),
                  Container(
                    height: 500,
                    child: Builder(builder: (context) {
                      if (selectedTab == 0) {
                        return MyPostListWidget();
                      } else if (selectedTab == 1) {
                        return MyVotedPostListWidget();
                      } else {
                        return MyCommentListWidget();
                      }
                    }),
                  ),
                ],
              );
            } else if (state is AuthError) {
              return Text(state.message);
            }
            return Container();
          },
        ),
      ),
    );
  }
}
