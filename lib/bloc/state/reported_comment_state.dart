import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:golden_balance_flutter/model/comment/reported_comment.dart';

@immutable
abstract class ReportedCommentState extends Equatable {}

class Empty extends ReportedCommentState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Error extends ReportedCommentState {
  final String message;
  final int? statusCode;

  Error({required this.message, this.statusCode});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class Loading extends ReportedCommentState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Loaded extends ReportedCommentState {
  final List<ReportedComment> feed;
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
