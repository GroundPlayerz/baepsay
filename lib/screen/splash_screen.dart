import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/cubit/auth_cubit.dart';
import 'package:golden_balance_flutter/bloc/state/auth_state.dart';
import 'home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isAccessTokenRequested = false;
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
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '황금 밸런스',
                    style: TextStyle(fontSize: 40.0),
                  ),
                  Icon(Icons.check_circle_outline)
                ],
              ),
            ),
          );
        } else if (state is FirebaseSignedOut) {
          BlocProvider.of<AuthCubit>(context)
              .checkMemberIdExistsInSecureStorage();
        } else if (state is DeviceMemberIdExists) {
          if (_isAccessTokenRequested == false) {
            BlocProvider.of<AuthCubit>(context)
                .getUnauthenticatedMemberAccessToken();
            _isAccessTokenRequested = true;
          }
        } else if (state is DeviceSignedIn) {
          return HomeScreen();
        } else if (state is FirebaseSigningIn) {
          if (_isAccessTokenRequested == false) {
            BlocProvider.of<AuthCubit>(context)
                .getAuthenticatedMemberAccessToken();

            _isAccessTokenRequested = true;
          }
        } else if (state is FirebaseSignedIn) {
          return HomeScreen();
        } else if (state is AuthError) {
          return Text(state.message);
        }
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '황금 밸런스',
                  style: TextStyle(fontSize: 40.0),
                ),
                Icon(Icons.check_circle_outline)
              ],
            ),
          ),
        );
      },
    );
  }
}
