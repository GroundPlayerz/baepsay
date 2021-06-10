import 'package:freezed_annotation/freezed_annotation.dart';

part 'nested_comment.freezed.dart';
part 'nested_comment.g.dart';

@freezed
class NestedComment with _$NestedComment {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory NestedComment({
    required int id,
    required String profileName,
    required String? profilePhotoUrl,
    required int commentId,
    required String text,
    required int likeCount,
    required String createdAt,
    String? updatedAt, //[nullable]
    required int memberLikeCount,
  }) = _NestedComment;

  factory NestedComment.fromJson(Map<String, dynamic> json) =>
      _$NestedCommentFromJson(json); //all, follower, none
}
