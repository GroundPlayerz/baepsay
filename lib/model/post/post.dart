import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:golden_balance_flutter/model/user/user.dart';
part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Post({
    required int id,
    required User author,
    required String title,
    required String firstContentText,
    required String secondContentText,
    required int likeCount,
    required int viewCount,
    required int firstContentVoteCount,
    required int secondContentVoteCount,
    required bool isLikeButtonPressed,
    Media? firstContentMedia,
    Media? secondContentMedia,
    required String createdAt,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

@freezed
class Media with _$Media {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Media({
    required int id,
    required int postId,
    required String type, //video, image
    required int contentOrder,
    required String url,
    required double size,
    double? length,
  }) = _Media;

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
}
