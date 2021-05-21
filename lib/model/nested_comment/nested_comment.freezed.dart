// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'nested_comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NestedComment _$NestedCommentFromJson(Map<String, dynamic> json) {
  return _NestedComment.fromJson(json);
}

/// @nodoc
class _$NestedCommentTearOff {
  const _$NestedCommentTearOff();

  _NestedComment call(
      {required int id,
      required User author,
      required int commentId,
      required String text,
      required int likeCount,
      required bool isLikeButtonPressed,
      required String createdAt,
      String? updatedAt}) {
    return _NestedComment(
      id: id,
      author: author,
      commentId: commentId,
      text: text,
      likeCount: likeCount,
      isLikeButtonPressed: isLikeButtonPressed,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  NestedComment fromJson(Map<String, Object> json) {
    return NestedComment.fromJson(json);
  }
}

/// @nodoc
const $NestedComment = _$NestedCommentTearOff();

/// @nodoc
mixin _$NestedComment {
  int get id => throw _privateConstructorUsedError;
  User get author => throw _privateConstructorUsedError;
  int get commentId => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  int get likeCount => throw _privateConstructorUsedError;
  bool get isLikeButtonPressed => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NestedCommentCopyWith<NestedComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NestedCommentCopyWith<$Res> {
  factory $NestedCommentCopyWith(
          NestedComment value, $Res Function(NestedComment) then) =
      _$NestedCommentCopyWithImpl<$Res>;
  $Res call(
      {int id,
      User author,
      int commentId,
      String text,
      int likeCount,
      bool isLikeButtonPressed,
      String createdAt,
      String? updatedAt});

  $UserCopyWith<$Res> get author;
}

/// @nodoc
class _$NestedCommentCopyWithImpl<$Res>
    implements $NestedCommentCopyWith<$Res> {
  _$NestedCommentCopyWithImpl(this._value, this._then);

  final NestedComment _value;
  // ignore: unused_field
  final $Res Function(NestedComment) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? author = freezed,
    Object? commentId = freezed,
    Object? text = freezed,
    Object? likeCount = freezed,
    Object? isLikeButtonPressed = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as User,
      commentId: commentId == freezed
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as int,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      likeCount: likeCount == freezed
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLikeButtonPressed: isLikeButtonPressed == freezed
          ? _value.isLikeButtonPressed
          : isLikeButtonPressed // ignore: cast_nullable_to_non_nullable
              as bool,
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

  @override
  $UserCopyWith<$Res> get author {
    return $UserCopyWith<$Res>(_value.author, (value) {
      return _then(_value.copyWith(author: value));
    });
  }
}

/// @nodoc
abstract class _$NestedCommentCopyWith<$Res>
    implements $NestedCommentCopyWith<$Res> {
  factory _$NestedCommentCopyWith(
          _NestedComment value, $Res Function(_NestedComment) then) =
      __$NestedCommentCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      User author,
      int commentId,
      String text,
      int likeCount,
      bool isLikeButtonPressed,
      String createdAt,
      String? updatedAt});

  @override
  $UserCopyWith<$Res> get author;
}

/// @nodoc
class __$NestedCommentCopyWithImpl<$Res>
    extends _$NestedCommentCopyWithImpl<$Res>
    implements _$NestedCommentCopyWith<$Res> {
  __$NestedCommentCopyWithImpl(
      _NestedComment _value, $Res Function(_NestedComment) _then)
      : super(_value, (v) => _then(v as _NestedComment));

  @override
  _NestedComment get _value => super._value as _NestedComment;

  @override
  $Res call({
    Object? id = freezed,
    Object? author = freezed,
    Object? commentId = freezed,
    Object? text = freezed,
    Object? likeCount = freezed,
    Object? isLikeButtonPressed = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_NestedComment(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as User,
      commentId: commentId == freezed
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as int,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      likeCount: likeCount == freezed
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLikeButtonPressed: isLikeButtonPressed == freezed
          ? _value.isLikeButtonPressed
          : isLikeButtonPressed // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _$_NestedComment implements _NestedComment {
  _$_NestedComment(
      {required this.id,
      required this.author,
      required this.commentId,
      required this.text,
      required this.likeCount,
      required this.isLikeButtonPressed,
      required this.createdAt,
      this.updatedAt});

  factory _$_NestedComment.fromJson(Map<String, dynamic> json) =>
      _$_$_NestedCommentFromJson(json);

  @override
  final int id;
  @override
  final User author;
  @override
  final int commentId;
  @override
  final String text;
  @override
  final int likeCount;
  @override
  final bool isLikeButtonPressed;
  @override
  final String createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'NestedComment(id: $id, author: $author, commentId: $commentId, text: $text, likeCount: $likeCount, isLikeButtonPressed: $isLikeButtonPressed, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NestedComment &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.author, author) ||
                const DeepCollectionEquality().equals(other.author, author)) &&
            (identical(other.commentId, commentId) ||
                const DeepCollectionEquality()
                    .equals(other.commentId, commentId)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.likeCount, likeCount) ||
                const DeepCollectionEquality()
                    .equals(other.likeCount, likeCount)) &&
            (identical(other.isLikeButtonPressed, isLikeButtonPressed) ||
                const DeepCollectionEquality()
                    .equals(other.isLikeButtonPressed, isLikeButtonPressed)) &&
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
      const DeepCollectionEquality().hash(author) ^
      const DeepCollectionEquality().hash(commentId) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(likeCount) ^
      const DeepCollectionEquality().hash(isLikeButtonPressed) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt);

  @JsonKey(ignore: true)
  @override
  _$NestedCommentCopyWith<_NestedComment> get copyWith =>
      __$NestedCommentCopyWithImpl<_NestedComment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NestedCommentToJson(this);
  }
}

abstract class _NestedComment implements NestedComment {
  factory _NestedComment(
      {required int id,
      required User author,
      required int commentId,
      required String text,
      required int likeCount,
      required bool isLikeButtonPressed,
      required String createdAt,
      String? updatedAt}) = _$_NestedComment;

  factory _NestedComment.fromJson(Map<String, dynamic> json) =
      _$_NestedComment.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  User get author => throw _privateConstructorUsedError;
  @override
  int get commentId => throw _privateConstructorUsedError;
  @override
  String get text => throw _privateConstructorUsedError;
  @override
  int get likeCount => throw _privateConstructorUsedError;
  @override
  bool get isLikeButtonPressed => throw _privateConstructorUsedError;
  @override
  String get createdAt => throw _privateConstructorUsedError;
  @override
  String? get updatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NestedCommentCopyWith<_NestedComment> get copyWith =>
      throw _privateConstructorUsedError;
}
