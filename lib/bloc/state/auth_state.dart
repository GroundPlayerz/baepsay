import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:golden_balance_flutter/model/token/token.dart';
import 'package:golden_balance_flutter/model/user/user.dart';

@immutable
abstract class AuthState extends Equatable {}

class Checking extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DeviceUserIdExists extends AuthState {
  final String userId;

  DeviceUserIdExists(this.userId);

  @override
// TODO: implement props
  List<Object?> get props => [userId];
}

class DeviceSignedIn extends AuthState {
  final User user;

  DeviceSignedIn(this.user);

  @override
  // TODO: implement props
  List<Object?> get props => [user];
}

class FirebaseSigningIn extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FirebaseSignedIn extends AuthState {
  final User user;
  FirebaseSignedIn(this.user);

  @override
  // TODO: implement props
  List<Object?> get props => [user];
}

class FirebaseSignedOut extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthError extends AuthState {
  final String message;
  final int? statusCode;

  AuthError({required this.message, this.statusCode});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
