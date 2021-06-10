import 'package:freezed_annotation/freezed_annotation.dart';
part 'simple_post.freezed.dart';
part 'simple_post.g.dart';

@freezed
class SimplePost with _$SimplePost {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory SimplePost({
    required int id,
    required int authorId,
    required double score,
    required String title,
    required String firstContentText,
    required String secondContentText,
    required String createdAt,
  }) = _SimplePost;

  factory SimplePost.fromJson(Map<String, dynamic> json) =>
      _$SimplePostFromJson(json);
}
