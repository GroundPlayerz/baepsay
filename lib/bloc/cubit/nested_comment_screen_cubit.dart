import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/state/nested_comment_screen_state.dart';
import 'package:golden_balance_flutter/model/nested_comment/nested_comment.dart';
import 'package:golden_balance_flutter/repository/comment_repository.dart';

import 'package:golden_balance_flutter/repository/user_repository.dart';

class NestedCommentScreenCubit extends Cubit<NestedCommentScreenState> {
  final CommentRepository commentRepository;
  final UserRepository userRepository;

  NestedCommentScreenCubit({
    required this.commentRepository,
    required this.userRepository,
  }) : super(Empty());

  void setEmptyState() {
    try {
      emit(Empty());
    } catch (e) {
      emit(NestedCommentPageError(message: e.toString()));
    }
  }

  void getNestedCommentList({required int commentId, int? idCursor}) async {
    try {
      List<NestedComment> prevNestedCommentList = [];
      if (state is NestedCommentPageLoaded) {
        final parsedState = (state as NestedCommentPageLoaded);
        prevNestedCommentList = [...parsedState.nestedCommentList];
      }
      emit(NestedCommentPageLoading());
      final Response response = await commentRepository.getNestedCommentList(
          commentId: commentId, idCursor: idCursor);
      //Todo: postman에서 형식 체크
      final List<NestedComment> nestedCommentList = response
          .data['nested_comment_list']
          .map<NestedComment>((e) => NestedComment.fromJson(e))
          .toList();

      final List<NestedComment> newNestedCommentList = [
        ...prevNestedCommentList,
        ...nestedCommentList
      ];
      emit(NestedCommentPageLoaded(nestedCommentList: newNestedCommentList));
    } catch (e) {
      emit(NestedCommentPageError(message: e.toString()));
    }
  }

  void pressLikeButton(
      {required int nestedCommentIndex, required int userLikeCount}) async {
    try {
      if (state is NestedCommentPageLoaded) {
        final parsedState = (state as NestedCommentPageLoaded);
        List<NestedComment> nestedCommentList = [
          ...parsedState.nestedCommentList
        ];

        NestedComment changedNestedComment;
        if (nestedCommentList[nestedCommentIndex].userLikeCount == 0) {
          changedNestedComment = nestedCommentList[nestedCommentIndex].copyWith(
              userLikeCount: 1,
              likeCount: nestedCommentList[nestedCommentIndex].likeCount + 1);
        } else {
          changedNestedComment = nestedCommentList[nestedCommentIndex].copyWith(
              userLikeCount: 0,
              likeCount: nestedCommentList[nestedCommentIndex].likeCount - 1);
        }
        nestedCommentList[nestedCommentIndex] = changedNestedComment;
        emit(NestedCommentPageLoaded(nestedCommentList: nestedCommentList));

        if (changedNestedComment.userLikeCount == 0) {
          await userRepository.cancelLikeNestedComment(
              nestedCommentId: changedNestedComment.id);
        } else {
          await userRepository.likeNestedComment(
              nestedCommentId: changedNestedComment.id);
        }
      }
    } catch (e) {
      emit(NestedCommentPageError(message: e.toString()));
    }
  }

  Future<void> createNestedComment(
      {required int commentId, required text}) async {
    try {
      if (state is NestedCommentPageLoaded) {
        final parsedState = (state as NestedCommentPageLoaded);
        List<NestedComment> prevNestedCommentList = [
          ...parsedState.nestedCommentList
        ];
        final Response response = await userRepository.createNestedComment(
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
        emit(NestedCommentPageLoaded(nestedCommentList: newNestedCommentList));
      }
    } catch (e) {
      emit(NestedCommentPageError(message: e.toString()));
    }
  }
}
