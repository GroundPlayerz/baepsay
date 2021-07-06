import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:golden_balance_flutter/model/nested_comment/reported_nested_comment.dart';

@immutable
abstract class ReportedNestedCommentState extends Equatable {}

class Empty extends ReportedNestedCommentState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Error extends ReportedNestedCommentState {
  final String message;
  final int? statusCode;

  Error({required this.message, this.statusCode});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class Loading extends ReportedNestedCommentState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Loaded extends ReportedNestedCommentState {
  final List<ReportedNestedComment> feed;
  final bool hasMore;
  final bool isLoadingMore;

  Loaded({
    required this.feed,
    required this.hasMore,
    required this.isLoadingMore,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [feed, hasMore, isLoadingMore];
}
