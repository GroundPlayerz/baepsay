import 'package:freezed_annotation/freezed_annotation.dart';

part 'reported_comment.freezed.dart';
part 'reported_comment.g.dart';

@freezed
class ReportedComment with _$ReportedComment {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory ReportedComment({
    required int id,
    required int memberId,
    required int postId,
    required String text,
    required String createdAt,
    required int reportCount,
    String? updatedAt,
  }) = _ReportedComment;

  factory ReportedComment.fromJson(Map<String, dynamic> json) =>
      _$ReportedCommentFromJson(json); //all, follower, none
}
