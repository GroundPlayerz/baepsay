import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:golden_balance_flutter/model/comment/comment.dart';

@immutable
abstract class CommentScreenState extends Equatable {}

class CommentScreenEmpty extends CommentScreenState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CommentScreenError extends CommentScreenState {
  final String message;
  final int? statusCode;

  CommentScreenError({required this.message, this.statusCode});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

// class CommentPageLoading extends CommentScreenState {
//   final List<Comment> commentList;
//
//   CommentPageLoading({required this.commentList});
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [commentList];
// }

class CommentScreenInitialLoading extends CommentScreenState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CommentScreenLoaded extends CommentScreenState {
  final List<Comment> commentList;
  final bool hasMore;
  final bool isLoadingMore;

  CommentScreenLoaded(
      {required this.commentList,
      required this.hasMore,
      required this.isLoadingMore});

  @override
  // TODO: implement props
  List<Object?> get props => [commentList, hasMore, isLoadingMore];
}
