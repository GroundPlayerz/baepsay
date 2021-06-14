import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Comment({
    required int id,
    required String profileName,
    required String? profilePhotoUrl,
    required int postId,
    required String text,
    required int likeCount,
    required int nestedCommentCount,
    required String createdAt,
    required String postTitle,
    String? updatedAt, //[nullable]
    required int memberLikeCount,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json); //all, follower, none
}
