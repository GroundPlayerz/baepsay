import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/auth_cubit.dart';
import 'package:golden_balance_flutter/bloc/cubit/home_feed_cubit.dart';
import 'package:golden_balance_flutter/bloc/state/auth_state.dart';
import 'package:golden_balance_flutter/screen/auth/profile_name_setting_screen.dart';
import 'home/home_screen.dart';
import 'home/unauthorized_home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthCubit>(context).checkIsFirebaseSignedIn();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is Checking) {
          return Scaffold(
            backgroundColor: Colors.red,
            body: Center(
              child: Column(children: [
                SizedBox(height: 100),
                Container(
                  height: 34.0,
                  child: Text(
                    'Golden Balance',
                    style: TextStyle(fontSize: 60.0),
                  ),
                ),
              ]),
            ),
          );
        } else if (state is FirebaseSignedIn) {
          BlocProvider.of<AuthCubit>(context).signInFlask();
        } else if (state is FlaskSignedIn) {
          return HomeScreen();
        } else if (state is SignedOut) {
          return UnauthorizedHomeScreen();
        } else if (state is FlaskSignInFailed) {
          return ProfileNameSettingScreen();
        }
        return Scaffold(
          backgroundColor: Colors.red,
          body: Center(
            child: Column(children: [
              SizedBox(height: 100),
              Container(
                height: 34.0,
                child: Text(
                  'Golden Balance',
                  style: TextStyle(fontSize: 60.0),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
