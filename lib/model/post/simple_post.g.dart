// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SimplePost _$_$_SimplePostFromJson(Map<String, dynamic> json) {
  return _$_SimplePost(
    id: json['id'] as int,
    authorId: json['author_id'] as int,
    score: (json['score'] as num).toDouble(),
    title: json['title'] as String,
    firstContentText: json['first_content_text'] as String,
    secondContentText: json['second_content_text'] as String,
    createdAt: json['created_at'] as String,
  );
}

Map<String, dynamic> _$_$_SimplePostToJson(_$_SimplePost instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author_id': instance.authorId,
      'score': instance.score,
      'title': instance.title,
      'first_content_text': instance.firstContentText,
      'second_content_text': instance.secondContentText,
      'created_at': instance.createdAt,
    };
