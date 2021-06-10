import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:golden_balance_flutter/model/comment/comment.dart';
import 'package:golden_balance_flutter/model/post/post.dart';

@immutable
abstract class MyCommentState extends Equatable {}

class Empty extends MyCommentState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Error extends MyCommentState {
  final String message;
  final int? statusCode;

  Error({required this.message, this.statusCode});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class Loading extends MyCommentState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Loaded extends MyCommentState {
  final List<Comment> commentList;
  final bool hasMore;
  final bool isLoadingMore;

  Loaded({
    required this.commentList,
    required this.hasMore,
    required this.isLoadingMore,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [commentList, hasMore, isLoadingMore];
}
