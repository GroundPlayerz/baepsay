import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/state/nested_comment_screen_state.dart';
import 'package:golden_balance_flutter/model/nested_comment/nested_comment.dart';
import 'package:golden_balance_flutter/repository/comment_repository.dart';

import 'package:golden_balance_flutter/repository/member_repository.dart';

class NestedCommentScreenCubit extends Cubit<NestedCommentScreenState> {
  final CommentRepository commentRepository;
  final MemberRepository memberRepository;

  NestedCommentScreenCubit({
    required this.commentRepository,
    required this.memberRepository,
  }) : super(Empty());

  void setEmptyState() {
    try {
      emit(Empty());
    } catch (e) {
      emit(NestedCommentScreenError(message: e.toString()));
    }
  }

  void getInitialNestedCommentList({required int commentId}) async {
    try {
      emit(NestedCommentScreenInitialLoading());
      final Response response =
          await commentRepository.getNestedCommentList(commentId: commentId);
      final List<NestedComment> nestedCommentList = response
          .data['nested_comment_list']
          .map<NestedComment>((e) => NestedComment.fromJson(e))
          .toList();

      final List<NestedComment> newNestedCommentList = [...nestedCommentList];
      bool hasMore = false;
      if (nestedCommentList.isNotEmpty) {
        hasMore = true;
      }
      emit(NestedCommentScreenLoaded(
          nestedCommentList: newNestedCommentList,
          hasMore: hasMore,
          isLoadingMore: false));
    } catch (e) {
      emit(NestedCommentScreenError(message: e.toString()));
    }
  }

  void getNestedCommentList({required int commentId}) async {
    if (state is NestedCommentScreenLoaded) {
      try {
        final parsedState = (state as NestedCommentScreenLoaded);
        final prevNestedCommentList = [...parsedState.nestedCommentList];
        final prevHasMore = parsedState.hasMore;

        emit(NestedCommentScreenLoaded(
            nestedCommentList: prevNestedCommentList,
            hasMore: prevHasMore,
            isLoadingMore: true));

        final idCursor = prevNestedCommentList.last.id;

        final Response response = await commentRepository.getNestedCommentList(
            commentId: commentId, idCursor: idCursor);
        final List<NestedComment> nestedCommentList = response
            .data['nested_comment_list']
            .map<NestedComment>((e) => NestedComment.fromJson(e))
            .toList();

        final bool changedHasMore = nestedCommentList.isNotEmpty ? true : false;
        final List<NestedComment> newNestedCommentList = [
          ...prevNestedCommentList,
          ...nestedCommentList
        ];
        emit(NestedCommentScreenLoaded(
            nestedCommentList: newNestedCommentList,
            hasMore: changedHasMore,
            isLoadingMore: false));
      } catch (e) {
        emit(NestedCommentScreenError(message: e.toString()));
      }
    }
  }

  void pressLikeButton(
      {required int nestedCommentIndex, required int userLikeCount}) async {
    try {
      if (state is NestedCommentScreenLoaded) {
        final parsedState = (state as NestedCommentScreenLoaded);
        final hasMore = parsedState.hasMore;
        List<NestedComment> nestedCommentList = [
          ...parsedState.nestedCommentList
        ];

        NestedComment changedNestedComment;
        if (nestedCommentList[nestedCommentIndex].memberLikeCount == 0) {
          changedNestedComment = nestedCommentList[nestedCommentIndex].copyWith(
              memberLikeCount: 1,
              likeCount: nestedCommentList[nestedCommentIndex].likeCount + 1);
        } else {
          changedNestedComment = nestedCommentList[nestedCommentIndex].copyWith(
              memberLikeCount: 0,
              likeCount: nestedCommentList[nestedCommentIndex].likeCount - 1);
        }
        nestedCommentList[nestedCommentIndex] = changedNestedComment;
        emit(NestedCommentScreenLoaded(
            nestedCommentList: nestedCommentList,
            hasMore: hasMore,
            isLoadingMore: false));

        if (changedNestedComment.memberLikeCount == 0) {
          await memberRepository.cancelLikeNestedComment(
              nestedCommentId: changedNestedComment.id);
        } else {
          await memberRepository.likeNestedComment(
              nestedCommentId: changedNestedComment.id);
        }
      }
    } catch (e) {
      emit(NestedCommentScreenError(message: e.toString()));
    }
  }

  void deleteNestedComment({required int nestedCommentIndex}) async {
    try {
      if (state is NestedCommentScreenLoaded) {
        final parsedState = (state as NestedCommentScreenLoaded);
        final hasMore = parsedState.hasMore;
        List<NestedComment> commentList = [...parsedState.nestedCommentList];
        NestedComment comment = commentList[nestedCommentIndex];
        commentList.removeAt(nestedCommentIndex);
        emit(NestedCommentScreenLoaded(
            nestedCommentList: commentList,
            hasMore: hasMore,
            isLoadingMore: false));
        await memberRepository.deleteNestedComment(nestedCommentId: comment.id);
      }
    } catch (e) {
      emit(NestedCommentScreenError(message: e.toString()));
    }
  }

  void updateNestedComment(
      {required int nestedCommentIndex, required String text}) async {
    try {
      if (state is NestedCommentScreenLoaded) {
        final parsedState = (state as NestedCommentScreenLoaded);
        final hasMore = parsedState.hasMore;
        List<NestedComment> nestedCommentList = [
          ...parsedState.nestedCommentList
        ];

        NestedComment changedNestedComment =
            nestedCommentList[nestedCommentIndex].copyWith(text: text);
        nestedCommentList[nestedCommentIndex] = changedNestedComment;
        emit(NestedCommentScreenLoaded(
            nestedCommentList: nestedCommentList,
            hasMore: hasMore,
            isLoadingMore: false));
        await memberRepository.updateNestedComment(
            nestedCommentId: changedNestedComment.id, text: text);
      }
    } catch (e) {
      emit(NestedCommentScreenError(message: e.toString()));
    }
  }

  Future<void> createNestedComment(
      {required int commentId, required text}) async {
    try {
      if (state is NestedCommentScreenLoaded) {
        final parsedState = (state as NestedCommentScreenLoaded);
        final hasMore = parsedState.hasMore;
        List<NestedComment> prevNestedCommentList = [
          ...parsedState.nestedCommentList
        ];
        final Response response = await memberRepository.createNestedComment(
            commentId: commentId, text: text);

        final List<NestedComment> uploadedNestedCommentList = response
            .data['nested_comment_list']
            .map<NestedComment>((e) => NestedComment.fromJson(e))
            .toList();
        ;

        final List<NestedComment> newNestedCommentList = [
          ...prevNestedCommentList,
          ...uploadedNestedCommentList
        ];
        emit(NestedCommentScreenLoaded(
            nestedCommentList: newNestedCommentList,
            hasMore: hasMore,
            isLoadingMore: false));
      }
    } catch (e) {
      emit(NestedCommentScreenError(message: e.toString()));
    }
  }
}
