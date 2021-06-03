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

class NestedCommentPageError extends NestedCommentScreenState {
  final String message;
  final int? statusCode;

  NestedCommentPageError({required this.message, this.statusCode});

  @override
  // TODO: implement props
  List<Object?> get props => [this.message];
}

class NestedCommentPageLoading extends NestedCommentScreenState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NestedCommentPageLoaded extends NestedCommentScreenState {
  final List<NestedComment> nestedCommentList;

  NestedCommentPageLoaded({required this.nestedCommentList});

  @override
  // TODO: implement props
  List<Object?> get props => [nestedCommentList];
}
