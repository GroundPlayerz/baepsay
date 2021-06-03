import 'package:freezed_annotation/freezed_annotation.dart';

part 'reported_nested_comment.freezed.dart';
part 'reported_nested_comment.g.dart';

@freezed
class ReportedNestedComment with _$ReportedNestedComment {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory ReportedNestedComment({
    required int id,
    required int userId,
    required int commentId,
    required String text,
    required String createdAt,
    String? updatedAt, //[nullable]
    required int reportCount,
  }) = _ReportedNestedComment;

  factory ReportedNestedComment.fromJson(Map<String, dynamic> json) =>
      _$ReportedNestedCommentFromJson(json); //all, follower, none
}
