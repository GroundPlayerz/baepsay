import 'package:freezed_annotation/freezed_annotation.dart';

part 'member.freezed.dart';
part 'member.g.dart';

@freezed
class Member with _$Member {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Member({
    required int id,
    String? email,
    required String profileName,
    String? profilePhotoUrl,
    required String role, //admin, general_free, general_paid, expert
    required String createdAt,
    String? updatedAt, //[nullable]
  }) = _Member;

  factory Member.fromJson(Map<String, dynamic> json) =>
      _$MemberFromJson(json); //all, follower, none
}
