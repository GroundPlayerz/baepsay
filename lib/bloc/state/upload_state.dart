import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class UploadState extends Equatable {}

class Default extends UploadState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Error extends UploadState {
  final String message;
  final int? statusCode;

  Error({required this.message, this.statusCode});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class Compressing extends UploadState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Uploading extends UploadState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Uploaded extends UploadState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
