import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/state/home_feed_state.dart';
import 'package:golden_balance_flutter/model/post/post.dart';
import 'package:golden_balance_flutter/repository/unauthorized_user_repository.dart';
import 'package:golden_balance_flutter/repository/user_repository.dart';

class HomeFeedCubit extends Cubit<HomeFeedState> {
  final UserRepository userRepository;
  final UnauthorizedUserRepository unauthorizedUserRepository;

  HomeFeedCubit(
      {required this.userRepository, required this.unauthorizedUserRepository})
      : super(Empty());

  getUnauthorizedUserHomeFeed({int? cursor}) async {
    try {
      emit(Loading());

      final Response response =
          await this.unauthorizedUserRepository.getHomeFeed(cursor: cursor);

      final feed = response.data
          .map<Post>(
            (e) => Post.fromJson(e),
          )
          .toList();

      emit(Loaded(feed: feed));
    } catch (e) {
      emit(FeedError(message: e.toString()));
    }
  }

  getUserHomeFeed({int? cursor}) async {
    try {
      emit(Loading());
      final Response response =
          await this.userRepository.getHomeFeed(cursor: cursor);
      final feed = response.data['feed']
          .map<Post>(
            (e) => Post.fromJson(e),
          )
          .toList();
      print(feed);
      emit(Loaded(feed: feed));
    } catch (e) {
      emit(FeedError(message: e.toString()));
    }
  }
}
