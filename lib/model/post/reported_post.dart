import 'package:freezed_annotation/freezed_annotation.dart';
part 'reported_post.freezed.dart';
part 'reported_post.g.dart';

@freezed
class ReportedPost with _$ReportedPost {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory ReportedPost({
    required int id,
    required int authorId,
    required double score,
    required String title,
    required String firstContentText,
    required String secondContentText,
    required String createdAt,
    required int reportCount,
  }) = _ReportedPost;

  factory ReportedPost.fromJson(Map<String, dynamic> json) =>
      _$ReportedPostFromJson(json);
}
