import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/state/comment_screen_state.dart';
import 'package:golden_balance_flutter/model/comment/comment.dart';
import 'package:golden_balance_flutter/repository/post_repository.dart';
import 'package:golden_balance_flutter/repository/member_repository.dart';

class CommentScreenCubit extends Cubit<CommentScreenState> {
  final PostRepository postRepository;
  final MemberRepository memberRepository;

  CommentScreenCubit({
    required this.postRepository,
    required this.memberRepository,
  }) : super(CommentScreenEmpty());

  void setEmptyState() {
    try {
      emit(CommentScreenEmpty());
    } catch (e) {
      emit(CommentScreenError(message: e.toString()));
    }
  }

  void getInitialCommentList({required int postId}) async {
    try {
      emit(CommentScreenInitialLoading());
      final Response response =
          await postRepository.getCommentList(postId: postId);
      final List<Comment> commentList = response.data['comment_list']
          .map<Comment>((e) => Comment.fromJson(e))
          .toList();
      final List<Comment> newCommentList = [...commentList];
      bool hasMore = false;
      if (commentList.isNotEmpty) {
        hasMore = true;
      }
      emit(CommentScreenLoaded(
          commentList: newCommentList, hasMore: hasMore, isLoadingMore: false));
    } catch (e) {
      emit(CommentScreenError(message: e.toString()));
    }
  }

  Future<void> getCommentList({required int postId}) async {
    if (state is CommentScreenLoaded) {
      try {
        final parsedState = (state as CommentScreenLoaded);
        final prevCommentList = [...parsedState.commentList];
        final prevHasMore = parsedState.hasMore;
        emit(CommentScreenLoaded(
            commentList: prevCommentList,
            hasMore: prevHasMore,
            isLoadingMore: true));

        final idCursor = prevCommentList.last.id;
        final Response response = await postRepository.getCommentList(
            postId: postId, idCursor: idCursor);
        final List<Comment> commentList = response.data['comment_list']
            .map<Comment>((e) => Comment.fromJson(e))
            .toList();

        final bool changedHasMore = commentList.isNotEmpty ? true : false;
        final List<Comment> newCommentList = [
          ...prevCommentList,
          ...commentList
        ];
        emit(CommentScreenLoaded(
            commentList: newCommentList,
            hasMore: changedHasMore,
            isLoadingMore: false));
      } catch (e) {
        emit(CommentScreenError(message: e.toString()));
      }
    }
  }

  void pressLikeButton(
      {required int commentIndex, required int memberLikeCount}) async {
    try {
      if (state is CommentScreenLoaded) {
        final parsedState = (state as CommentScreenLoaded);
        final hasMore = parsedState.hasMore;
        List<Comment> commentList = [...parsedState.commentList];

        Comment changedComment;
        if (commentList[commentIndex].memberLikeCount == 0) {
          changedComment = commentList[commentIndex].copyWith(
              memberLikeCount: 1,
              likeCount: commentList[commentIndex].likeCount + 1);
        } else {
          changedComment = commentList[commentIndex].copyWith(
              memberLikeCount: 0,
              likeCount: commentList[commentIndex].likeCount - 1);
        }
        commentList[commentIndex] = changedComment;
        emit(CommentScreenLoaded(
            commentList: commentList, hasMore: hasMore, isLoadingMore: false));
        if (changedComment.memberLikeCount == 0) {
          await memberRepository.cancelLikeComment(
              commentId: changedComment.id);
        } else {
          await memberRepository.likeComment(commentId: changedComment.id);
        }
      }
    } catch (e) {
      emit(CommentScreenError(message: e.toString()));
    }
  }

  void deleteComment({required int commentIndex}) async {
    try {
      if (state is CommentScreenLoaded) {
        final parsedState = (state as CommentScreenLoaded);
        final hasMore = parsedState.hasMore;
        List<Comment> commentList = [...parsedState.commentList];
        Comment comment = commentList[commentIndex];
        commentList.removeAt(commentIndex);
        emit(CommentScreenLoaded(
            commentList: commentList, hasMore: hasMore, isLoadingMore: false));
        await memberRepository.deleteComment(commentId: comment.id);
      }
    } catch (e) {
      emit(CommentScreenError(message: e.toString()));
    }
  }

  void updateComment({required int commentIndex, required String text}) async {}

  Future<void> createComment({required int postId, required text}) async {
    try {
      if (state is CommentScreenLoaded) {
        final parsedState = (state as CommentScreenLoaded);
        final hasMore = parsedState.hasMore;
        List<Comment> prevCommentList = [...parsedState.commentList];
        final Response response =
            await memberRepository.createComment(postId: postId, text: text);

        final List<Comment> uploadedCommentList = response.data['comment_list']
            .map<Comment>((e) => Comment.fromJson(e))
            .toList();

        final List<Comment> newCommentList = [
          ...prevCommentList,
          ...uploadedCommentList
        ];
        emit(CommentScreenLoaded(
            commentList: newCommentList,
            hasMore: hasMore,
            isLoadingMore: false));
      }
    } catch (e) {
      emit(CommentScreenError(message: e.toString()));
    }
  }
}
