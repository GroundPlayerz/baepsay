import 'package:dio/dio.dart';

BaseOptions dioOptions = BaseOptions(
  baseUrl: 'http://34.64.204.217/api/',
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

final String iosTestUnitId = 'ca-app-pub-3940256099942544/2934735716';
final String androidTestUnitId = 'ca-app-pub-3940256099942544/6300978111';
