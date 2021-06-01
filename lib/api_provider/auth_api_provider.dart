import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:golden_balance_flutter/configuration.dart';
import 'package:golden_balance_flutter/util/dio_logging_interceptor.dart';

import 'package:google_sign_in/google_sign_in.dart';

class AuthApiProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final Dio _dio = Dio();
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  AuthApiProvider() {
    _dio.options = dioOptions;
    _dio.interceptors.add(DioLoggingInterceptors(_dio));
  }

  Future<Response> unauthenticatedSignUp() async {
    Response response = await _dio.post('auth/unauthenticated/signup');
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

  Future<Response> getUnauthenticatedUserAccessToken() async {
    String? userId = await _secureStorage.read(key: 'user_id');
    var response = await _dio.post('auth/unauthenticated/access-token', data: {
      'user_id': userId,
    });
    return response;
  }

  Future<Response> getAuthenticatedUserAccessToken() async {
    var response = await _dio.post('auth/authenticated/access-token', data: {
      'email': _auth.currentUser!.email,
    });
    return response;
  }

  Future<void> firebaseSignOut() async {
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
