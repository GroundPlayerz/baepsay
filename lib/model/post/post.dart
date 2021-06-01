import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:golden_balance_flutter/model/user/user.dart';
part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Post({
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
    required int userLikeCount,
    required int? userVoteChoice,
    required String createdAt,
    required String? mediaContentOrders,
    required String? mediaTypes,
    required String? mediaUrls,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
