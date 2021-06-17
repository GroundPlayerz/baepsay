import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class DeviceMediaQueryState extends Equatable {}

class Checking extends DeviceMediaQueryState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Loaded extends DeviceMediaQueryState {
  final MediaQueryData mediaQuery;
  Loaded(this.mediaQuery);

  @override
  // TODO: implement props
  List<Object?> get props => [mediaQuery];
}

class Error extends DeviceMediaQueryState {
  final String message;
  final int? statusCode;

  Error({required this.message, this.statusCode});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
