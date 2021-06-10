import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/state/my_comment_state.dart';
import 'package:golden_balance_flutter/model/comment/comment.dart';
import 'package:golden_balance_flutter/repository/member_repository.dart';

class MyCommentCubit extends Cubit<MyCommentState> {
  final MemberRepository memberRepository;

  MyCommentCubit({required this.memberRepository}) : super(Empty());

  void getInitialCommentList() async {
    try {
      emit(Loading());
      final Response response = await memberRepository.getMyComment();
      final commentList = response.data['comment_list']
          .map<Comment>((e) => Comment.fromJson(e))
          .toList();

      final List<Comment> newCommentList = [...commentList];
      bool hasMore = false;
      if (newCommentList.isNotEmpty) {
        hasMore = true;
      }
      emit(Loaded(
          commentList: newCommentList, hasMore: hasMore, isLoadingMore: false));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  void getCommentList() async {
    try {
      List<Comment> prevCommentList = [];
      if (state is Loaded) {
        final parsedState = (state as Loaded);
        prevCommentList = [...parsedState.commentList];
      }
      final idCursor = prevCommentList.last.id;
      final Response response =
          await memberRepository.getMyComment(idCursor: idCursor);
      final List<Comment> commentList = response.data['comment_list']
          .map<Comment>((e) => Comment.fromJson(e))
          .toList();

      final List<Comment> newCommentList = [...prevCommentList, ...commentList];

      emit(Loaded(
          commentList: newCommentList,
          hasMore: commentList.isNotEmpty ? true : false,
          isLoadingMore: false));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
