import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:golden_balance_flutter/model/comment/reported_comment.dart';
import 'package:golden_balance_flutter/model/post/admin_feed_post.dart';
import 'package:golden_balance_flutter/model/post/reported_post.dart';

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

  Loaded({
    required this.feed,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [feed];
}
