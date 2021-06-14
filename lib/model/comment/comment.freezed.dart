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
      required String profileName,
      required String? profilePhotoUrl,
      required int postId,
      required String text,
      required int memberId,
      required int likeCount,
      required int nestedCommentCount,
      required String createdAt,
      required String postTitle,
      String? updatedAt,
      required int memberLikeCount}) {
    return _Comment(
      id: id,
      profileName: profileName,
      profilePhotoUrl: profilePhotoUrl,
      postId: postId,
      text: text,
      memberId: memberId,
      likeCount: likeCount,
      nestedCommentCount: nestedCommentCount,
      createdAt: createdAt,
      postTitle: postTitle,
      updatedAt: updatedAt,
      memberLikeCount: memberLikeCount,
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
  String get profileName => throw _privateConstructorUsedError;
  String? get profilePhotoUrl => throw _privateConstructorUsedError;
  int get postId => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  int get memberId => throw _privateConstructorUsedError;
  int get likeCount => throw _privateConstructorUsedError;
  int get nestedCommentCount => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get postTitle => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError; //[nullable]
  int get memberLikeCount => throw _privateConstructorUsedError;

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
      String profileName,
      String? profilePhotoUrl,
      int postId,
      String text,
      int memberId,
      int likeCount,
      int nestedCommentCount,
      String createdAt,
      String postTitle,
      String? updatedAt,
      int memberLikeCount});
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
    Object? profileName = freezed,
    Object? profilePhotoUrl = freezed,
    Object? postId = freezed,
    Object? text = freezed,
    Object? memberId = freezed,
    Object? likeCount = freezed,
    Object? nestedCommentCount = freezed,
    Object? createdAt = freezed,
    Object? postTitle = freezed,
    Object? updatedAt = freezed,
    Object? memberLikeCount = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      profileName: profileName == freezed
          ? _value.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhotoUrl: profilePhotoUrl == freezed
          ? _value.profilePhotoUrl
          : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      memberId: memberId == freezed
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as int,
      likeCount: likeCount == freezed
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      nestedCommentCount: nestedCommentCount == freezed
          ? _value.nestedCommentCount
          : nestedCommentCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      postTitle: postTitle == freezed
          ? _value.postTitle
          : postTitle // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      memberLikeCount: memberLikeCount == freezed
          ? _value.memberLikeCount
          : memberLikeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$CommentCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$CommentCopyWith(_Comment value, $Res Function(_Comment) then) =
      __$CommentCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String profileName,
      String? profilePhotoUrl,
      int postId,
      String text,
      int memberId,
      int likeCount,
      int nestedCommentCount,
      String createdAt,
      String postTitle,
      String? updatedAt,
      int memberLikeCount});
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
    Object? profileName = freezed,
    Object? profilePhotoUrl = freezed,
    Object? postId = freezed,
    Object? text = freezed,
    Object? memberId = freezed,
    Object? likeCount = freezed,
    Object? nestedCommentCount = freezed,
    Object? createdAt = freezed,
    Object? postTitle = freezed,
    Object? updatedAt = freezed,
    Object? memberLikeCount = freezed,
  }) {
    return _then(_Comment(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      profileName: profileName == freezed
          ? _value.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhotoUrl: profilePhotoUrl == freezed
          ? _value.profilePhotoUrl
          : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      memberId: memberId == freezed
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as int,
      likeCount: likeCount == freezed
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      nestedCommentCount: nestedCommentCount == freezed
          ? _value.nestedCommentCount
          : nestedCommentCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      postTitle: postTitle == freezed
          ? _value.postTitle
          : postTitle // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      memberLikeCount: memberLikeCount == freezed
          ? _value.memberLikeCount
          : memberLikeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Comment implements _Comment {
  _$_Comment(
      {required this.id,
      required this.profileName,
      required this.profilePhotoUrl,
      required this.postId,
      required this.text,
      required this.memberId,
      required this.likeCount,
      required this.nestedCommentCount,
      required this.createdAt,
      required this.postTitle,
      this.updatedAt,
      required this.memberLikeCount});

  factory _$_Comment.fromJson(Map<String, dynamic> json) =>
      _$_$_CommentFromJson(json);

  @override
  final int id;
  @override
  final String profileName;
  @override
  final String? profilePhotoUrl;
  @override
  final int postId;
  @override
  final String text;
  @override
  final int memberId;
  @override
  final int likeCount;
  @override
  final int nestedCommentCount;
  @override
  final String createdAt;
  @override
  final String postTitle;
  @override
  final String? updatedAt;
  @override //[nullable]
  final int memberLikeCount;

  @override
  String toString() {
    return 'Comment(id: $id, profileName: $profileName, profilePhotoUrl: $profilePhotoUrl, postId: $postId, text: $text, memberId: $memberId, likeCount: $likeCount, nestedCommentCount: $nestedCommentCount, createdAt: $createdAt, postTitle: $postTitle, updatedAt: $updatedAt, memberLikeCount: $memberLikeCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Comment &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.profileName, profileName) ||
                const DeepCollectionEquality()
                    .equals(other.profileName, profileName)) &&
            (identical(other.profilePhotoUrl, profilePhotoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.profilePhotoUrl, profilePhotoUrl)) &&
            (identical(other.postId, postId) ||
                const DeepCollectionEquality().equals(other.postId, postId)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.memberId, memberId) ||
                const DeepCollectionEquality()
                    .equals(other.memberId, memberId)) &&
            (identical(other.likeCount, likeCount) ||
                const DeepCollectionEquality()
                    .equals(other.likeCount, likeCount)) &&
            (identical(other.nestedCommentCount, nestedCommentCount) ||
                const DeepCollectionEquality()
                    .equals(other.nestedCommentCount, nestedCommentCount)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.postTitle, postTitle) ||
                const DeepCollectionEquality()
                    .equals(other.postTitle, postTitle)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.memberLikeCount, memberLikeCount) ||
                const DeepCollectionEquality()
                    .equals(other.memberLikeCount, memberLikeCount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(profileName) ^
      const DeepCollectionEquality().hash(profilePhotoUrl) ^
      const DeepCollectionEquality().hash(postId) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(memberId) ^
      const DeepCollectionEquality().hash(likeCount) ^
      const DeepCollectionEquality().hash(nestedCommentCount) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(postTitle) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(memberLikeCount);

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
      required String profileName,
      required String? profilePhotoUrl,
      required int postId,
      required String text,
      required int memberId,
      required int likeCount,
      required int nestedCommentCount,
      required String createdAt,
      required String postTitle,
      String? updatedAt,
      required int memberLikeCount}) = _$_Comment;

  factory _Comment.fromJson(Map<String, dynamic> json) = _$_Comment.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get profileName => throw _privateConstructorUsedError;
  @override
  String? get profilePhotoUrl => throw _privateConstructorUsedError;
  @override
  int get postId => throw _privateConstructorUsedError;
  @override
  String get text => throw _privateConstructorUsedError;
  @override
  int get memberId => throw _privateConstructorUsedError;
  @override
  int get likeCount => throw _privateConstructorUsedError;
  @override
  int get nestedCommentCount => throw _privateConstructorUsedError;
  @override
  String get createdAt => throw _privateConstructorUsedError;
  @override
  String get postTitle => throw _privateConstructorUsedError;
  @override
  String? get updatedAt => throw _privateConstructorUsedError;
  @override //[nullable]
  int get memberLikeCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CommentCopyWith<_Comment> get copyWith =>
      throw _privateConstructorUsedError;
}
