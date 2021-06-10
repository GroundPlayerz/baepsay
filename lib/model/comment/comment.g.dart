// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Comment _$_$_CommentFromJson(Map<String, dynamic> json) {
  return _$_Comment(
    id: json['id'] as int,
    profileName: json['profile_name'] as String,
    profilePhotoUrl: json['profile_photo_url'] as String?,
    postId: json['post_id'] as int,
    text: json['text'] as String,
    likeCount: json['like_count'] as int,
    nestedCommentCount: json['nested_comment_count'] as int,
    createdAt: json['created_at'] as String,
    updatedAt: json['updated_at'] as String?,
    memberLikeCount: json['member_like_count'] as int,
  );
}

Map<String, dynamic> _$_$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profile_name': instance.profileName,
      'profile_photo_url': instance.profilePhotoUrl,
      'post_id': instance.postId,
      'text': instance.text,
      'like_count': instance.likeCount,
      'nested_comment_count': instance.nestedCommentCount,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'member_like_count': instance.memberLikeCount,
    };
