// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_feed_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AdminFeedPost _$_$_AdminFeedPostFromJson(Map<String, dynamic> json) {
  return _$_AdminFeedPost(
    id: json['id'] as int,
    authorId: json['author_id'] as int,
    score: (json['score'] as num).toDouble(),
    profileName: json['profile_name'] as String,
    title: json['title'] as String,
    firstContentText: json['first_content_text'] as String,
    secondContentText: json['second_content_text'] as String,
    commentCount: json['comment_count'] as int,
    likeCount: json['like_count'] as int,
    viewCount: json['view_count'] as int,
    firstContentVoteCount: json['first_content_vote_count'] as int,
    secondContentVoteCount: json['second_content_vote_count'] as int,
    createdAt: json['created_at'] as String,
    mediaContentOrders: json['media_content_orders'] as String?,
    mediaTypes: json['media_types'] as String?,
    mediaUrls: json['media_urls'] as String?,
  );
}

Map<String, dynamic> _$_$_AdminFeedPostToJson(_$_AdminFeedPost instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author_id': instance.authorId,
      'score': instance.score,
      'profile_name': instance.profileName,
      'title': instance.title,
      'first_content_text': instance.firstContentText,
      'second_content_text': instance.secondContentText,
      'comment_count': instance.commentCount,
      'like_count': instance.likeCount,
      'view_count': instance.viewCount,
      'first_content_vote_count': instance.firstContentVoteCount,
      'second_content_vote_count': instance.secondContentVoteCount,
      'created_at': instance.createdAt,
      'media_content_orders': instance.mediaContentOrders,
      'media_types': instance.mediaTypes,
      'media_urls': instance.mediaUrls,
    };
