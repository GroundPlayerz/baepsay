import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory User({
    required int id,
    String? email,
    required String profileName,
    String? profilePhotoUrl,
    required String role, //admin, general_free, general_paid, expert
    required String createdAt,
    String? updatedAt, //[nullable]
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json); //all, follower, none
}
