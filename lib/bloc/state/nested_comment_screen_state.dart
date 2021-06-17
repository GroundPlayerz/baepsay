import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:golden_balance_flutter/model/nested_comment/nested_comment.dart';

@immutable
abstract class NestedCommentScreenState extends Equatable {}

class Empty extends NestedCommentScreenState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NestedCommentScreenError extends NestedCommentScreenState {
  final String message;
  final int? statusCode;

  NestedCommentScreenError({required this.message, this.statusCode});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class NestedCommentScreenInitialLoading extends NestedCommentScreenState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NestedCommentScreenLoaded extends NestedCommentScreenState {
  final List<NestedComment> nestedCommentList;
  final bool hasMore;
  final bool isLoadingMore;

  NestedCommentScreenLoaded(
      {required this.nestedCommentList,
      required this.hasMore,
      required this.isLoadingMore});

  @override
  // TODO: implement props
  List<Object?> get props => [nestedCommentList, hasMore, isLoadingMore];
}
