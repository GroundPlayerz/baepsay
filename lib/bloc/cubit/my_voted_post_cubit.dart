import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/state/my_voted_post_state.dart';
import 'package:golden_balance_flutter/model/post/simple_post.dart';
import 'package:golden_balance_flutter/repository/member_repository.dart';

class MyVotedPostCubit extends Cubit<MyVotedPostState> {
  final MemberRepository userRepository;

  MyVotedPostCubit({required this.userRepository}) : super(Empty());

  void getInitialPostList() async {
    try {
      emit(Loading());
      final Response response = await userRepository.getMyVotedPost();
      final postList = response.data['feed']
          .map<SimplePost>((e) => SimplePost.fromJson(e))
          .toList();

      final List<SimplePost> newPostList = [...postList];
      bool hasMore = false;
      if (newPostList.isNotEmpty) {
        hasMore = true;
      }
      emit(Loaded(
          postList: newPostList, hasMore: hasMore, isLoadingMore: false));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  void getPostList() async {
    try {
      List<SimplePost> prevPostList = [];
      if (state is Loaded) {
        final parsedState = (state as Loaded);
        prevPostList = [...parsedState.postList];
      }
      final scoreCursor = prevPostList.last.score;
      final idCursor = prevPostList.last.id;
      final Response response = await userRepository.getMyVotedPost(
          idCursor: idCursor, scoreCursor: scoreCursor);
      final List<SimplePost> postList = response.data['feed']
          .map<SimplePost>((e) => SimplePost.fromJson(e))
          .toList();

      final List<SimplePost> newPostList = [...prevPostList, ...postList];

      emit(Loaded(
          postList: newPostList,
          hasMore: postList.isNotEmpty ? true : false,
          isLoadingMore: false));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
