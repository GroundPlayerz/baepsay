import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/state/admin_feed_state.dart';
import 'package:golden_balance_flutter/model/post/simple_post.dart';
import 'package:golden_balance_flutter/repository/admin_repository.dart';

class AdminFeedCubit extends Cubit<AdminFeedState> {
  final AdminRepository adminRepository;

  AdminFeedCubit({required this.adminRepository}) : super(Empty());

  void getInitialAdminFeed() async {
    try {
      emit(Loading());
      final Response response = await adminRepository.getAdminFeed();
      final feed = response.data['feed']
          .map<SimplePost>((e) => SimplePost.fromJson(e))
          .toList();

      final List<SimplePost> newFeed = [...feed];
      bool hasMore = false;
      if (newFeed.isNotEmpty) {
        hasMore = true;
      }
      emit(Loaded(feed: newFeed, hasMore: hasMore, isLoadingMore: false));
    } catch (e) {
      emit(FeedError(message: e.toString()));
    }
  }

  void getAdminFeed() async {
    try {
      List<SimplePost> prevFeed = [];
      if (state is Loaded) {
        final parsedState = (state as Loaded);
        prevFeed = [...parsedState.feed];
      }
      final scoreCursor = prevFeed.last.score;
      final idCursor = prevFeed.last.id;
      final Response response = await adminRepository.getAdminFeed(
          idCursor: idCursor, scoreCursor: scoreCursor);
      final List<SimplePost> feed = response.data['feed']
          .map<SimplePost>((e) => SimplePost.fromJson(e))
          .toList();

      final List<SimplePost> newFeed = [...prevFeed, ...feed];

      emit(Loaded(
          feed: newFeed,
          hasMore: feed.isNotEmpty ? true : false,
          isLoadingMore: false));
    } catch (e) {
      emit(FeedError(message: e.toString()));
    }
  }
}
