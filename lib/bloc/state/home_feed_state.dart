import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:golden_balance_flutter/model/post/post.dart';

@immutable
abstract class HomeFeedState extends Equatable {}

class HomeFeedEmpty extends HomeFeedState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeFeedError extends HomeFeedState {
  final String message;
  final int? statusCode;

  HomeFeedError({required this.message, this.statusCode});

  @override
  // TODO: implement props
  List<Object?> get props => [this.message];
}

class HomeFeedInitialLoading extends HomeFeedState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeFeedLoaded extends HomeFeedState {
  final List<Post> feed;
  final bool hasMore;
  final bool isLoadingMore;

  HomeFeedLoaded({
    required this.feed,
    required this.hasMore,
    required this.isLoadingMore,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [this.feed, hasMore, isLoadingMore];
}
