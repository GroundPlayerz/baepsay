import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/state/reported_comment_state.dart';
import 'package:golden_balance_flutter/model/comment/reported_comment.dart';
import 'package:golden_balance_flutter/model/report/report.dart';
import 'package:golden_balance_flutter/repository/admin_repository.dart';

class ReportedCommentCubit extends Cubit<ReportedCommentState> {
  final AdminRepository adminRepository;

  ReportedCommentCubit({required this.adminRepository}) : super(Empty());

  void getInitialReportedComment() async {
    try {
      emit(Loading());
      final Response response = await adminRepository.getReportedComment();
      final feed = response.data['result']
          .map<ReportedComment>((e) => ReportedComment.fromJson(e))
          .toList();

      final List<ReportedComment> newFeed = [...feed];
      bool hasMore = false;
      if (newFeed.isNotEmpty) {
        hasMore = true;
      }

      emit(Loaded(feed: newFeed, hasMore: hasMore, isLoadingMore: false));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  void getReportedComment() async {
    try {
      List<ReportedComment> prevFeed = [];
      if (state is Loaded) {
        final parsedState = (state as Loaded);
        prevFeed = [...parsedState.feed];
      }
      emit(Loaded(
          feed: prevFeed,
          hasMore: prevFeed.isNotEmpty ? true : false,
          isLoadingMore: true));
      final reportCountCursor = prevFeed.last.reportCount;
      final idCursor = prevFeed.last.id;
      final Response response = await adminRepository.getReportedComment(
          idCursor: idCursor, reportCountCursor: reportCountCursor);
      final feed = response.data['result']
          .map<ReportedComment>((e) => ReportedComment.fromJson(e))
          .toList();

      final List<ReportedComment> newFeed = [...prevFeed, ...feed];

      emit(Loaded(
          feed: newFeed,
          hasMore: feed.isNotEmpty ? true : false,
          isLoadingMore: false));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  Future<List<Report>?> getCommentReport({required int commentId}) async {
    try {
      final Response response =
          await adminRepository.getCommentReport(commentId: commentId);
      final List<Report> reportList = response.data['result']
          .map<Report>((e) => Report.fromJson(e))
          .toList();
      return reportList;
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
