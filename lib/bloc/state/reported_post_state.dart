import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:golden_balance_flutter/model/post/admin_feed_post.dart';
import 'package:golden_balance_flutter/model/post/reported_post.dart';

@immutable
abstract class ReportedPostState extends Equatable {}

class Empty extends ReportedPostState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Error extends ReportedPostState {
  final String message;
  final int? statusCode;

  Error({required this.message, this.statusCode});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class Loading extends ReportedPostState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Loaded extends ReportedPostState {
  final List<ReportedPost> feed;
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
