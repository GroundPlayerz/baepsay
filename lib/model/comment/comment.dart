import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:golden_balance_flutter/model/user/user.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Comment({
    required int id,
    required User author,
    required int postId,
    required String text,
    required int likeCount,
    required bool isLikeButtonPressed,
    required int nestedCommentCount,
    required String createdAt,
    String? updatedAt, //[nullable]
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json); //all, follower, none
}
