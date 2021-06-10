import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:golden_balance_flutter/model/post/post.dart';

@immutable
abstract class PostState extends Equatable {}

class Empty extends PostState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Error extends PostState {
  final String message;
  final int? statusCode;

  Error({required this.message, this.statusCode});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class Loading extends PostState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Loaded extends PostState {
  final Post post;

  Loaded({
    required this.post,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [post];
}
