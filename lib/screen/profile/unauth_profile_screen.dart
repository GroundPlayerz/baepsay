import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:golden_balance_flutter/constant/color.dart';
import 'package:golden_balance_flutter/screen/admin/admin_screen.dart';
import 'package:golden_balance_flutter/screen/error_screen.dart';
import 'package:golden_balance_flutter/screen/profile/profile_edit_screen.dart';
import 'package:golden_balance_flutter/screen/setting/settings_screen.dart';

import '../../bloc/cubit/auth_cubit.dart';
import '../../bloc/state/auth_state.dart';

class UnauthProfileScreen extends StatefulWidget {
  @override
  _UnauthProfileScreenState createState() => _UnauthProfileScreenState();
}

class _UnauthProfileScreenState extends State<UnauthProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<AuthCubit>(context).getAccessTokenByState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is FirebaseSigningIn) {
          Phoenix.rebirth(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('로그인이 필요합니다'),
        ),
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is DeviceSignedIn) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context).signInGoogle();
                      },
                      child: Text(
                        '구글 로그인하기',
                        style: TextStyle(color: kAccentPurpleColor),
                      ),
                    ),
                    Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    Text(
                      '로그인 후에 게시물을 업로드하고,',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '댓글과 투표한 게시물을 저장할 수 있어요.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
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
