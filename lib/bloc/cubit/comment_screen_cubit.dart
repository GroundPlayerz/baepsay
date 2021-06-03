import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/state/comment_screen_state.dart';
import 'package:golden_balance_flutter/model/comment/comment.dart';
import 'package:golden_balance_flutter/repository/post_repository.dart';
import 'package:golden_balance_flutter/repository/user_repository.dart';

class CommentScreenCubit extends Cubit<CommentScreenState> {
  final PostRepository postRepository;
  final UserRepository userRepository;

  CommentScreenCubit({
    required this.postRepository,
    required this.userRepository,
  }) : super(CommentPageEmpty());

  void setEmptyState() {
    try {
      emit(CommentPageEmpty());
    } catch (e) {
      emit(CommentPageError(message: e.toString()));
    }
  }

  void initialCommentList({required int postId, int? idCursor}) async {
    try {
      emit(CommentPageLoading());
      final Response response = await postRepository.getCommentList(
          postId: postId, idCursor: idCursor);
      final List<Comment> commentList = response.data['comment_list']
          .map<Comment>((e) => Comment.fromJson(e))
          .toList();
      final List<Comment> newCommentList = [...commentList];
      emit(CommentPageLoaded(commentList: newCommentList));
    } catch (e) {
      emit(CommentPageError(message: e.toString()));
    }
  }

  void getCommentList({required int postId, int? idCursor}) async {
    try {
      List<Comment> prevCommentList = [];
      if (state is CommentPageLoaded) {
        final parsedState = (state as CommentPageLoaded);
        prevCommentList = [...parsedState.commentList];
      }
      emit(CommentPageLoading());
      final Response response = await postRepository.getCommentList(
          postId: postId, idCursor: idCursor);
      final List<Comment> commentList = response.data['comment_list']
          .map<Comment>((e) => Comment.fromJson(e))
          .toList();
      final List<Comment> newCommentList = [...prevCommentList, ...commentList];
      emit(CommentPageLoaded(commentList: newCommentList));
    } catch (e) {
      emit(CommentPageError(message: e.toString()));
    }
  }

  void pressLikeButton(
      {required int commentIndex, required int userLikeCount}) async {
    try {
      if (state is CommentPageLoaded) {
        final parsedState = (state as CommentPageLoaded);
        List<Comment> commentList = [...parsedState.commentList];

        Comment changedComment;
        if (commentList[commentIndex].userLikeCount == 0) {
          changedComment = commentList[commentIndex].copyWith(
              userLikeCount: 1,
              likeCount: commentList[commentIndex].likeCount + 1);
        } else {
          changedComment = commentList[commentIndex].copyWith(
              userLikeCount: 0,
              likeCount: commentList[commentIndex].likeCount - 1);
        }
        commentList[commentIndex] = changedComment;
        emit(CommentPageLoaded(commentList: commentList));
        if (changedComment.userLikeCount == 0) {
          await userRepository.cancelLikeComment(commentId: changedComment.id);
        } else {
          await userRepository.likeComment(commentId: changedComment.id);
        }
      }
    } catch (e) {
      emit(CommentPageError(message: e.toString()));
    }
  }

  Future<void> createComment({required int postId, required text}) async {
    try {
      if (state is CommentPageLoaded) {
        final parsedState = (state as CommentPageLoaded);
        List<Comment> prevCommentList = [...parsedState.commentList];
        final Response response =
            await userRepository.createComment(postId: postId, text: text);

        final List<Comment> uploadedCommentList = response.data['comment_list']
            .map<Comment>((e) => Comment.fromJson(e))
            .toList();

        final List<Comment> newCommentList = [
          ...prevCommentList,
          ...uploadedCommentList
        ];
        emit(CommentPageLoaded(commentList: newCommentList));
      }
    } catch (e) {
      emit(CommentPageError(message: e.toString()));
    }
  }
}
