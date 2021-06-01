import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/state/admin_feed_state.dart';
import 'package:golden_balance_flutter/model/post/post.dart';
import 'package:golden_balance_flutter/repository/admin_repository.dart';

class AdminFeedCubit extends Cubit<AdminFeedState> {
  final AdminRepository adminRepository;

  AdminFeedCubit({required this.adminRepository}) : super(Empty());

  void getAdminFeed({double? scoreCursor, int? idCursor}) async {
    try {
      List<Post> prevFeed = [];
      if (state is Loaded) {
        final parsedState = (state as Loaded);
        prevFeed = [...parsedState.feed];
      }
      emit(Loading());
      final Response response = await adminRepository.getAdminFeed(
          idCursor: idCursor, scoreCursor: scoreCursor);
      final feed = response.data['feed']
          .map<Post>(
            (e) => Post.fromJson(e),
          )
          .toList();

      final List<Post> newFeed = [...prevFeed, ...feed];

      emit(Loaded(feed: newFeed));
    } catch (e) {
      emit(FeedError(message: e.toString()));
    }
  }
}
