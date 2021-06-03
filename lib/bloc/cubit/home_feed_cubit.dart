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

  void getUserHomeFeed({int? cursor}) async {
    try {
      List<Post> prevFeed = [];
      if (state is Loaded) {
        final parsedState = (state as Loaded);
        prevFeed = [...parsedState.feed];
      }
      emit(Loading());
      final Response response =
          await userRepository.getHomeFeed(cursor: cursor);
      final feed =
          response.data['feed'].map<Post>((e) => Post.fromJson(e)).toList();
      final List<Post> newFeed = [...prevFeed, ...feed];
      emit(Loaded(feed: newFeed));
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
              userVoteChoice: 1,
              firstContentVoteCount: feed[postIndex].firstContentVoteCount + 1);
        } else {
          changedPost = feed[postIndex].copyWith(
              userVoteChoice: 2,
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
        if (feed[postIndex].userLikeCount == 0) {
          changedPost = feed[postIndex].copyWith(
              userLikeCount: 1, likeCount: feed[postIndex].likeCount + 1);
        } else {
          changedPost = feed[postIndex].copyWith(
              userLikeCount: 0, likeCount: feed[postIndex].likeCount - 1);
        }
        feed[postIndex] = changedPost;
        emit(Loaded(feed: feed));
        if (changedPost.userLikeCount == 0) {
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
