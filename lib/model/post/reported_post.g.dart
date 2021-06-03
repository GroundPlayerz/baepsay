// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reported_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReportedPost _$_$_ReportedPostFromJson(Map<String, dynamic> json) {
  return _$_ReportedPost(
    id: json['id'] as int,
    authorId: json['author_id'] as int,
    score: (json['score'] as num).toDouble(),
    title: json['title'] as String,
    firstContentText: json['first_content_text'] as String,
    secondContentText: json['second_content_text'] as String,
    createdAt: json['created_at'] as String,
    reportCount: json['report_count'] as int,
  );
}

Map<String, dynamic> _$_$_ReportedPostToJson(_$_ReportedPost instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author_id': instance.authorId,
      'score': instance.score,
      'title': instance.title,
      'first_content_text': instance.firstContentText,
      'second_content_text': instance.secondContentText,
      'created_at': instance.createdAt,
      'report_count': instance.reportCount,
    };
