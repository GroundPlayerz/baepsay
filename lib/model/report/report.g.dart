// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Report _$_$_ReportFromJson(Map<String, dynamic> json) {
  return _$_Report(
    createdAt: json['created_at'] as String,
    id: json['id'] as int,
    text: json['text'] as String,
    userId: json['user_id'] as int,
  );
}

Map<String, dynamic> _$_$_ReportToJson(_$_Report instance) => <String, dynamic>{
      'created_at': instance.createdAt,
      'id': instance.id,
      'text': instance.text,
      'user_id': instance.userId,
    };
