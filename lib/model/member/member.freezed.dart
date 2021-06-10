// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Member _$MemberFromJson(Map<String, dynamic> json) {
  return _Member.fromJson(json);
}

/// @nodoc
class _$MemberTearOff {
  const _$MemberTearOff();

  _Member call(
      {required int id,
      String? email,
      required String profileName,
      String? profilePhotoUrl,
      required String role,
      required String createdAt,
      String? updatedAt}) {
    return _Member(
      id: id,
      email: email,
      profileName: profileName,
      profilePhotoUrl: profilePhotoUrl,
      role: role,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  Member fromJson(Map<String, Object> json) {
    return Member.fromJson(json);
  }
}

/// @nodoc
const $Member = _$MemberTearOff();

/// @nodoc
mixin _$Member {
  int get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String get profileName => throw _privateConstructorUsedError;
  String? get profilePhotoUrl => throw _privateConstructorUsedError;
  String get role =>
      throw _privateConstructorUsedError; //admin, general_free, general_paid, expert
  String get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberCopyWith<Member> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberCopyWith<$Res> {
  factory $MemberCopyWith(Member value, $Res Function(Member) then) =
      _$MemberCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String? email,
      String profileName,
      String? profilePhotoUrl,
      String role,
      String createdAt,
      String? updatedAt});
}

/// @nodoc
class _$MemberCopyWithImpl<$Res> implements $MemberCopyWith<$Res> {
  _$MemberCopyWithImpl(this._value, this._then);

  final Member _value;
  // ignore: unused_field
  final $Res Function(Member) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? profileName = freezed,
    Object? profilePhotoUrl = freezed,
    Object? role = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      profileName: profileName == freezed
          ? _value.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhotoUrl: profilePhotoUrl == freezed
          ? _value.profilePhotoUrl
          : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$MemberCopyWith<$Res> implements $MemberCopyWith<$Res> {
  factory _$MemberCopyWith(_Member value, $Res Function(_Member) then) =
      __$MemberCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String? email,
      String profileName,
      String? profilePhotoUrl,
      String role,
      String createdAt,
      String? updatedAt});
}

/// @nodoc
class __$MemberCopyWithImpl<$Res> extends _$MemberCopyWithImpl<$Res>
    implements _$MemberCopyWith<$Res> {
  __$MemberCopyWithImpl(_Member _value, $Res Function(_Member) _then)
      : super(_value, (v) => _then(v as _Member));

  @override
  _Member get _value => super._value as _Member;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? profileName = freezed,
    Object? profilePhotoUrl = freezed,
    Object? role = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_Member(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      profileName: profileName == freezed
          ? _value.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhotoUrl: profilePhotoUrl == freezed
          ? _value.profilePhotoUrl
          : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Member implements _Member {
  _$_Member(
      {required this.id,
      this.email,
      required this.profileName,
      this.profilePhotoUrl,
      required this.role,
      required this.createdAt,
      this.updatedAt});

  factory _$_Member.fromJson(Map<String, dynamic> json) =>
      _$_$_MemberFromJson(json);

  @override
  final int id;
  @override
  final String? email;
  @override
  final String profileName;
  @override
  final String? profilePhotoUrl;
  @override
  final String role;
  @override //admin, general_free, general_paid, expert
  final String createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'Member(id: $id, email: $email, profileName: $profileName, profilePhotoUrl: $profilePhotoUrl, role: $role, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Member &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.profileName, profileName) ||
                const DeepCollectionEquality()
                    .equals(other.profileName, profileName)) &&
            (identical(other.profilePhotoUrl, profilePhotoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.profilePhotoUrl, profilePhotoUrl)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(profileName) ^
      const DeepCollectionEquality().hash(profilePhotoUrl) ^
      const DeepCollectionEquality().hash(role) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt);

  @JsonKey(ignore: true)
  @override
  _$MemberCopyWith<_Member> get copyWith =>
      __$MemberCopyWithImpl<_Member>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MemberToJson(this);
  }
}

abstract class _Member implements Member {
  factory _Member(
      {required int id,
      String? email,
      required String profileName,
      String? profilePhotoUrl,
      required String role,
      required String createdAt,
      String? updatedAt}) = _$_Member;

  factory _Member.fromJson(Map<String, dynamic> json) = _$_Member.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  String get profileName => throw _privateConstructorUsedError;
  @override
  String? get profilePhotoUrl => throw _privateConstructorUsedError;
  @override
  String get role => throw _privateConstructorUsedError;
  @override //admin, general_free, general_paid, expert
  String get createdAt => throw _privateConstructorUsedError;
  @override
  String? get updatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MemberCopyWith<_Member> get copyWith => throw _privateConstructorUsedError;
}
