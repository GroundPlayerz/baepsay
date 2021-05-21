// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nested_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NestedComment _$_$_NestedCommentFromJson(Map<String, dynamic> json) {
  return _$_NestedComment(
    id: json['id'] as int,
    author: User.fromJson(json['author'] as Map<String, dynamic>),
    commentId: json['comment_id'] as int,
    text: json['text'] as String,
    likeCount: json['like_count'] as int,
    isLikeButtonPressed: json['is_like_button_pressed'] as bool,
    createdAt: json['created_at'] as String,
    updatedAt: json['updated_at'] as String?,
  );
}

Map<String, dynamic> _$_$_NestedCommentToJson(_$_NestedComment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'comment_id': instance.commentId,
      'text': instance.text,
      'like_count': instance.likeCount,
      'is_like_button_pressed': instance.isLikeButtonPressed,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
