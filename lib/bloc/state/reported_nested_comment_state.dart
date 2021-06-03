import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:golden_balance_flutter/model/comment/reported_comment.dart';
import 'package:golden_balance_flutter/model/nested_comment/reported_nested_comment.dart';
import 'package:golden_balance_flutter/model/post/admin_feed_post.dart';
import 'package:golden_balance_flutter/model/post/reported_post.dart';

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

  Loaded({
    required this.feed,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [feed];
}
