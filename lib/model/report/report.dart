import 'package:freezed_annotation/freezed_annotation.dart';

part 'report.freezed.dart';
part 'report.g.dart';

@freezed
class Report with _$Report {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Report({
    required String createdAt,
    required int id,
    required String text,
    required int memberId,
  }) = _Report;

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
}
