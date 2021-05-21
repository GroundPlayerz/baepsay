import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/auth_cubit.dart';
import 'package:golden_balance_flutter/bloc/state/auth_state.dart';
import 'package:golden_balance_flutter/screen/auth/profile_name_setting_screen.dart';
import 'package:golden_balance_flutter/screen/home/home_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    // double convertHeightRatio = mediaQuery.size.height / kIphoneXHeight;

    return Scaffold(
      body: Center(
        child: Column(children: [
          SizedBox(
            height: 300,
          ),
          Container(
            height: 34.0,
            //padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Image(
              image: AssetImage('images/logo_big@3x.png'),
            ),
          ),
          SizedBox(
            height: 150,
          ),
          _googleSignInButton(context),
        ]),
      ),
    );
  }
}

Widget _googleSignInButton(BuildContext context) {
  return BlocListener<AuthCubit, AuthState>(
    listener: (context, state) {
      if (state is FirebaseSignedIn) {
        BlocProvider.of<AuthCubit>(context).signInFlask();
      } else if (state is FlaskSignedIn) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false);
      } else if (state is FlaskSignInFailed) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => ProfileNameSettingScreen()),
            (route) => false);
      } else if (state is SignedOut) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => SignInScreen()),
            (route) => false);
      }
    },
    child: OutlinedButton(
      style: OutlinedButton.styleFrom(
        primary: Colors.grey,
        backgroundColor: Color(0xffF8F8FA),
        side: BorderSide(color: Colors.grey[300]!, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
      onPressed: () async {
        log('[login_screen] _signInButton() - onPressed activated.');
        BlocProvider.of<AuthCubit>(context).signInGoogle();
        log('[login_screen] _signInButton() - signIn() has done.');
      },
      child: Container(
        // height: 50.0,
        // width: 200,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 17, 12, 17),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                  image: AssetImage('images/google_logo@3x.png'), height: 20.0),
              SizedBox(width: 20),
              Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Text(
                    'Google 로그인',
                    // style: kBodyTextStyle1M.copyWith(fontSize: 16.0)),
                  )),
            ],
          ),
        ),
      ),
    ),
  );
}
