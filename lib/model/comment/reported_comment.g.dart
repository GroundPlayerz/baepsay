// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reported_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReportedComment _$_$_ReportedCommentFromJson(Map<String, dynamic> json) {
  return _$_ReportedComment(
    id: json['id'] as int,
    memberId: json['member_id'] as int,
    postId: json['post_id'] as int,
    text: json['text'] as String,
    createdAt: json['created_at'] as String,
    reportCount: json['report_count'] as int,
    updatedAt: json['updated_at'] as String?,
  );
}

Map<String, dynamic> _$_$_ReportedCommentToJson(_$_ReportedComment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'member_id': instance.memberId,
      'post_id': instance.postId,
      'text': instance.text,
      'created_at': instance.createdAt,
      'report_count': instance.reportCount,
      'updated_at': instance.updatedAt,
    };
