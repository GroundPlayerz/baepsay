// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reported_nested_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReportedNestedComment _$_$_ReportedNestedCommentFromJson(
    Map<String, dynamic> json) {
  return _$_ReportedNestedComment(
    id: json['id'] as int,
    memberId: json['member_id'] as int,
    commentId: json['comment_id'] as int,
    text: json['text'] as String,
    createdAt: json['created_at'] as String,
    updatedAt: json['updated_at'] as String?,
    reportCount: json['report_count'] as int,
  );
}

Map<String, dynamic> _$_$_ReportedNestedCommentToJson(
        _$_ReportedNestedComment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'member_id': instance.memberId,
      'comment_id': instance.commentId,
      'text': instance.text,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'report_count': instance.reportCount,
    };
