import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/state/reported_post_state.dart';
import 'package:golden_balance_flutter/model/post/reported_post.dart';
import 'package:golden_balance_flutter/model/report/report.dart';
import 'package:golden_balance_flutter/repository/admin_repository.dart';

class ReportedPostCubit extends Cubit<ReportedPostState> {
  final AdminRepository adminRepository;

  ReportedPostCubit({required this.adminRepository}) : super(Empty());

  void getInitialReportedPost() async {
    try {
      emit(Loading());
      final Response response = await adminRepository.getReportedPost();
      final feed = response.data['result']
          .map<ReportedPost>((e) => ReportedPost.fromJson(e))
          .toList();

      final List<ReportedPost> newFeed = [...feed];
      bool hasMore = false;
      if (newFeed.isNotEmpty) {
        hasMore = true;
      }

      emit(Loaded(feed: newFeed, hasMore: hasMore, isLoadingMore: false));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  void getReportedPost() async {
    try {
      List<ReportedPost> prevFeed = [];
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
      final Response response = await adminRepository.getReportedPost(
          idCursor: idCursor, reportCountCursor: reportCountCursor);
      final feed = response.data['result']
          .map<ReportedPost>((e) => ReportedPost.fromJson(e))
          .toList();

      final List<ReportedPost> newFeed = [...prevFeed, ...feed];

      emit(Loaded(
          feed: newFeed,
          hasMore: feed.isNotEmpty ? true : false,
          isLoadingMore: false));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  Future<List<Report>?> getPostDetailReport({required int postId}) async {
    try {
      final Response response =
          await adminRepository.getPostDetailReport(postId: postId);
      final List<Report> reportList = response.data['result']
          .map<Report>((e) => Report.fromJson(e))
          .toList();
      return reportList;
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
