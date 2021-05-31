import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart' as fa;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:golden_balance_flutter/bloc/state/auth_state.dart';
import 'package:golden_balance_flutter/model/token/token.dart';
import 'package:golden_balance_flutter/model/user/user.dart';
import 'package:golden_balance_flutter/repository/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  final fa.FirebaseAuth _auth = fa.FirebaseAuth.instance;

  AuthCubit({required this.repository}) : super(Checking());

  void checkUserIdExistsInSecureStorage() async {
    try {
      String? userId = await _secureStorage.read(key: 'user_id');
      print(userId);
      if (userId != null) {
        emit(DeviceUserIdExists(userId));
      } else {
        Response response = await repository.unauthenticatedSignUp();
        final user = User.fromJson(response.data);
        print(user.toString());
        await _secureStorage.write(key: 'user_id', value: user.id.toString());
        checkUserIdExistsInSecureStorage();
      }
    } catch (e) {
      print(e.toString());
      emit(AuthError(message: e.toString()));
    }
  }

  void signInGoogle() async {
    try {
      if (state is DeviceSignedIn) {
        await repository.googleSignIn();
        if (_auth.currentUser != null) {
          emit(FirebaseSigningIn());
        }
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  void checkIsFirebaseSignedIn() async {
    try {
      if (repository.isFirebaseSignedIn()) {
        emit(FirebaseSigningIn());
      } else {
        emit(FirebaseSignedOut());
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> getUnauthenticatedUserAccessToken() async {
    try {
      final resp = await repository.getUnauthenticatedUserAccessToken();
      final accessToken = Token.fromJson(resp.data['access_token']);
      final User user = User.fromJson(resp.data['user']);
      await _secureStorage.delete(key: 'access_token');
      await _secureStorage.write(
          key: 'access_token', value: accessToken.accessToken);
      emit(DeviceSignedIn(user));
    } catch (e) {
      emit(AuthError(
        message: e.toString(),
      ));
    }
  }

  Future<void> getAuthenticatedUserAccessToken() async {
    try {
      final resp = await repository.getAuthenticatedUserAccessToken();
      final accessToken = Token.fromJson(resp.data['access_token']);
      final User user = User.fromJson(resp.data['user']);
      await _secureStorage.delete(key: 'access_token');
      await _secureStorage.delete(key: 'user_id');
      await _secureStorage.write(
          key: 'access_token', value: accessToken.accessToken);
      emit(FirebaseSignedIn(user));
    } catch (e) {
      emit(AuthError(
        message: e.toString(),
      ));
    }
  }

  void firebaseSignOut() async {
    try {
      if (state is FirebaseSignedIn) {
        await repository.firebaseSignOut();
        emit(FirebaseSignedOut());
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}
