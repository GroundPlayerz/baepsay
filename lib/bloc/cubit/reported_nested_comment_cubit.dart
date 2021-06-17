import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/state/reported_nested_comment_state.dart';
import 'package:golden_balance_flutter/model/nested_comment/reported_nested_comment.dart';
import 'package:golden_balance_flutter/model/report/report.dart';
import 'package:golden_balance_flutter/repository/admin_repository.dart';

class ReportedNestedCommentCubit extends Cubit<ReportedNestedCommentState> {
  final AdminRepository adminRepository;

  ReportedNestedCommentCubit({required this.adminRepository}) : super(Empty());

  void getInitialReportedNestedComment() async {
    try {
      emit(Loading());
      final Response response =
          await adminRepository.getReportedNestedComment();
      final feed = response.data['result']
          .map<ReportedNestedComment>((e) => ReportedNestedComment.fromJson(e))
          .toList();

      final List<ReportedNestedComment> newFeed = [...feed];
      bool hasMore = false;
      if (newFeed.isNotEmpty) {
        hasMore = true;
      }

      emit(Loaded(feed: newFeed, hasMore: hasMore, isLoadingMore: false));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  void getReportedNestedComment() async {
    try {
      List<ReportedNestedComment> prevFeed = [];
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
      final Response response = await adminRepository.getReportedNestedComment(
          idCursor: idCursor, reportCountCursor: reportCountCursor);
      final feed = response.data['result']
          .map<ReportedNestedComment>((e) => ReportedNestedComment.fromJson(e))
          .toList();

      final List<ReportedNestedComment> newFeed = [...prevFeed, ...feed];

      emit(Loaded(
          feed: newFeed,
          hasMore: feed.isNotEmpty ? true : false,
          isLoadingMore: false));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  Future<List<Report>?> getNestedCommentDetailReport(
      {required int nestedCommentId}) async {
    try {
      final Response response = await adminRepository
          .getNestedCommentDetailReport(nestedCommentId: nestedCommentId);
      final List<Report> reportList = response.data['result']
          .map<Report>((e) => Report.fromJson(e))
          .toList();
      return reportList;
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
