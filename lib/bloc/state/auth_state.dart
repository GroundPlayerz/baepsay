import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:golden_balance_flutter/model/token/token.dart';
import 'package:golden_balance_flutter/model/user/user.dart';

@immutable
abstract class AuthState extends Equatable {}

class SignedOut extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Error extends AuthState {
  final String message;
  final int? statusCode;

  Error({required this.message, this.statusCode});

  @override
  // TODO: implement props
  List<Object?> get props => [this.message];
}

class FirebaseSignedIn extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FlaskSignedIn extends AuthState {
  final Token accessToken;
  final User user;

  FlaskSignedIn({
    required this.accessToken,
    required this.user,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [this.accessToken];
}

class FlaskSignInFailed extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
