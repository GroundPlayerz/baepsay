import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/state/reported_post_state.dart';
import 'package:golden_balance_flutter/repository/admin_repository.dart';

class ReportedCommentCubit extends Cubit<ReportedPostState> {
  final AdminRepository adminRepository;

  ReportedCommentCubit({required this.adminRepository}) : super(Empty());
}
