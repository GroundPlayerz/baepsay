import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/state/my_post_state.dart';
import 'package:golden_balance_flutter/model/post/post.dart';
import 'package:golden_balance_flutter/model/post/simple_post.dart';
import 'package:golden_balance_flutter/repository/member_repository.dart';

class MyPostCubit extends Cubit<MyPostState> {
  final MemberRepository memberRepository;

  MyPostCubit({required this.memberRepository}) : super(Empty());

  void getInitialPostList() async {
    try {
      emit(Loading());
      final Response response = await memberRepository.getMyUploadedPost();
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
      final Response response = await memberRepository.getMyUploadedPost(
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

  void deletePost({required int postIndex}) async {
    try {
      if (state is Loaded) {
        final parsedState = (state as Loaded);
        final hasMore = parsedState.hasMore;
        List<SimplePost> postList = [...parsedState.postList];
        SimplePost post = postList[postIndex];
        postList.removeAt(postIndex);
        emit(
            Loaded(postList: postList, hasMore: hasMore, isLoadingMore: false));
        await memberRepository.deletePost(postId: post.id);
      }
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
