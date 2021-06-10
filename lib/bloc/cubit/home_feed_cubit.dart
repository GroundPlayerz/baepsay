import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/state/home_feed_state.dart';
import 'package:golden_balance_flutter/model/post/post.dart';
import 'package:golden_balance_flutter/repository/member_repository.dart';

class HomeFeedCubit extends Cubit<HomeFeedState> {
  final MemberRepository memberRepository;

  HomeFeedCubit({
    required this.memberRepository,
  }) : super(HomeFeedEmpty());

  void getInitialUserHomeFeed() async {
    try {
      emit(HomeFeedInitialLoading());
      final Response response = await memberRepository.getHomeFeed();
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
      final Response response = await memberRepository.getHomeFeed(
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
        await memberRepository.viewPost(postId: parsedState.feed[postIndex].id);
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
              memberVoteChoice: 1,
              firstContentVoteCount: feed[postIndex].firstContentVoteCount + 1);
        } else {
          changedPost = feed[postIndex].copyWith(
              memberVoteChoice: 2,
              secondContentVoteCount:
                  feed[postIndex].secondContentVoteCount + 1);
        }

        feed[postIndex] = changedPost;
        emit(
            HomeFeedLoaded(feed: feed, hasMore: hasMore, isLoadingMore: false));

        await memberRepository.voteToPost(
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
        if (feed[postIndex].memberLikeCount == 0) {
          changedPost = feed[postIndex].copyWith(
              memberLikeCount: 1, likeCount: feed[postIndex].likeCount + 1);
        } else {
          changedPost = feed[postIndex].copyWith(
              memberLikeCount: 0, likeCount: feed[postIndex].likeCount - 1);
        }
        feed[postIndex] = changedPost;
        emit(
            HomeFeedLoaded(feed: feed, hasMore: hasMore, isLoadingMore: false));
        if (changedPost.memberLikeCount == 0) {
          await memberRepository.cancelLikePost(postId: changedPost.id);
        } else {
          await memberRepository.likePost(postId: changedPost.id);
        }
      }
    } catch (e) {
      emit(HomeFeedError(message: e.toString()));
    }
  }
}
