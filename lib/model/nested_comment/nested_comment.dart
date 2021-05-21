import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:golden_balance_flutter/model/user/user.dart';

part 'nested_comment.freezed.dart';
part 'nested_comment.g.dart';

@freezed
class NestedComment with _$NestedComment {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory NestedComment({
    required int id,
    required User author,
    required int commentId,
    required String text,
    required int likeCount,
    required bool isLikeButtonPressed,
    required String createdAt,
    String? updatedAt, //[nullable]
  }) = _NestedComment;

  factory NestedComment.fromJson(Map<String, dynamic> json) =>
      _$NestedCommentFromJson(json); //all, follower, none
}
