import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:golden_balance_flutter/screen/admin/admin_feed_screen.dart';
import 'package:golden_balance_flutter/screen/admin/admin_screen.dart';
import 'package:golden_balance_flutter/screen/profile/profile_edit_screen.dart';
import 'package:golden_balance_flutter/screen/setting/settings_screen.dart';

import '../../bloc/cubit/auth_cubit.dart';
import '../../bloc/state/auth_state.dart';
import '../auth/profile_name_setting_screen.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is FirebaseSigningIn) {
          Phoenix.rebirth(context);
        } else if (state is FirebaseSignedOut) {
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
              return Column(children: [
                Row(children: [
                  Expanded(child: Text(state.user.profileName)),
                  state.user.profilePhotoUrl != null
                      ? CircleAvatar(
                          radius: 24,
                          foregroundImage: CachedNetworkImageProvider(
                            state.user.profilePhotoUrl!,
                          ),
                          backgroundColor: Colors.white,
                        )
                      : Container(),
                ]),
                TextButton(
                    onPressed: () {
                      BlocProvider.of<AuthCubit>(context).firebaseSignOut();
                    },
                    child: Text('로그아웃')),
                state.user.role == 'admin'
                    ? TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminScreen()));
                        },
                        child: Text('Admin Page'),
                      )
                    : Container(),
              ]);
            } else if (state is DeviceSignedIn) {
              return Column(children: [
                Row(children: [
                  Expanded(child: Text(state.user.profileName)),
                  state.user.profilePhotoUrl != null
                      ? CircleAvatar(
                          radius: 24,
                          foregroundImage: CachedNetworkImageProvider(
                            state.user.profilePhotoUrl!,
                          ),
                          backgroundColor: Colors.white,
                        )
                      : Container(),
                ]),
                TextButton(
                  onPressed: () {
                    BlocProvider.of<AuthCubit>(context).signInGoogle();
                  },
                  child: Text('Google Sign In'),
                ),
              ]);
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
