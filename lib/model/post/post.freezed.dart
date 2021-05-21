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
      required User author,
      required String title,
      required String firstContentText,
      required String secondContentText,
      required int likeCount,
      required int viewCount,
      required int firstContentVoteCount,
      required int secondContentVoteCount,
      required bool isLikeButtonPressed,
      Media? firstContentMedia,
      Media? secondContentMedia,
      required String createdAt}) {
    return _Post(
      id: id,
      author: author,
      title: title,
      firstContentText: firstContentText,
      secondContentText: secondContentText,
      likeCount: likeCount,
      viewCount: viewCount,
      firstContentVoteCount: firstContentVoteCount,
      secondContentVoteCount: secondContentVoteCount,
      isLikeButtonPressed: isLikeButtonPressed,
      firstContentMedia: firstContentMedia,
      secondContentMedia: secondContentMedia,
      createdAt: createdAt,
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
  User get author => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get firstContentText => throw _privateConstructorUsedError;
  String get secondContentText => throw _privateConstructorUsedError;
  int get likeCount => throw _privateConstructorUsedError;
  int get viewCount => throw _privateConstructorUsedError;
  int get firstContentVoteCount => throw _privateConstructorUsedError;
  int get secondContentVoteCount => throw _privateConstructorUsedError;
  bool get isLikeButtonPressed => throw _privateConstructorUsedError;
  Media? get firstContentMedia => throw _privateConstructorUsedError;
  Media? get secondContentMedia => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

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
      User author,
      String title,
      String firstContentText,
      String secondContentText,
      int likeCount,
      int viewCount,
      int firstContentVoteCount,
      int secondContentVoteCount,
      bool isLikeButtonPressed,
      Media? firstContentMedia,
      Media? secondContentMedia,
      String createdAt});

  $UserCopyWith<$Res> get author;
  $MediaCopyWith<$Res>? get firstContentMedia;
  $MediaCopyWith<$Res>? get secondContentMedia;
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
    Object? author = freezed,
    Object? title = freezed,
    Object? firstContentText = freezed,
    Object? secondContentText = freezed,
    Object? likeCount = freezed,
    Object? viewCount = freezed,
    Object? firstContentVoteCount = freezed,
    Object? secondContentVoteCount = freezed,
    Object? isLikeButtonPressed = freezed,
    Object? firstContentMedia = freezed,
    Object? secondContentMedia = freezed,
    Object? createdAt = freezed,
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
      isLikeButtonPressed: isLikeButtonPressed == freezed
          ? _value.isLikeButtonPressed
          : isLikeButtonPressed // ignore: cast_nullable_to_non_nullable
              as bool,
      firstContentMedia: firstContentMedia == freezed
          ? _value.firstContentMedia
          : firstContentMedia // ignore: cast_nullable_to_non_nullable
              as Media?,
      secondContentMedia: secondContentMedia == freezed
          ? _value.secondContentMedia
          : secondContentMedia // ignore: cast_nullable_to_non_nullable
              as Media?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $UserCopyWith<$Res> get author {
    return $UserCopyWith<$Res>(_value.author, (value) {
      return _then(_value.copyWith(author: value));
    });
  }

  @override
  $MediaCopyWith<$Res>? get firstContentMedia {
    if (_value.firstContentMedia == null) {
      return null;
    }

    return $MediaCopyWith<$Res>(_value.firstContentMedia!, (value) {
      return _then(_value.copyWith(firstContentMedia: value));
    });
  }

  @override
  $MediaCopyWith<$Res>? get secondContentMedia {
    if (_value.secondContentMedia == null) {
      return null;
    }

    return $MediaCopyWith<$Res>(_value.secondContentMedia!, (value) {
      return _then(_value.copyWith(secondContentMedia: value));
    });
  }
}

/// @nodoc
abstract class _$PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$PostCopyWith(_Post value, $Res Function(_Post) then) =
      __$PostCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      User author,
      String title,
      String firstContentText,
      String secondContentText,
      int likeCount,
      int viewCount,
      int firstContentVoteCount,
      int secondContentVoteCount,
      bool isLikeButtonPressed,
      Media? firstContentMedia,
      Media? secondContentMedia,
      String createdAt});

  @override
  $UserCopyWith<$Res> get author;
  @override
  $MediaCopyWith<$Res>? get firstContentMedia;
  @override
  $MediaCopyWith<$Res>? get secondContentMedia;
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
    Object? author = freezed,
    Object? title = freezed,
    Object? firstContentText = freezed,
    Object? secondContentText = freezed,
    Object? likeCount = freezed,
    Object? viewCount = freezed,
    Object? firstContentVoteCount = freezed,
    Object? secondContentVoteCount = freezed,
    Object? isLikeButtonPressed = freezed,
    Object? firstContentMedia = freezed,
    Object? secondContentMedia = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_Post(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as User,
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
      isLikeButtonPressed: isLikeButtonPressed == freezed
          ? _value.isLikeButtonPressed
          : isLikeButtonPressed // ignore: cast_nullable_to_non_nullable
              as bool,
      firstContentMedia: firstContentMedia == freezed
          ? _value.firstContentMedia
          : firstContentMedia // ignore: cast_nullable_to_non_nullable
              as Media?,
      secondContentMedia: secondContentMedia == freezed
          ? _value.secondContentMedia
          : secondContentMedia // ignore: cast_nullable_to_non_nullable
              as Media?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Post implements _Post {
  _$_Post(
      {required this.id,
      required this.author,
      required this.title,
      required this.firstContentText,
      required this.secondContentText,
      required this.likeCount,
      required this.viewCount,
      required this.firstContentVoteCount,
      required this.secondContentVoteCount,
      required this.isLikeButtonPressed,
      this.firstContentMedia,
      this.secondContentMedia,
      required this.createdAt});

  factory _$_Post.fromJson(Map<String, dynamic> json) =>
      _$_$_PostFromJson(json);

  @override
  final int id;
  @override
  final User author;
  @override
  final String title;
  @override
  final String firstContentText;
  @override
  final String secondContentText;
  @override
  final int likeCount;
  @override
  final int viewCount;
  @override
  final int firstContentVoteCount;
  @override
  final int secondContentVoteCount;
  @override
  final bool isLikeButtonPressed;
  @override
  final Media? firstContentMedia;
  @override
  final Media? secondContentMedia;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'Post(id: $id, author: $author, title: $title, firstContentText: $firstContentText, secondContentText: $secondContentText, likeCount: $likeCount, viewCount: $viewCount, firstContentVoteCount: $firstContentVoteCount, secondContentVoteCount: $secondContentVoteCount, isLikeButtonPressed: $isLikeButtonPressed, firstContentMedia: $firstContentMedia, secondContentMedia: $secondContentMedia, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Post &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.author, author) ||
                const DeepCollectionEquality().equals(other.author, author)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.firstContentText, firstContentText) ||
                const DeepCollectionEquality()
                    .equals(other.firstContentText, firstContentText)) &&
            (identical(other.secondContentText, secondContentText) ||
                const DeepCollectionEquality()
                    .equals(other.secondContentText, secondContentText)) &&
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
            (identical(other.isLikeButtonPressed, isLikeButtonPressed) ||
                const DeepCollectionEquality()
                    .equals(other.isLikeButtonPressed, isLikeButtonPressed)) &&
            (identical(other.firstContentMedia, firstContentMedia) ||
                const DeepCollectionEquality()
                    .equals(other.firstContentMedia, firstContentMedia)) &&
            (identical(other.secondContentMedia, secondContentMedia) ||
                const DeepCollectionEquality()
                    .equals(other.secondContentMedia, secondContentMedia)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(author) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(firstContentText) ^
      const DeepCollectionEquality().hash(secondContentText) ^
      const DeepCollectionEquality().hash(likeCount) ^
      const DeepCollectionEquality().hash(viewCount) ^
      const DeepCollectionEquality().hash(firstContentVoteCount) ^
      const DeepCollectionEquality().hash(secondContentVoteCount) ^
      const DeepCollectionEquality().hash(isLikeButtonPressed) ^
      const DeepCollectionEquality().hash(firstContentMedia) ^
      const DeepCollectionEquality().hash(secondContentMedia) ^
      const DeepCollectionEquality().hash(createdAt);

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
      required User author,
      required String title,
      required String firstContentText,
      required String secondContentText,
      required int likeCount,
      required int viewCount,
      required int firstContentVoteCount,
      required int secondContentVoteCount,
      required bool isLikeButtonPressed,
      Media? firstContentMedia,
      Media? secondContentMedia,
      required String createdAt}) = _$_Post;

  factory _Post.fromJson(Map<String, dynamic> json) = _$_Post.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  User get author => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get firstContentText => throw _privateConstructorUsedError;
  @override
  String get secondContentText => throw _privateConstructorUsedError;
  @override
  int get likeCount => throw _privateConstructorUsedError;
  @override
  int get viewCount => throw _privateConstructorUsedError;
  @override
  int get firstContentVoteCount => throw _privateConstructorUsedError;
  @override
  int get secondContentVoteCount => throw _privateConstructorUsedError;
  @override
  bool get isLikeButtonPressed => throw _privateConstructorUsedError;
  @override
  Media? get firstContentMedia => throw _privateConstructorUsedError;
  @override
  Media? get secondContentMedia => throw _privateConstructorUsedError;
  @override
  String get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PostCopyWith<_Post> get copyWith => throw _privateConstructorUsedError;
}

Media _$MediaFromJson(Map<String, dynamic> json) {
  return _Media.fromJson(json);
}

/// @nodoc
class _$MediaTearOff {
  const _$MediaTearOff();

  _Media call(
      {required int id,
      required int postId,
      required String type,
      required int contentOrder,
      required String url,
      required double size,
      double? length}) {
    return _Media(
      id: id,
      postId: postId,
      type: type,
      contentOrder: contentOrder,
      url: url,
      size: size,
      length: length,
    );
  }

  Media fromJson(Map<String, Object> json) {
    return Media.fromJson(json);
  }
}

/// @nodoc
const $Media = _$MediaTearOff();

/// @nodoc
mixin _$Media {
  int get id => throw _privateConstructorUsedError;
  int get postId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError; //video, image
  int get contentOrder => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  double get size => throw _privateConstructorUsedError;
  double? get length => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaCopyWith<Media> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaCopyWith<$Res> {
  factory $MediaCopyWith(Media value, $Res Function(Media) then) =
      _$MediaCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int postId,
      String type,
      int contentOrder,
      String url,
      double size,
      double? length});
}

/// @nodoc
class _$MediaCopyWithImpl<$Res> implements $MediaCopyWith<$Res> {
  _$MediaCopyWithImpl(this._value, this._then);

  final Media _value;
  // ignore: unused_field
  final $Res Function(Media) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? postId = freezed,
    Object? type = freezed,
    Object? contentOrder = freezed,
    Object? url = freezed,
    Object? size = freezed,
    Object? length = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      contentOrder: contentOrder == freezed
          ? _value.contentOrder
          : contentOrder // ignore: cast_nullable_to_non_nullable
              as int,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
      length: length == freezed
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$MediaCopyWith<$Res> implements $MediaCopyWith<$Res> {
  factory _$MediaCopyWith(_Media value, $Res Function(_Media) then) =
      __$MediaCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int postId,
      String type,
      int contentOrder,
      String url,
      double size,
      double? length});
}

/// @nodoc
class __$MediaCopyWithImpl<$Res> extends _$MediaCopyWithImpl<$Res>
    implements _$MediaCopyWith<$Res> {
  __$MediaCopyWithImpl(_Media _value, $Res Function(_Media) _then)
      : super(_value, (v) => _then(v as _Media));

  @override
  _Media get _value => super._value as _Media;

  @override
  $Res call({
    Object? id = freezed,
    Object? postId = freezed,
    Object? type = freezed,
    Object? contentOrder = freezed,
    Object? url = freezed,
    Object? size = freezed,
    Object? length = freezed,
  }) {
    return _then(_Media(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      contentOrder: contentOrder == freezed
          ? _value.contentOrder
          : contentOrder // ignore: cast_nullable_to_non_nullable
              as int,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
      length: length == freezed
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Media implements _Media {
  _$_Media(
      {required this.id,
      required this.postId,
      required this.type,
      required this.contentOrder,
      required this.url,
      required this.size,
      this.length});

  factory _$_Media.fromJson(Map<String, dynamic> json) =>
      _$_$_MediaFromJson(json);

  @override
  final int id;
  @override
  final int postId;
  @override
  final String type;
  @override //video, image
  final int contentOrder;
  @override
  final String url;
  @override
  final double size;
  @override
  final double? length;

  @override
  String toString() {
    return 'Media(id: $id, postId: $postId, type: $type, contentOrder: $contentOrder, url: $url, size: $size, length: $length)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Media &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.postId, postId) ||
                const DeepCollectionEquality().equals(other.postId, postId)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.contentOrder, contentOrder) ||
                const DeepCollectionEquality()
                    .equals(other.contentOrder, contentOrder)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)) &&
            (identical(other.length, length) ||
                const DeepCollectionEquality().equals(other.length, length)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(postId) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(contentOrder) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(length);

  @JsonKey(ignore: true)
  @override
  _$MediaCopyWith<_Media> get copyWith =>
      __$MediaCopyWithImpl<_Media>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MediaToJson(this);
  }
}

abstract class _Media implements Media {
  factory _Media(
      {required int id,
      required int postId,
      required String type,
      required int contentOrder,
      required String url,
      required double size,
      double? length}) = _$_Media;

  factory _Media.fromJson(Map<String, dynamic> json) = _$_Media.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  int get postId => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
  @override //video, image
  int get contentOrder => throw _privateConstructorUsedError;
  @override
  String get url => throw _privateConstructorUsedError;
  @override
  double get size => throw _privateConstructorUsedError;
  @override
  double? get length => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MediaCopyWith<_Media> get copyWith => throw _privateConstructorUsedError;
}
