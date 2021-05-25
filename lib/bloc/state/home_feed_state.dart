import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:golden_balance_flutter/model/post/post.dart';

@immutable
abstract class HomeFeedState extends Equatable {}

class Empty extends HomeFeedState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FeedError extends HomeFeedState {
  final String message;
  final int? statusCode;

  FeedError({required this.message, this.statusCode});

  @override
  // TODO: implement props
  List<Object?> get props => [this.message];
}

class Loading extends HomeFeedState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Loaded extends HomeFeedState {
  final List<Post> feed;

  Loaded({
    required this.feed,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [this.feed];
}
