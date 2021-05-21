// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Comment _$_$_CommentFromJson(Map<String, dynamic> json) {
  return _$_Comment(
    id: json['id'] as int,
    author: User.fromJson(json['author'] as Map<String, dynamic>),
    postId: json['post_id'] as int,
    text: json['text'] as String,
    likeCount: json['like_count'] as int,
    isLikeButtonPressed: json['is_like_button_pressed'] as bool,
    nestedCommentCount: json['nested_comment_count'] as int,
    createdAt: json['created_at'] as String,
    updatedAt: json['updated_at'] as String?,
  );
}

Map<String, dynamic> _$_$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'post_id': instance.postId,
      'text': instance.text,
      'like_count': instance.likeCount,
      'is_like_button_pressed': instance.isLikeButtonPressed,
      'nested_comment_count': instance.nestedCommentCount,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
