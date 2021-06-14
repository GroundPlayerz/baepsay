import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/state/admin_scoring_state.dart';
import 'package:golden_balance_flutter/repository/admin_repository.dart';

class AdminScoringCubit extends Cubit<AdminScoringState> {
  final AdminRepository adminRepository;

  AdminScoringCubit({required this.adminRepository}) : super(Default());

  void scorePost() async {
    try {
      emit(Processing());
      final Response response = await adminRepository.scoreAllPost();
      final int scoringPostCount = response.data['scoring_post_count'];
      emit(Complete(scoringPostCount: scoringPostCount));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
