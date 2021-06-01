import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_balance_flutter/bloc/state/comment_screen_state.dart';
import 'package:golden_balance_flutter/repository/user_repository.dart';

class CommentScreenCubit extends Cubit<CommentScreenState> {
  final PostRepository postRepository;
  final UserRepository userRepository;

  CommentScreenCubit({
    required PostRepository postRepository,
    required UserRepository userRepository,
  }) : super(Empty());
}
