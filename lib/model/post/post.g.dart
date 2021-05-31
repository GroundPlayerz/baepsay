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
    commentCount: json['comment_count'] as int,
    likeCount: json['like_count'] as int,
    viewCount: json['view_count'] as int,
    firstContentVoteCount: json['first_content_vote_count'] as int,
    secondContentVoteCount: json['second_content_vote_count'] as int,
    isLikeButtonPressed: json['is_like_button_pressed'] as bool,
    isVoted: json['is_voted'] as bool,
    imageMediaList: (json['image_media_list'] as List<dynamic>?)
        ?.map((e) => ImageMedia.fromJson(e as Map<String, dynamic>))
        .toList(),
    videoMediaList: (json['video_media_list'] as List<dynamic>?)
        ?.map((e) => VideoMedia.fromJson(e as Map<String, dynamic>))
        .toList(),
    createdAt: json['created_at'] as String,
    vote: json['vote'] == null
        ? null
        : Vote.fromJson(json['vote'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_PostToJson(_$_Post instance) => <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'title': instance.title,
      'first_content_text': instance.firstContentText,
      'second_content_text': instance.secondContentText,
      'comment_count': instance.commentCount,
      'like_count': instance.likeCount,
      'view_count': instance.viewCount,
      'first_content_vote_count': instance.firstContentVoteCount,
      'second_content_vote_count': instance.secondContentVoteCount,
      'is_like_button_pressed': instance.isLikeButtonPressed,
      'is_voted': instance.isVoted,
      'image_media_list': instance.imageMediaList,
      'video_media_list': instance.videoMediaList,
      'created_at': instance.createdAt,
      'vote': instance.vote,
    };

_$_Vote _$_$_VoteFromJson(Map<String, dynamic> json) {
  return _$_Vote(
    id: json['id'] as int,
    postId: json['post_id'] as int,
    choice: json['choice'] as int,
    userId: json['user_id'] as int,
    createdAt: json['created_at'] as String,
  );
}

Map<String, dynamic> _$_$_VoteToJson(_$_Vote instance) => <String, dynamic>{
      'id': instance.id,
      'post_id': instance.postId,
      'choice': instance.choice,
      'user_id': instance.userId,
      'created_at': instance.createdAt,
    };

_$_ImageMedia _$_$_ImageMediaFromJson(Map<String, dynamic> json) {
  return _$_ImageMedia(
    id: json['id'] as int,
    postId: json['post_id'] as int,
    type: json['type'] as String,
    contentOrder: json['content_order'] as int,
    url: json['url'] as String,
    size: (json['size'] as num).toDouble(),
  );
}

Map<String, dynamic> _$_$_ImageMediaToJson(_$_ImageMedia instance) =>
    <String, dynamic>{
      'id': instance.id,
      'post_id': instance.postId,
      'type': instance.type,
      'content_order': instance.contentOrder,
      'url': instance.url,
      'size': instance.size,
    };

_$_VideoMedia _$_$_VideoMediaFromJson(Map<String, dynamic> json) {
  return _$_VideoMedia(
    id: json['id'] as int,
    postId: json['post_id'] as int,
    type: json['type'] as String,
    contentOrder: json['content_order'] as int,
    url: json['url'] as String,
    size: (json['size'] as num).toDouble(),
    thumbnail: ImageMedia.fromJson(json['thumbnail'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_VideoMediaToJson(_$_VideoMedia instance) =>
    <String, dynamic>{
      'id': instance.id,
      'post_id': instance.postId,
      'type': instance.type,
      'content_order': instance.contentOrder,
      'url': instance.url,
      'size': instance.size,
      'thumbnail': instance.thumbnail,
    };
