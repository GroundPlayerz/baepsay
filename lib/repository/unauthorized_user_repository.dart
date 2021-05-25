import 'package:dio/dio.dart';
import 'package:golden_balance_flutter/api_provider/unauthorized_user_api.dart';

class UnauthorizedUserRepository {
  final UnauthorizedUserApiProvider unauthorizedUserApiProvider =
      UnauthorizedUserApiProvider();

  Future<Response> getHomeFeed({int? cursor}) async =>
      await unauthorizedUserApiProvider.getHomeFeed(cursor: cursor);
}
