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
      : super(HomeFeedEmpty());

  void getInitialUserHomeFeed() async {
    try {
      emit(HomeFeedInitialLoading());
      final Response response = await userRepository.getHomeFeed();
      final feed =
          response.data['feed'].map<Post>((e) => Post.fromJson(e)).toList();
      final List<Post> newFeed = [...feed];

      bool hasMore = false;
      if (feed.isNotEmpty) {
        hasMore = true;
      }
      emit(HomeFeedLoaded(
          feed: newFeed, hasMore: hasMore, isLoadingMore: false));
    } catch (e) {
      emit(HomeFeedError(message: e.toString()));
    }
  }

  void getUserHomeFeed() async {
    try {
      final parsedState = (state as HomeFeedLoaded);
      final prevFeed = [...parsedState.feed];
      final prevHasMore = parsedState.hasMore;
      emit(HomeFeedLoaded(
          feed: prevFeed, hasMore: prevHasMore, isLoadingMore: true));

      final idCursor = prevFeed.last.id;
      final scoreCursor = prevFeed.last.score;
      final Response response = await userRepository.getHomeFeed(
          idCursor: idCursor, scoreCursor: scoreCursor);
      final feed =
          response.data['feed'].map<Post>((e) => Post.fromJson(e)).toList();

      final bool changedHasMore = feed.isNotEmpty ? true : false;
      final List<Post> newFeed = [...prevFeed, ...feed];
      emit(HomeFeedLoaded(
          feed: newFeed, hasMore: changedHasMore, isLoadingMore: false));
    } catch (e) {
      emit(HomeFeedError(message: e.toString()));
    }
  }

  void viewPost({required int postIndex}) async {
    try {
      if (state is HomeFeedLoaded) {
        final parsedState = (state as HomeFeedLoaded);
        await userRepository.viewPost(postId: parsedState.feed[postIndex].id);
      }
    } catch (e) {
      emit(HomeFeedError(message: e.toString()));
    }
  }

  void voteToPost({required int postIndex, required int choice}) async {
    try {
      if (state is HomeFeedLoaded) {
        final parsedState = (state as HomeFeedLoaded);
        final hasMore = parsedState.hasMore;
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
        emit(
            HomeFeedLoaded(feed: feed, hasMore: hasMore, isLoadingMore: false));

        await userRepository.voteToPost(
            postId: feed[postIndex].id, choice: choice);
      }
    } catch (e) {
      emit(HomeFeedError(message: e.toString()));
    }
  }

  void pressLikeButton({required int postIndex}) async {
    try {
      if (state is HomeFeedLoaded) {
        final parsedState = (state as HomeFeedLoaded);
        final hasMore = parsedState.hasMore;
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
        emit(
            HomeFeedLoaded(feed: feed, hasMore: hasMore, isLoadingMore: false));
        if (changedPost.userLikeCount == 0) {
          await userRepository.cancelLikePost(postId: changedPost.id);
        } else {
          await userRepository.likePost(postId: changedPost.id);
        }
      }
    } catch (e) {
      emit(HomeFeedError(message: e.toString()));
    }
  }
}
