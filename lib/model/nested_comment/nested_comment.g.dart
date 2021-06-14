// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nested_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NestedComment _$_$_NestedCommentFromJson(Map<String, dynamic> json) {
  return _$_NestedComment(
    id: json['id'] as int,
    profileName: json['profile_name'] as String,
    profilePhotoUrl: json['profile_photo_url'] as String?,
    memberId: json['member_id'] as int,
    commentId: json['comment_id'] as int,
    text: json['text'] as String,
    likeCount: json['like_count'] as int,
    createdAt: json['created_at'] as String,
    updatedAt: json['updated_at'] as String?,
    memberLikeCount: json['member_like_count'] as int,
  );
}

Map<String, dynamic> _$_$_NestedCommentToJson(_$_NestedComment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profile_name': instance.profileName,
      'profile_photo_url': instance.profilePhotoUrl,
      'member_id': instance.memberId,
      'comment_id': instance.commentId,
      'text': instance.text,
      'like_count': instance.likeCount,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'member_like_count': instance.memberLikeCount,
    };
