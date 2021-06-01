import 'package:dio/dio.dart';
import 'package:golden_balance_flutter/api_provider/admin_api_provider.dart';

class AdminRepository {
  AdminApiProvider adminApiProvider = AdminApiProvider();

  Future<Response> getAdminFeed({double? scoreCursor, int? idCursor}) async =>
      await adminApiProvider.getAdminFeed(
          scoreCursor: scoreCursor, idCursor: idCursor);
}
