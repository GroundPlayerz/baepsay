// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$_$_PostFromJson(Map<String, dynamic> json) {
  return _$_Post(
    id: json['id'] as int,
    author: User.fromJson(json['author'] as Map<String, dynamic>),
    title: json['title'] as String,
    firstContentText: json['first_content_text'] as String,
    secondContentText: json['second_content_text'] as String,
    likeCount: json['like_count'] as int,
    viewCount: json['view_count'] as int,
    firstContentVoteCount: json['first_content_vote_count'] as int,
    secondContentVoteCount: json['second_content_vote_count'] as int,
    isLikeButtonPressed: json['is_like_button_pressed'] as bool,
    isVoted: json['is_voted'] as bool,
    mediaList: (json['media_list'] as List<dynamic>)
        .map((e) => Media.fromJson(e as Map<String, dynamic>))
        .toList(),
    createdAt: json['created_at'] as String,
  );
}

Map<String, dynamic> _$_$_PostToJson(_$_Post instance) => <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'title': instance.title,
      'first_content_text': instance.firstContentText,
      'second_content_text': instance.secondContentText,
      'like_count': instance.likeCount,
      'view_count': instance.viewCount,
      'first_content_vote_count': instance.firstContentVoteCount,
      'second_content_vote_count': instance.secondContentVoteCount,
      'is_like_button_pressed': instance.isLikeButtonPressed,
      'is_voted': instance.isVoted,
      'media_list': instance.mediaList,
      'created_at': instance.createdAt,
    };

_$_Media _$_$_MediaFromJson(Map<String, dynamic> json) {
  return _$_Media(
    id: json['id'] as int,
    postId: json['post_id'] as int,
    type: json['type'] as String,
    contentOrder: json['content_order'] as int,
    url: json['url'] as String,
    size: (json['size'] as num).toDouble(),
  );
}

Map<String, dynamic> _$_$_MediaToJson(_$_Media instance) => <String, dynamic>{
      'id': instance.id,
      'post_id': instance.postId,
      'type': instance.type,
      'content_order': instance.contentOrder,
      'url': instance.url,
      'size': instance.size,
    };
