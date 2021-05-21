// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
class _$CommentTearOff {
  const _$CommentTearOff();

  _Comment call(
      {required int id,
      required User author,
      required int postId,
      required String text,
      required int likeCount,
      required bool isLikeButtonPressed,
      required int nestedCommentCount,
      required String createdAt,
      String? updatedAt}) {
    return _Comment(
      id: id,
      author: author,
      postId: postId,
      text: text,
      likeCount: likeCount,
      isLikeButtonPressed: isLikeButtonPressed,
      nestedCommentCount: nestedCommentCount,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  Comment fromJson(Map<String, Object> json) {
    return Comment.fromJson(json);
  }
}

/// @nodoc
const $Comment = _$CommentTearOff();

/// @nodoc
mixin _$Comment {
  int get id => throw _privateConstructorUsedError;
  User get author => throw _privateConstructorUsedError;
  int get postId => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  int get likeCount => throw _privateConstructorUsedError;
  bool get isLikeButtonPressed => throw _privateConstructorUsedError;
  int get nestedCommentCount => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res>;
  $Res call(
      {int id,
      User author,
      int postId,
      String text,
      int likeCount,
      bool isLikeButtonPressed,
      int nestedCommentCount,
      String createdAt,
      String? updatedAt});

  $UserCopyWith<$Res> get author;
}

/// @nodoc
class _$CommentCopyWithImpl<$Res> implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  final Comment _value;
  // ignore: unused_field
  final $Res Function(Comment) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? author = freezed,
    Object? postId = freezed,
    Object? text = freezed,
    Object? likeCount = freezed,
    Object? isLikeButtonPressed = freezed,
    Object? nestedCommentCount = freezed,
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
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
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
      nestedCommentCount: nestedCommentCount == freezed
          ? _value.nestedCommentCount
          : nestedCommentCount // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$CommentCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$CommentCopyWith(_Comment value, $Res Function(_Comment) then) =
      __$CommentCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      User author,
      int postId,
      String text,
      int likeCount,
      bool isLikeButtonPressed,
      int nestedCommentCount,
      String createdAt,
      String? updatedAt});

  @override
  $UserCopyWith<$Res> get author;
}

/// @nodoc
class __$CommentCopyWithImpl<$Res> extends _$CommentCopyWithImpl<$Res>
    implements _$CommentCopyWith<$Res> {
  __$CommentCopyWithImpl(_Comment _value, $Res Function(_Comment) _then)
      : super(_value, (v) => _then(v as _Comment));

  @override
  _Comment get _value => super._value as _Comment;

  @override
  $Res call({
    Object? id = freezed,
    Object? author = freezed,
    Object? postId = freezed,
    Object? text = freezed,
    Object? likeCount = freezed,
    Object? isLikeButtonPressed = freezed,
    Object? nestedCommentCount = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_Comment(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as User,
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
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
      nestedCommentCount: nestedCommentCount == freezed
          ? _value.nestedCommentCount
          : nestedCommentCount // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$_Comment implements _Comment {
  _$_Comment(
      {required this.id,
      required this.author,
      required this.postId,
      required this.text,
      required this.likeCount,
      required this.isLikeButtonPressed,
      required this.nestedCommentCount,
      required this.createdAt,
      this.updatedAt});

  factory _$_Comment.fromJson(Map<String, dynamic> json) =>
      _$_$_CommentFromJson(json);

  @override
  final int id;
  @override
  final User author;
  @override
  final int postId;
  @override
  final String text;
  @override
  final int likeCount;
  @override
  final bool isLikeButtonPressed;
  @override
  final int nestedCommentCount;
  @override
  final String createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'Comment(id: $id, author: $author, postId: $postId, text: $text, likeCount: $likeCount, isLikeButtonPressed: $isLikeButtonPressed, nestedCommentCount: $nestedCommentCount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Comment &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.author, author) ||
                const DeepCollectionEquality().equals(other.author, author)) &&
            (identical(other.postId, postId) ||
                const DeepCollectionEquality().equals(other.postId, postId)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.likeCount, likeCount) ||
                const DeepCollectionEquality()
                    .equals(other.likeCount, likeCount)) &&
            (identical(other.isLikeButtonPressed, isLikeButtonPressed) ||
                const DeepCollectionEquality()
                    .equals(other.isLikeButtonPressed, isLikeButtonPressed)) &&
            (identical(other.nestedCommentCount, nestedCommentCount) ||
                const DeepCollectionEquality()
                    .equals(other.nestedCommentCount, nestedCommentCount)) &&
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
      const DeepCollectionEquality().hash(postId) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(likeCount) ^
      const DeepCollectionEquality().hash(isLikeButtonPressed) ^
      const DeepCollectionEquality().hash(nestedCommentCount) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt);

  @JsonKey(ignore: true)
  @override
  _$CommentCopyWith<_Comment> get copyWith =>
      __$CommentCopyWithImpl<_Comment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CommentToJson(this);
  }
}

abstract class _Comment implements Comment {
  factory _Comment(
      {required int id,
      required User author,
      required int postId,
      required String text,
      required int likeCount,
      required bool isLikeButtonPressed,
      required int nestedCommentCount,
      required String createdAt,
      String? updatedAt}) = _$_Comment;

  factory _Comment.fromJson(Map<String, dynamic> json) = _$_Comment.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  User get author => throw _privateConstructorUsedError;
  @override
  int get postId => throw _privateConstructorUsedError;
  @override
  String get text => throw _privateConstructorUsedError;
  @override
  int get likeCount => throw _privateConstructorUsedError;
  @override
  bool get isLikeButtonPressed => throw _privateConstructorUsedError;
  @override
  int get nestedCommentCount => throw _privateConstructorUsedError;
  @override
  String get createdAt => throw _privateConstructorUsedError;
  @override
  String? get updatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CommentCopyWith<_Comment> get copyWith =>
      throw _privateConstructorUsedError;
}
