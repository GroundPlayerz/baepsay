import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:golden_balance_flutter/configuration.dart';
import 'package:golden_balance_flutter/util/dio_logging_interceptor.dart';

import 'package:google_sign_in/google_sign_in.dart';

class AuthApiProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final Dio _dio = Dio();

  AuthApiProvider() {
    _dio.options = dioOptions;
    _dio.interceptors.add(DioLoggingInterceptors(_dio));
  }

  Future<Response> signUp({
    required String profileName,
  }) async {
    var response = await _dio.post('/auth/signup',
        data: {'email': _auth.currentUser!.email, 'profile_name': profileName});

    return response;
  }

  Future<void> googleSignIn() async {
    await _signInWithGoogle();
  }

  bool isFirebaseSignedIn() {
    if (_auth.currentUser != null) {
      return true;
    }
    return false;
  }

  Future<Response> flaskSignIn() async {
    var response = await _dio.post('/auth/signin', data: {
      'email': _auth.currentUser!.email,
    });
    return response;
  }

  Future<void> signOut() async {
    await _signOutGoogle();
    await _auth.signOut();
  }

  Future<void> _signInWithGoogle() async {
    await Firebase.initializeApp();
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User? user = authResult.user;

      if (user != null) {
        assert(!user.isAnonymous);
        // assert(await user.getIdToken() != null);
        final User currentUser = _auth.currentUser!;
        assert(user.uid == currentUser.uid);
        log('[login_service] _signInWithGoogle() - _signInWithGoogle succeeded: $user');
      } else {
        log('[login_service] _signInWithGoogle() - Google Sign In Failed');
      }
    } else {
      log('[login_service] _signInWithGoogle() - Google Sign In Failed');
    }
  }

  Future<void> _signOutGoogle() async {
    await _googleSignIn.signOut();
    log("[login_service] _signOutGoogle() - User Signed Out with google.");
  }
}
