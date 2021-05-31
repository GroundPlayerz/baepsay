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

  void getUnauthorizedUserHomeFeed({int? cursor}) async {
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

  void getUserHomeFeed({int? cursor}) async {
    try {
      emit(Loading());
      final Response response =
          await this.userRepository.getHomeFeed(cursor: cursor);
      final feed = response.data['feed']
          .map<Post>(
            (e) => Post.fromJson(e),
          )
          .toList();
      emit(Loaded(feed: feed));
    } catch (e) {
      emit(FeedError(message: e.toString()));
    }
  }

  void viewPost({required int postIndex}) async {
    try {
      if (state is Loaded) {
        final parsedState = (state as Loaded);
        await userRepository.viewPost(postId: parsedState.feed[postIndex].id);
      }
    } catch (e) {
      emit(FeedError(message: e.toString()));
    }
  }

  void voteToPost({required int postIndex, required int choice}) async {
    try {
      if (state is Loaded) {
        final parsedState = (state as Loaded);
        List<Post> feed = [...parsedState.feed];

        Post changedPost;
        if (choice == 1) {
          changedPost = feed[postIndex].copyWith(
              isVoted: true,
              vote: Vote(
                  id: 0,
                  postId: feed[postIndex].id,
                  userId: 0,
                  choice: 1,
                  createdAt: ''),
              firstContentVoteCount: feed[postIndex].firstContentVoteCount + 1);
        } else {
          changedPost = feed[postIndex].copyWith(
              isVoted: true,
              vote: Vote(
                  id: 0,
                  postId: feed[postIndex].id,
                  userId: 0,
                  choice: 2,
                  createdAt: ''),
              secondContentVoteCount:
                  feed[postIndex].secondContentVoteCount + 1);
        }

        feed[postIndex] = changedPost;
        emit(Loaded(feed: feed));

        await userRepository.voteToPost(
            postId: feed[postIndex].id, choice: choice);
      }
    } catch (e) {
      emit(FeedError(message: e.toString()));
    }
  }

  void pressLikeButton({required int postIndex}) async {
    try {
      if (state is Loaded) {
        final parsedState = (state as Loaded);
        List<Post> feed = [...parsedState.feed];

        Post changedPost;
        if (feed[postIndex].isLikeButtonPressed == false) {
          changedPost = feed[postIndex].copyWith(isLikeButtonPressed: true);
        } else {
          changedPost = feed[postIndex].copyWith(isLikeButtonPressed: false);
        }
        feed[postIndex] = changedPost;
        emit(Loaded(feed: feed));
        if (changedPost.isLikeButtonPressed == false) {
          await userRepository.cancelLikePost(postId: changedPost.id);
        } else {
          await userRepository.likePost(postId: changedPost.id);
        }
      }
    } catch (e) {
      emit(FeedError(message: e.toString()));
    }
  }
}
