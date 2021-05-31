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
    required int commentCount,
    required int likeCount,
    required int viewCount,
    required int firstContentVoteCount,
    required int secondContentVoteCount,
    required bool isLikeButtonPressed,
    required bool isVoted,
    required List<ImageMedia>? imageMediaList,
    required List<VideoMedia>? videoMediaList,
    required String createdAt,
    Vote? vote,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

@freezed
class Vote with _$Vote {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Vote({
    required int id,
    required int postId,
    required int choice,
    required int userId,
    required String createdAt,
  }) = _Vote;

  factory Vote.fromJson(Map<String, dynamic> json) => _$VoteFromJson(json);
}

@freezed
class ImageMedia with _$ImageMedia {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory ImageMedia({
    required int id,
    required int postId,
    required String type, //video, image, thumbnail
    required int contentOrder,
    required String url,
    required double size,
  }) = _ImageMedia;

  factory ImageMedia.fromJson(Map<String, dynamic> json) =>
      _$ImageMediaFromJson(json);
}

@freezed
class VideoMedia with _$VideoMedia {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory VideoMedia({
    required int id,
    required int postId,
    required String type, //video, image, thumbnail
    required int contentOrder,
    required String url,
    required double size,
    required ImageMedia thumbnail,
  }) = _VideoMedia;

  factory VideoMedia.fromJson(Map<String, dynamic> json) =>
      _$VideoMediaFromJson(json);
}
