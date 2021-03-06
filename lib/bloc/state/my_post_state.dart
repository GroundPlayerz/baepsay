import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:golden_balance_flutter/model/post/simple_post.dart';

@immutable
abstract class MyPostState extends Equatable {}

class Empty extends MyPostState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Error extends MyPostState {
  final String message;
  final int? statusCode;

  Error({required this.message, this.statusCode});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class Loading extends MyPostState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Loaded extends MyPostState {
  final List<SimplePost> postList;
  final bool hasMore;
  final bool isLoadingMore;

  Loaded({
    required this.postList,
    required this.hasMore,
    required this.isLoadingMore,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [postList, hasMore, isLoadingMore];
}
