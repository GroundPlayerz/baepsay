import 'package:dio/dio.dart';
import 'package:golden_balance_flutter/api_provider/auth_api_provider.dart';

class AuthRepository {
  final authApiProvider = AuthApiProvider();

  Future<Response> signUp({required String profileName}) async {
    return await authApiProvider.signUp(profileName: profileName);
  }

  bool isFirebaseSignedIn() => authApiProvider.isFirebaseSignedIn();

  Future<void> googleSignIn() async => await authApiProvider.googleSignIn();

  Future<Response> flaskSignIn() async => await authApiProvider.flaskSignIn();

  Future<void> signOut() async => authApiProvider.signOut();
}
