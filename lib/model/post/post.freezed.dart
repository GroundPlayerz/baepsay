// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
class _$PostTearOff {
  const _$PostTearOff();

  _Post call(
      {required int id,
      required int authorId,
      required String profileName,
      required String title,
      required String firstContentText,
      required String secondContentText,
      required int commentCount,
      required int likeCount,
      required int viewCount,
      required int firstContentVoteCount,
      required int secondContentVoteCount,
      required int userLikeCount,
      required int? userVoteChoice,
      required String createdAt,
      required String? mediaContentOrders,
      required String? mediaTypes,
      required String? mediaUrls}) {
    return _Post(
      id: id,
      authorId: authorId,
      profileName: profileName,
      title: title,
      firstContentText: firstContentText,
      secondContentText: secondContentText,
      commentCount: commentCount,
      likeCount: likeCount,
      viewCount: viewCount,
      firstContentVoteCount: firstContentVoteCount,
      secondContentVoteCount: secondContentVoteCount,
      userLikeCount: userLikeCount,
      userVoteChoice: userVoteChoice,
      createdAt: createdAt,
      mediaContentOrders: mediaContentOrders,
      mediaTypes: mediaTypes,
      mediaUrls: mediaUrls,
    );
  }

  Post fromJson(Map<String, Object> json) {
    return Post.fromJson(json);
  }
}

/// @nodoc
const $Post = _$PostTearOff();

/// @nodoc
mixin _$Post {
  int get id => throw _privateConstructorUsedError;
  int get authorId => throw _privateConstructorUsedError;
  String get profileName => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get firstContentText => throw _privateConstructorUsedError;
  String get secondContentText => throw _privateConstructorUsedError;
  int get commentCount => throw _privateConstructorUsedError;
  int get likeCount => throw _privateConstructorUsedError;
  int get viewCount => throw _privateConstructorUsedError;
  int get firstContentVoteCount => throw _privateConstructorUsedError;
  int get secondContentVoteCount => throw _privateConstructorUsedError;
  int get userLikeCount => throw _privateConstructorUsedError;
  int? get userVoteChoice => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String? get mediaContentOrders => throw _privateConstructorUsedError;
  String? get mediaTypes => throw _privateConstructorUsedError;
  String? get mediaUrls => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int authorId,
      String profileName,
      String title,
      String firstContentText,
      String secondContentText,
      int commentCount,
      int likeCount,
      int viewCount,
      int firstContentVoteCount,
      int secondContentVoteCount,
      int userLikeCount,
      int? userVoteChoice,
      String createdAt,
      String? mediaContentOrders,
      String? mediaTypes,
      String? mediaUrls});
}

/// @nodoc
class _$PostCopyWithImpl<$Res> implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  final Post _value;
  // ignore: unused_field
  final $Res Function(Post) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? authorId = freezed,
    Object? profileName = freezed,
    Object? title = freezed,
    Object? firstContentText = freezed,
    Object? secondContentText = freezed,
    Object? commentCount = freezed,
    Object? likeCount = freezed,
    Object? viewCount = freezed,
    Object? firstContentVoteCount = freezed,
    Object? secondContentVoteCount = freezed,
    Object? userLikeCount = freezed,
    Object? userVoteChoice = freezed,
    Object? createdAt = freezed,
    Object? mediaContentOrders = freezed,
    Object? mediaTypes = freezed,
    Object? mediaUrls = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      authorId: authorId == freezed
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as int,
      profileName: profileName == freezed
          ? _value.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      firstContentText: firstContentText == freezed
          ? _value.firstContentText
          : firstContentText // ignore: cast_nullable_to_non_nullable
              as String,
      secondContentText: secondContentText == freezed
          ? _value.secondContentText
          : secondContentText // ignore: cast_nullable_to_non_nullable
              as String,
      commentCount: commentCount == freezed
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      likeCount: likeCount == freezed
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      viewCount: viewCount == freezed
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      firstContentVoteCount: firstContentVoteCount == freezed
          ? _value.firstContentVoteCount
          : firstContentVoteCount // ignore: cast_nullable_to_non_nullable
              as int,
      secondContentVoteCount: secondContentVoteCount == freezed
          ? _value.secondContentVoteCount
          : secondContentVoteCount // ignore: cast_nullable_to_non_nullable
              as int,
      userLikeCount: userLikeCount == freezed
          ? _value.userLikeCount
          : userLikeCount // ignore: cast_nullable_to_non_nullable
              as int,
      userVoteChoice: userVoteChoice == freezed
          ? _value.userVoteChoice
          : userVoteChoice // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      mediaContentOrders: mediaContentOrders == freezed
          ? _value.mediaContentOrders
          : mediaContentOrders // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaTypes: mediaTypes == freezed
          ? _value.mediaTypes
          : mediaTypes // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaUrls: mediaUrls == freezed
          ? _value.mediaUrls
          : mediaUrls // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$PostCopyWith(_Post value, $Res Function(_Post) then) =
      __$PostCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int authorId,
      String profileName,
      String title,
      String firstContentText,
      String secondContentText,
      int commentCount,
      int likeCount,
      int viewCount,
      int firstContentVoteCount,
      int secondContentVoteCount,
      int userLikeCount,
      int? userVoteChoice,
      String createdAt,
      String? mediaContentOrders,
      String? mediaTypes,
      String? mediaUrls});
}

/// @nodoc
class __$PostCopyWithImpl<$Res> extends _$PostCopyWithImpl<$Res>
    implements _$PostCopyWith<$Res> {
  __$PostCopyWithImpl(_Post _value, $Res Function(_Post) _then)
      : super(_value, (v) => _then(v as _Post));

  @override
  _Post get _value => super._value as _Post;

  @override
  $Res call({
    Object? id = freezed,
    Object? authorId = freezed,
    Object? profileName = freezed,
    Object? title = freezed,
    Object? firstContentText = freezed,
    Object? secondContentText = freezed,
    Object? commentCount = freezed,
    Object? likeCount = freezed,
    Object? viewCount = freezed,
    Object? firstContentVoteCount = freezed,
    Object? secondContentVoteCount = freezed,
    Object? userLikeCount = freezed,
    Object? userVoteChoice = freezed,
    Object? createdAt = freezed,
    Object? mediaContentOrders = freezed,
    Object? mediaTypes = freezed,
    Object? mediaUrls = freezed,
  }) {
    return _then(_Post(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      authorId: authorId == freezed
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as int,
      profileName: profileName == freezed
          ? _value.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      firstContentText: firstContentText == freezed
          ? _value.firstContentText
          : firstContentText // ignore: cast_nullable_to_non_nullable
              as String,
      secondContentText: secondContentText == freezed
          ? _value.secondContentText
          : secondContentText // ignore: cast_nullable_to_non_nullable
              as String,
      commentCount: commentCount == freezed
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      likeCount: likeCount == freezed
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      viewCount: viewCount == freezed
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      firstContentVoteCount: firstContentVoteCount == freezed
          ? _value.firstContentVoteCount
          : firstContentVoteCount // ignore: cast_nullable_to_non_nullable
              as int,
      secondContentVoteCount: secondContentVoteCount == freezed
          ? _value.secondContentVoteCount
          : secondContentVoteCount // ignore: cast_nullable_to_non_nullable
              as int,
      userLikeCount: userLikeCount == freezed
          ? _value.userLikeCount
          : userLikeCount // ignore: cast_nullable_to_non_nullable
              as int,
      userVoteChoice: userVoteChoice == freezed
          ? _value.userVoteChoice
          : userVoteChoice // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      mediaContentOrders: mediaContentOrders == freezed
          ? _value.mediaContentOrders
          : mediaContentOrders // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaTypes: mediaTypes == freezed
          ? _value.mediaTypes
          : mediaTypes // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaUrls: mediaUrls == freezed
          ? _value.mediaUrls
          : mediaUrls // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Post implements _Post {
  _$_Post(
      {required this.id,
      required this.authorId,
      required this.profileName,
      required this.title,
      required this.firstContentText,
      required this.secondContentText,
      required this.commentCount,
      required this.likeCount,
      required this.viewCount,
      required this.firstContentVoteCount,
      required this.secondContentVoteCount,
      required this.userLikeCount,
      required this.userVoteChoice,
      required this.createdAt,
      required this.mediaContentOrders,
      required this.mediaTypes,
      required this.mediaUrls});

  factory _$_Post.fromJson(Map<String, dynamic> json) =>
      _$_$_PostFromJson(json);

  @override
  final int id;
  @override
  final int authorId;
  @override
  final String profileName;
  @override
  final String title;
  @override
  final String firstContentText;
  @override
  final String secondContentText;
  @override
  final int commentCount;
  @override
  final int likeCount;
  @override
  final int viewCount;
  @override
  final int firstContentVoteCount;
  @override
  final int secondContentVoteCount;
  @override
  final int userLikeCount;
  @override
  final int? userVoteChoice;
  @override
  final String createdAt;
  @override
  final String? mediaContentOrders;
  @override
  final String? mediaTypes;
  @override
  final String? mediaUrls;

  @override
  String toString() {
    return 'Post(id: $id, authorId: $authorId, profileName: $profileName, title: $title, firstContentText: $firstContentText, secondContentText: $secondContentText, commentCount: $commentCount, likeCount: $likeCount, viewCount: $viewCount, firstContentVoteCount: $firstContentVoteCount, secondContentVoteCount: $secondContentVoteCount, userLikeCount: $userLikeCount, userVoteChoice: $userVoteChoice, createdAt: $createdAt, mediaContentOrders: $mediaContentOrders, mediaTypes: $mediaTypes, mediaUrls: $mediaUrls)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Post &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.authorId, authorId) ||
                const DeepCollectionEquality()
                    .equals(other.authorId, authorId)) &&
            (identical(other.profileName, profileName) ||
                const DeepCollectionEquality()
                    .equals(other.profileName, profileName)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.firstContentText, firstContentText) ||
                const DeepCollectionEquality()
                    .equals(other.firstContentText, firstContentText)) &&
            (identical(other.secondContentText, secondContentText) ||
                const DeepCollectionEquality()
                    .equals(other.secondContentText, secondContentText)) &&
            (identical(other.commentCount, commentCount) ||
                const DeepCollectionEquality()
                    .equals(other.commentCount, commentCount)) &&
            (identical(other.likeCount, likeCount) ||
                const DeepCollectionEquality()
                    .equals(other.likeCount, likeCount)) &&
            (identical(other.viewCount, viewCount) ||
                const DeepCollectionEquality()
                    .equals(other.viewCount, viewCount)) &&
            (identical(other.firstContentVoteCount, firstContentVoteCount) ||
                const DeepCollectionEquality().equals(
                    other.firstContentVoteCount, firstContentVoteCount)) &&
            (identical(other.secondContentVoteCount, secondContentVoteCount) ||
                const DeepCollectionEquality().equals(
                    other.secondContentVoteCount, secondContentVoteCount)) &&
            (identical(other.userLikeCount, userLikeCount) ||
                const DeepCollectionEquality()
                    .equals(other.userLikeCount, userLikeCount)) &&
            (identical(other.userVoteChoice, userVoteChoice) ||
                const DeepCollectionEquality()
                    .equals(other.userVoteChoice, userVoteChoice)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.mediaContentOrders, mediaContentOrders) ||
                const DeepCollectionEquality()
                    .equals(other.mediaContentOrders, mediaContentOrders)) &&
            (identical(other.mediaTypes, mediaTypes) ||
                const DeepCollectionEquality()
                    .equals(other.mediaTypes, mediaTypes)) &&
            (identical(other.mediaUrls, mediaUrls) ||
                const DeepCollectionEquality()
                    .equals(other.mediaUrls, mediaUrls)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(authorId) ^
      const DeepCollectionEquality().hash(profileName) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(firstContentText) ^
      const DeepCollectionEquality().hash(secondContentText) ^
      const DeepCollectionEquality().hash(commentCount) ^
      const DeepCollectionEquality().hash(likeCount) ^
      const DeepCollectionEquality().hash(viewCount) ^
      const DeepCollectionEquality().hash(firstContentVoteCount) ^
      const DeepCollectionEquality().hash(secondContentVoteCount) ^
      const DeepCollectionEquality().hash(userLikeCount) ^
      const DeepCollectionEquality().hash(userVoteChoice) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(mediaContentOrders) ^
      const DeepCollectionEquality().hash(mediaTypes) ^
      const DeepCollectionEquality().hash(mediaUrls);

  @JsonKey(ignore: true)
  @override
  _$PostCopyWith<_Post> get copyWith =>
      __$PostCopyWithImpl<_Post>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PostToJson(this);
  }
}

abstract class _Post implements Post {
  factory _Post(
      {required int id,
      required int authorId,
      required String profileName,
      required String title,
      required String firstContentText,
      required String secondContentText,
      required int commentCount,
      required int likeCount,
      required int viewCount,
      required int firstContentVoteCount,
      required int secondContentVoteCount,
      required int userLikeCount,
      required int? userVoteChoice,
      required String createdAt,
      required String? mediaContentOrders,
      required String? mediaTypes,
      required String? mediaUrls}) = _$_Post;

  factory _Post.fromJson(Map<String, dynamic> json) = _$_Post.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  int get authorId => throw _privateConstructorUsedError;
  @override
  String get profileName => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get firstContentText => throw _privateConstructorUsedError;
  @override
  String get secondContentText => throw _privateConstructorUsedError;
  @override
  int get commentCount => throw _privateConstructorUsedError;
  @override
  int get likeCount => throw _privateConstructorUsedError;
  @override
  int get viewCount => throw _privateConstructorUsedError;
  @override
  int get firstContentVoteCount => throw _privateConstructorUsedError;
  @override
  int get secondContentVoteCount => throw _privateConstructorUsedError;
  @override
  int get userLikeCount => throw _privateConstructorUsedError;
  @override
  int? get userVoteChoice => throw _privateConstructorUsedError;
  @override
  String get createdAt => throw _privateConstructorUsedError;
  @override
  String? get mediaContentOrders => throw _privateConstructorUsedError;
  @override
  String? get mediaTypes => throw _privateConstructorUsedError;
  @override
  String? get mediaUrls => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PostCopyWith<_Post> get copyWith => throw _privateConstructorUsedError;
}
