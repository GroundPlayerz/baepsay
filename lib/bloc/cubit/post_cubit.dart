import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/state/post_state.dart';
import 'package:golden_balance_flutter/model/post/post.dart';
import 'package:golden_balance_flutter/repository/post_repository.dart';
import 'package:golden_balance_flutter/repository/member_repository.dart';

class PostCubit extends Cubit<PostState> {
  final MemberRepository memberRepository;
  final PostRepository postRepository;

  PostCubit({required this.memberRepository, required this.postRepository})
      : super(Empty());

  void setEmptyState() {
    emit(Empty());
  }

  void getPost({required int postId}) async {
    try {
      emit(Loading());
      final Response response =
          await postRepository.getPostById(postId: postId);
      final postList =
          response.data['post'].map<Post>((e) => Post.fromJson(e)).toList();
      final Post post = postList[0];
      emit(Loaded(post: post));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  void viewPost({required int postIndex}) async {
    try {
      if (state is Loaded) {
        final parsedState = (state as Loaded);
        await memberRepository.viewPost(postId: parsedState.post.id);
      }
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  void voteToPost({required int choice}) async {
    try {
      if (state is Loaded) {
        final parsedState = (state as Loaded);
        final Post prevPost = parsedState.post;
        Post changedPost;
        if (choice == 1) {
          changedPost = prevPost.copyWith(
              memberVoteChoice: 1,
              firstContentVoteCount: prevPost.firstContentVoteCount + 1);
        } else {
          changedPost = prevPost.copyWith(
              memberVoteChoice: 2,
              secondContentVoteCount: prevPost.secondContentVoteCount + 1);
        }

        emit(Loaded(post: changedPost));

        await memberRepository.voteToPost(postId: prevPost.id, choice: choice);
      }
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  void pressLikeButton() async {
    try {
      if (state is Loaded) {
        final parsedState = (state as Loaded);
        final Post prevPost = parsedState.post;
        Post changedPost;
        if (prevPost.memberLikeCount == 0) {
          changedPost = prevPost.copyWith(
              memberLikeCount: 1, likeCount: prevPost.likeCount + 1);
        } else {
          changedPost = prevPost.copyWith(
              memberLikeCount: 0, likeCount: prevPost.likeCount - 1);
        }
        emit(Loaded(post: changedPost));
        if (changedPost.memberLikeCount == 0) {
          await memberRepository.cancelLikePost(postId: changedPost.id);
        } else {
          await memberRepository.likePost(postId: changedPost.id);
        }
      }
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
