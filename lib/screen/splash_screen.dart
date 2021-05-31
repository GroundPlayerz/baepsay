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
        } else if (state is FirebaseSignedOut) {
          BlocProvider.of<AuthCubit>(context)
              .checkUserIdExistsInSecureStorage();
        } else if (state is DeviceUserIdExists) {
          BlocProvider.of<AuthCubit>(context)
              .getUnauthenticatedUserAccessToken();
        } else if (state is DeviceSignedIn) {
          return HomeScreen();
        } else if (state is FirebaseSigningIn) {
          BlocProvider.of<AuthCubit>(context).getAuthenticatedUserAccessToken();
        } else if (state is FirebaseSignedIn) {
          return HomeScreen();
        } else if (state is AuthError) {
          return Text(state.message);
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
