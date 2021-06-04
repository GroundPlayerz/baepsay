import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:golden_balance_flutter/model/post/admin_feed_post.dart';
import 'package:golden_balance_flutter/model/post/post.dart';

@immutable
abstract class AdminFeedState extends Equatable {}

class Empty extends AdminFeedState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FeedError extends AdminFeedState {
  final String message;
  final int? statusCode;

  FeedError({required this.message, this.statusCode});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class Loading extends AdminFeedState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Loaded extends AdminFeedState {
  final List<AdminFeedPost> feed;
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
