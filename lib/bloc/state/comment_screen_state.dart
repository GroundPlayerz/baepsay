import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:golden_balance_flutter/model/comment/comment.dart';

@immutable
abstract class CommentScreenState extends Equatable {}

class Empty extends CommentScreenState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CommentPageError extends CommentScreenState {
  final String message;
  final int? statusCode;

  CommentPageError({required this.message, this.statusCode});

  @override
  // TODO: implement props
  List<Object?> get props => [this.message];
}

class Loading extends CommentScreenState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Loaded extends CommentScreenState {
  final List<Comment> commentList;

  Loaded({
    required this.commentList,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [commentList];
}
