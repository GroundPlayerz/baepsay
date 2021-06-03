import 'package:freezed_annotation/freezed_annotation.dart';
part 'admin_feed_post.freezed.dart';
part 'admin_feed_post.g.dart';

@freezed
class AdminFeedPost with _$AdminFeedPost {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory AdminFeedPost({
    required int id,
    required int authorId,
    required double score,
    required String profileName,
    required String title,
    required String firstContentText,
    required String secondContentText,
    required int commentCount,
    required int likeCount,
    required int viewCount,
    required int firstContentVoteCount,
    required int secondContentVoteCount,
    required String createdAt,
    required String? mediaContentOrders,
    required String? mediaTypes,
    required String? mediaUrls,
  }) = _AdminFeedPost;

  factory AdminFeedPost.fromJson(Map<String, dynamic> json) =>
      _$AdminFeedPostFromJson(json);
}
