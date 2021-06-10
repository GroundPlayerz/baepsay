import 'package:dio/dio.dart';
import 'package:golden_balance_flutter/api_provider/auth_api_provider.dart';

class AuthRepository {
  final authApiProvider = AuthApiProvider();

  Future<Response> unauthenticatedSignUp() async {
    return await authApiProvider.unauthenticatedSignUp();
  }

  bool isFirebaseSignedIn() => authApiProvider.isFirebaseSignedIn();

  Future<void> googleSignIn() async => await authApiProvider.googleSignIn();

  Future<Response> getUnauthenticatedUserAccessToken() async =>
      await authApiProvider.getUnauthenticatedMemberAccessToken();

  Future<Response> getAuthenticatedUserAccessToken() async =>
      await authApiProvider.getAuthenticatedUserAccessToken();

  Future<void> firebaseSignOut() async => authApiProvider.firebaseSignOut();
}
