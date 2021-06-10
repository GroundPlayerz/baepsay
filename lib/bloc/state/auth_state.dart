import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:golden_balance_flutter/model/member/member.dart';

@immutable
abstract class AuthState extends Equatable {}

class Checking extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DeviceMemberIdExists extends AuthState {
  final String memberId;

  DeviceMemberIdExists(this.memberId);

  @override
// TODO: implement props
  List<Object?> get props => [memberId];
}

class DeviceSignedIn extends AuthState {
  final Member member;

  DeviceSignedIn(this.member);

  @override
  // TODO: implement props
  List<Object?> get props => [member];
}

class FirebaseSigningIn extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FirebaseSignedIn extends AuthState {
  final Member member;
  FirebaseSignedIn(this.member);

  @override
  // TODO: implement props
  List<Object?> get props => [member];
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
