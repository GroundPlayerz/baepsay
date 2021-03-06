import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/state/report_state.dart';
import 'package:golden_balance_flutter/repository/member_repository.dart';

class ReportCubit extends Cubit<ReportState> {
  final MemberRepository memberRepository;

  ReportCubit({required this.memberRepository}) : super(Default());

  void setDefaultState() {
    emit(Default());
  }

  void reportPost({required int postId, required String text}) async {
    try {
      await memberRepository.reportPost(postId: postId, text: text);
      emit(Success());
    } catch (e) {
      emit(Error());
    }
  }

  void reportComment({required int commentId, required String text}) async {
    try {
      await memberRepository.reportComment(commentId: commentId, text: text);
      emit(Success());
    } catch (e) {
      emit(Error());
    }
  }

  void reportNestedComment(
      {required int nestedCommentId, required String text}) async {
    try {
      await memberRepository.reportNestedComment(
          nestedCommentId: nestedCommentId, text: text);
      emit(Success());
    } catch (e) {
      emit(Error());
    }
  }
}
