// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {required int id,
      String? email,
      required String profileName,
      String? profilePhotoUrl,
      required String role,
      required String createdAt,
      String? updatedAt}) {
    return _User(
      id: id,
      email: email,
      profileName: profileName,
      profilePhotoUrl: profilePhotoUrl,
      role: role,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  User fromJson(Map<String, Object> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
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
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
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
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

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
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
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
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

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
    return _then(_User(
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
class _$_User implements _User {
  _$_User(
      {required this.id,
      this.email,
      required this.profileName,
      this.profilePhotoUrl,
      required this.role,
      required this.createdAt,
      this.updatedAt});

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

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
    return 'User(id: $id, email: $email, profileName: $profileName, profilePhotoUrl: $profilePhotoUrl, role: $role, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
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
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User implements User {
  factory _User(
      {required int id,
      String? email,
      required String profileName,
      String? profilePhotoUrl,
      required String role,
      required String createdAt,
      String? updatedAt}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

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
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
