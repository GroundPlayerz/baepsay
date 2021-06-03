import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:golden_balance_flutter/model/comment/comment.dart';

@immutable
abstract class CommentScreenState extends Equatable {}

class CommentPageEmpty extends CommentScreenState {
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

class CommentPageLoading extends CommentScreenState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CommentPageLoaded extends CommentScreenState {
  final List<Comment> commentList;

  CommentPageLoaded({required this.commentList});

  @override
  // TODO: implement props
  List<Object?> get props => [commentList];
}
