import 'package:dio/dio.dart' as dio;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:golden_balance_flutter/model/token/token.dart';
import 'package:golden_balance_flutter/repository/auth_repository.dart';

class DioLoggingInterceptors extends dio.Interceptor {
  final dio.Dio _dio;
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  DioLoggingInterceptors(this._dio);

  @override
  Future onRequest(
      dio.RequestOptions options, dio.RequestInterceptorHandler handler) async {
    print(
        "--> ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"" + (options.baseUrl) + (options.path)}");
    print("Headers:");
    options.headers.forEach((k, v) => print('$k: $v'));
    if (options.queryParameters != null) {
      print("queryParameters:");
      options.queryParameters.forEach((k, v) => print('$k: $v'));
    }
    if (options.data != null) {
      print("Body: ${options.data}");
    }
    print(
        "--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");

    if (options.headers.containsKey('requirestoken')) {
      options.headers.remove('requirestoken');
      print('accessToken: ${_secureStorage.read(key: 'access_token')}');
      String? accessToken = await _secureStorage.read(key: 'access_token');
      options.headers.addAll({'Authorization': 'Bearer $accessToken'});
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(
      dio.Response response, dio.ResponseInterceptorHandler handler) {
    print(
        "<-- ${response.statusCode} ${(response.requestOptions != null ? (response.requestOptions.baseUrl + response.requestOptions.path) : 'URL')}");
    print("Headers:");
    response.headers.forEach((k, v) => print('$k: $v'));
    print("Response: ${response.data}");
    print("<-- END HTTP");
    return super.onResponse(response, handler);
  }

  @override
  Future onError(
      dio.DioError dioError, dio.ErrorInterceptorHandler handler) async {
    print(
        "<-- ${dioError.message} ${(dioError.response?.requestOptions != null ? (dioError.response!.requestOptions.baseUrl + dioError.response!.requestOptions.path) : 'URL')}");
    print(
        "${dioError.response != null ? dioError.response!.data : 'Unknown Error'}");
    print("<-- End error");

    int responseCode = dioError.response!.statusCode!;
    String? oldAccessToken = await _secureStorage.read(key: 'access_token');
    if (oldAccessToken != null && responseCode == 401) {
      _dio.interceptors.requestLock.lock();
      _dio.interceptors.responseLock.lock();

      AuthRepository apiAuthRepository = AuthRepository();
      final resp = await apiAuthRepository.flaskSignIn();
      final token = Token.fromJson(resp.data['access_token']);
      String newAccessToken = token.accessToken;
      _secureStorage.delete(key: 'access_token');
      _secureStorage.write(key: 'access_token', value: newAccessToken);

      dio.RequestOptions requestOptions = dioError.response!.requestOptions;
      requestOptions.headers.addAll({'requirestoken': true});
      _dio.interceptors.requestLock.unlock();
      _dio.interceptors.responseLock.unlock();
      return _retry(requestOptions);
    } else {
      super.onError(dioError, handler);
    }
  }

  Future<dio.Response<dynamic>> _retry(
      dio.RequestOptions requestOptions) async {
    final options = dio.Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}
