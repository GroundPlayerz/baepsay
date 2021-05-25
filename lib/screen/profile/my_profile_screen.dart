import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
        if (state is SignedOut) Phoenix.rebirth(context);
        if (state is FirebaseSignedIn) Phoenix.rebirth(context);
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
            if (state is FlaskSignedIn) {
              return Column(children: [
                Row(children: [
                  Expanded(child: Text(state.user.profileName)),
                  CircleAvatar(
                    radius: 24,
                    foregroundImage: CachedNetworkImageProvider(
                      state.user.profilePhotoUrl,
                    ),
                    backgroundColor: Colors.white,
                  )
                ]),
                TextButton(
                    onPressed: () {
                      BlocProvider.of<AuthCubit>(context).signOut();
                    },
                    child: Text('로그아웃'))
              ]);
            } else if (state is SignedOut) {
              return TextButton(
                  onPressed: () {
                    BlocProvider.of<AuthCubit>(context).signInGoogle();
                  },
                  child: Text('Google Sign In'));
            } else if (state is FlaskSignInFailed) {
              return ProfileNameSettingScreen();
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
