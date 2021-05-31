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
      required int commentCount,
      required int likeCount,
      required int viewCount,
      required int firstContentVoteCount,
      required int secondContentVoteCount,
      required bool isLikeButtonPressed,
      required bool isVoted,
      required List<ImageMedia>? imageMediaList,
      required List<VideoMedia>? videoMediaList,
      required String createdAt,
      Vote? vote}) {
    return _Post(
      id: id,
      author: author,
      title: title,
      firstContentText: firstContentText,
      secondContentText: secondContentText,
      commentCount: commentCount,
      likeCount: likeCount,
      viewCount: viewCount,
      firstContentVoteCount: firstContentVoteCount,
      secondContentVoteCount: secondContentVoteCount,
      isLikeButtonPressed: isLikeButtonPressed,
      isVoted: isVoted,
      imageMediaList: imageMediaList,
      videoMediaList: videoMediaList,
      createdAt: createdAt,
      vote: vote,
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
  int get commentCount => throw _privateConstructorUsedError;
  int get likeCount => throw _privateConstructorUsedError;
  int get viewCount => throw _privateConstructorUsedError;
  int get firstContentVoteCount => throw _privateConstructorUsedError;
  int get secondContentVoteCount => throw _privateConstructorUsedError;
  bool get isLikeButtonPressed => throw _privateConstructorUsedError;
  bool get isVoted => throw _privateConstructorUsedError;
  List<ImageMedia>? get imageMediaList => throw _privateConstructorUsedError;
  List<VideoMedia>? get videoMediaList => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  Vote? get vote => throw _privateConstructorUsedError;

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
      int commentCount,
      int likeCount,
      int viewCount,
      int firstContentVoteCount,
      int secondContentVoteCount,
      bool isLikeButtonPressed,
      bool isVoted,
      List<ImageMedia>? imageMediaList,
      List<VideoMedia>? videoMediaList,
      String createdAt,
      Vote? vote});

  $UserCopyWith<$Res> get author;
  $VoteCopyWith<$Res>? get vote;
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
    Object? commentCount = freezed,
    Object? likeCount = freezed,
    Object? viewCount = freezed,
    Object? firstContentVoteCount = freezed,
    Object? secondContentVoteCount = freezed,
    Object? isLikeButtonPressed = freezed,
    Object? isVoted = freezed,
    Object? imageMediaList = freezed,
    Object? videoMediaList = freezed,
    Object? createdAt = freezed,
    Object? vote = freezed,
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
      isLikeButtonPressed: isLikeButtonPressed == freezed
          ? _value.isLikeButtonPressed
          : isLikeButtonPressed // ignore: cast_nullable_to_non_nullable
              as bool,
      isVoted: isVoted == freezed
          ? _value.isVoted
          : isVoted // ignore: cast_nullable_to_non_nullable
              as bool,
      imageMediaList: imageMediaList == freezed
          ? _value.imageMediaList
          : imageMediaList // ignore: cast_nullable_to_non_nullable
              as List<ImageMedia>?,
      videoMediaList: videoMediaList == freezed
          ? _value.videoMediaList
          : videoMediaList // ignore: cast_nullable_to_non_nullable
              as List<VideoMedia>?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      vote: vote == freezed
          ? _value.vote
          : vote // ignore: cast_nullable_to_non_nullable
              as Vote?,
    ));
  }

  @override
  $UserCopyWith<$Res> get author {
    return $UserCopyWith<$Res>(_value.author, (value) {
      return _then(_value.copyWith(author: value));
    });
  }

  @override
  $VoteCopyWith<$Res>? get vote {
    if (_value.vote == null) {
      return null;
    }

    return $VoteCopyWith<$Res>(_value.vote!, (value) {
      return _then(_value.copyWith(vote: value));
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
      int commentCount,
      int likeCount,
      int viewCount,
      int firstContentVoteCount,
      int secondContentVoteCount,
      bool isLikeButtonPressed,
      bool isVoted,
      List<ImageMedia>? imageMediaList,
      List<VideoMedia>? videoMediaList,
      String createdAt,
      Vote? vote});

  @override
  $UserCopyWith<$Res> get author;
  @override
  $VoteCopyWith<$Res>? get vote;
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
    Object? commentCount = freezed,
    Object? likeCount = freezed,
    Object? viewCount = freezed,
    Object? firstContentVoteCount = freezed,
    Object? secondContentVoteCount = freezed,
    Object? isLikeButtonPressed = freezed,
    Object? isVoted = freezed,
    Object? imageMediaList = freezed,
    Object? videoMediaList = freezed,
    Object? createdAt = freezed,
    Object? vote = freezed,
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
      isLikeButtonPressed: isLikeButtonPressed == freezed
          ? _value.isLikeButtonPressed
          : isLikeButtonPressed // ignore: cast_nullable_to_non_nullable
              as bool,
      isVoted: isVoted == freezed
          ? _value.isVoted
          : isVoted // ignore: cast_nullable_to_non_nullable
              as bool,
      imageMediaList: imageMediaList == freezed
          ? _value.imageMediaList
          : imageMediaList // ignore: cast_nullable_to_non_nullable
              as List<ImageMedia>?,
      videoMediaList: videoMediaList == freezed
          ? _value.videoMediaList
          : videoMediaList // ignore: cast_nullable_to_non_nullable
              as List<VideoMedia>?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      vote: vote == freezed
          ? _value.vote
          : vote // ignore: cast_nullable_to_non_nullable
              as Vote?,
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
      required this.commentCount,
      required this.likeCount,
      required this.viewCount,
      required this.firstContentVoteCount,
      required this.secondContentVoteCount,
      required this.isLikeButtonPressed,
      required this.isVoted,
      required this.imageMediaList,
      required this.videoMediaList,
      required this.createdAt,
      this.vote});

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
  final bool isLikeButtonPressed;
  @override
  final bool isVoted;
  @override
  final List<ImageMedia>? imageMediaList;
  @override
  final List<VideoMedia>? videoMediaList;
  @override
  final String createdAt;
  @override
  final Vote? vote;

  @override
  String toString() {
    return 'Post(id: $id, author: $author, title: $title, firstContentText: $firstContentText, secondContentText: $secondContentText, commentCount: $commentCount, likeCount: $likeCount, viewCount: $viewCount, firstContentVoteCount: $firstContentVoteCount, secondContentVoteCount: $secondContentVoteCount, isLikeButtonPressed: $isLikeButtonPressed, isVoted: $isVoted, imageMediaList: $imageMediaList, videoMediaList: $videoMediaList, createdAt: $createdAt, vote: $vote)';
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
            (identical(other.isLikeButtonPressed, isLikeButtonPressed) ||
                const DeepCollectionEquality()
                    .equals(other.isLikeButtonPressed, isLikeButtonPressed)) &&
            (identical(other.isVoted, isVoted) ||
                const DeepCollectionEquality()
                    .equals(other.isVoted, isVoted)) &&
            (identical(other.imageMediaList, imageMediaList) ||
                const DeepCollectionEquality()
                    .equals(other.imageMediaList, imageMediaList)) &&
            (identical(other.videoMediaList, videoMediaList) ||
                const DeepCollectionEquality()
                    .equals(other.videoMediaList, videoMediaList)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.vote, vote) ||
                const DeepCollectionEquality().equals(other.vote, vote)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(author) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(firstContentText) ^
      const DeepCollectionEquality().hash(secondContentText) ^
      const DeepCollectionEquality().hash(commentCount) ^
      const DeepCollectionEquality().hash(likeCount) ^
      const DeepCollectionEquality().hash(viewCount) ^
      const DeepCollectionEquality().hash(firstContentVoteCount) ^
      const DeepCollectionEquality().hash(secondContentVoteCount) ^
      const DeepCollectionEquality().hash(isLikeButtonPressed) ^
      const DeepCollectionEquality().hash(isVoted) ^
      const DeepCollectionEquality().hash(imageMediaList) ^
      const DeepCollectionEquality().hash(videoMediaList) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(vote);

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
      required int commentCount,
      required int likeCount,
      required int viewCount,
      required int firstContentVoteCount,
      required int secondContentVoteCount,
      required bool isLikeButtonPressed,
      required bool isVoted,
      required List<ImageMedia>? imageMediaList,
      required List<VideoMedia>? videoMediaList,
      required String createdAt,
      Vote? vote}) = _$_Post;

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
  bool get isLikeButtonPressed => throw _privateConstructorUsedError;
  @override
  bool get isVoted => throw _privateConstructorUsedError;
  @override
  List<ImageMedia>? get imageMediaList => throw _privateConstructorUsedError;
  @override
  List<VideoMedia>? get videoMediaList => throw _privateConstructorUsedError;
  @override
  String get createdAt => throw _privateConstructorUsedError;
  @override
  Vote? get vote => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PostCopyWith<_Post> get copyWith => throw _privateConstructorUsedError;
}

Vote _$VoteFromJson(Map<String, dynamic> json) {
  return _Vote.fromJson(json);
}

/// @nodoc
class _$VoteTearOff {
  const _$VoteTearOff();

  _Vote call(
      {required int id,
      required int postId,
      required int choice,
      required int userId,
      required String createdAt}) {
    return _Vote(
      id: id,
      postId: postId,
      choice: choice,
      userId: userId,
      createdAt: createdAt,
    );
  }

  Vote fromJson(Map<String, Object> json) {
    return Vote.fromJson(json);
  }
}

/// @nodoc
const $Vote = _$VoteTearOff();

/// @nodoc
mixin _$Vote {
  int get id => throw _privateConstructorUsedError;
  int get postId => throw _privateConstructorUsedError;
  int get choice => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VoteCopyWith<Vote> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoteCopyWith<$Res> {
  factory $VoteCopyWith(Vote value, $Res Function(Vote) then) =
      _$VoteCopyWithImpl<$Res>;
  $Res call({int id, int postId, int choice, int userId, String createdAt});
}

/// @nodoc
class _$VoteCopyWithImpl<$Res> implements $VoteCopyWith<$Res> {
  _$VoteCopyWithImpl(this._value, this._then);

  final Vote _value;
  // ignore: unused_field
  final $Res Function(Vote) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? postId = freezed,
    Object? choice = freezed,
    Object? userId = freezed,
    Object? createdAt = freezed,
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
      choice: choice == freezed
          ? _value.choice
          : choice // ignore: cast_nullable_to_non_nullable
              as int,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$VoteCopyWith<$Res> implements $VoteCopyWith<$Res> {
  factory _$VoteCopyWith(_Vote value, $Res Function(_Vote) then) =
      __$VoteCopyWithImpl<$Res>;
  @override
  $Res call({int id, int postId, int choice, int userId, String createdAt});
}

/// @nodoc
class __$VoteCopyWithImpl<$Res> extends _$VoteCopyWithImpl<$Res>
    implements _$VoteCopyWith<$Res> {
  __$VoteCopyWithImpl(_Vote _value, $Res Function(_Vote) _then)
      : super(_value, (v) => _then(v as _Vote));

  @override
  _Vote get _value => super._value as _Vote;

  @override
  $Res call({
    Object? id = freezed,
    Object? postId = freezed,
    Object? choice = freezed,
    Object? userId = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_Vote(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      choice: choice == freezed
          ? _value.choice
          : choice // ignore: cast_nullable_to_non_nullable
              as int,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Vote implements _Vote {
  _$_Vote(
      {required this.id,
      required this.postId,
      required this.choice,
      required this.userId,
      required this.createdAt});

  factory _$_Vote.fromJson(Map<String, dynamic> json) =>
      _$_$_VoteFromJson(json);

  @override
  final int id;
  @override
  final int postId;
  @override
  final int choice;
  @override
  final int userId;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'Vote(id: $id, postId: $postId, choice: $choice, userId: $userId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Vote &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.postId, postId) ||
                const DeepCollectionEquality().equals(other.postId, postId)) &&
            (identical(other.choice, choice) ||
                const DeepCollectionEquality().equals(other.choice, choice)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(postId) ^
      const DeepCollectionEquality().hash(choice) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(createdAt);

  @JsonKey(ignore: true)
  @override
  _$VoteCopyWith<_Vote> get copyWith =>
      __$VoteCopyWithImpl<_Vote>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_VoteToJson(this);
  }
}

abstract class _Vote implements Vote {
  factory _Vote(
      {required int id,
      required int postId,
      required int choice,
      required int userId,
      required String createdAt}) = _$_Vote;

  factory _Vote.fromJson(Map<String, dynamic> json) = _$_Vote.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  int get postId => throw _privateConstructorUsedError;
  @override
  int get choice => throw _privateConstructorUsedError;
  @override
  int get userId => throw _privateConstructorUsedError;
  @override
  String get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$VoteCopyWith<_Vote> get copyWith => throw _privateConstructorUsedError;
}

ImageMedia _$ImageMediaFromJson(Map<String, dynamic> json) {
  return _ImageMedia.fromJson(json);
}

/// @nodoc
class _$ImageMediaTearOff {
  const _$ImageMediaTearOff();

  _ImageMedia call(
      {required int id,
      required int postId,
      required String type,
      required int contentOrder,
      required String url,
      required double size}) {
    return _ImageMedia(
      id: id,
      postId: postId,
      type: type,
      contentOrder: contentOrder,
      url: url,
      size: size,
    );
  }

  ImageMedia fromJson(Map<String, Object> json) {
    return ImageMedia.fromJson(json);
  }
}

/// @nodoc
const $ImageMedia = _$ImageMediaTearOff();

/// @nodoc
mixin _$ImageMedia {
  int get id => throw _privateConstructorUsedError;
  int get postId => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; //video, image, thumbnail
  int get contentOrder => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  double get size => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageMediaCopyWith<ImageMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageMediaCopyWith<$Res> {
  factory $ImageMediaCopyWith(
          ImageMedia value, $Res Function(ImageMedia) then) =
      _$ImageMediaCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int postId,
      String type,
      int contentOrder,
      String url,
      double size});
}

/// @nodoc
class _$ImageMediaCopyWithImpl<$Res> implements $ImageMediaCopyWith<$Res> {
  _$ImageMediaCopyWithImpl(this._value, this._then);

  final ImageMedia _value;
  // ignore: unused_field
  final $Res Function(ImageMedia) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? postId = freezed,
    Object? type = freezed,
    Object? contentOrder = freezed,
    Object? url = freezed,
    Object? size = freezed,
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
    ));
  }
}

/// @nodoc
abstract class _$ImageMediaCopyWith<$Res> implements $ImageMediaCopyWith<$Res> {
  factory _$ImageMediaCopyWith(
          _ImageMedia value, $Res Function(_ImageMedia) then) =
      __$ImageMediaCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int postId,
      String type,
      int contentOrder,
      String url,
      double size});
}

/// @nodoc
class __$ImageMediaCopyWithImpl<$Res> extends _$ImageMediaCopyWithImpl<$Res>
    implements _$ImageMediaCopyWith<$Res> {
  __$ImageMediaCopyWithImpl(
      _ImageMedia _value, $Res Function(_ImageMedia) _then)
      : super(_value, (v) => _then(v as _ImageMedia));

  @override
  _ImageMedia get _value => super._value as _ImageMedia;

  @override
  $Res call({
    Object? id = freezed,
    Object? postId = freezed,
    Object? type = freezed,
    Object? contentOrder = freezed,
    Object? url = freezed,
    Object? size = freezed,
  }) {
    return _then(_ImageMedia(
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
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_ImageMedia implements _ImageMedia {
  _$_ImageMedia(
      {required this.id,
      required this.postId,
      required this.type,
      required this.contentOrder,
      required this.url,
      required this.size});

  factory _$_ImageMedia.fromJson(Map<String, dynamic> json) =>
      _$_$_ImageMediaFromJson(json);

  @override
  final int id;
  @override
  final int postId;
  @override
  final String type;
  @override //video, image, thumbnail
  final int contentOrder;
  @override
  final String url;
  @override
  final double size;

  @override
  String toString() {
    return 'ImageMedia(id: $id, postId: $postId, type: $type, contentOrder: $contentOrder, url: $url, size: $size)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ImageMedia &&
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
                const DeepCollectionEquality().equals(other.size, size)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(postId) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(contentOrder) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(size);

  @JsonKey(ignore: true)
  @override
  _$ImageMediaCopyWith<_ImageMedia> get copyWith =>
      __$ImageMediaCopyWithImpl<_ImageMedia>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ImageMediaToJson(this);
  }
}

abstract class _ImageMedia implements ImageMedia {
  factory _ImageMedia(
      {required int id,
      required int postId,
      required String type,
      required int contentOrder,
      required String url,
      required double size}) = _$_ImageMedia;

  factory _ImageMedia.fromJson(Map<String, dynamic> json) =
      _$_ImageMedia.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  int get postId => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
  @override //video, image, thumbnail
  int get contentOrder => throw _privateConstructorUsedError;
  @override
  String get url => throw _privateConstructorUsedError;
  @override
  double get size => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ImageMediaCopyWith<_ImageMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

VideoMedia _$VideoMediaFromJson(Map<String, dynamic> json) {
  return _VideoMedia.fromJson(json);
}

/// @nodoc
class _$VideoMediaTearOff {
  const _$VideoMediaTearOff();

  _VideoMedia call(
      {required int id,
      required int postId,
      required String type,
      required int contentOrder,
      required String url,
      required double size,
      required ImageMedia thumbnail}) {
    return _VideoMedia(
      id: id,
      postId: postId,
      type: type,
      contentOrder: contentOrder,
      url: url,
      size: size,
      thumbnail: thumbnail,
    );
  }

  VideoMedia fromJson(Map<String, Object> json) {
    return VideoMedia.fromJson(json);
  }
}

/// @nodoc
const $VideoMedia = _$VideoMediaTearOff();

/// @nodoc
mixin _$VideoMedia {
  int get id => throw _privateConstructorUsedError;
  int get postId => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; //video, image, thumbnail
  int get contentOrder => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  double get size => throw _privateConstructorUsedError;
  ImageMedia get thumbnail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideoMediaCopyWith<VideoMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoMediaCopyWith<$Res> {
  factory $VideoMediaCopyWith(
          VideoMedia value, $Res Function(VideoMedia) then) =
      _$VideoMediaCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int postId,
      String type,
      int contentOrder,
      String url,
      double size,
      ImageMedia thumbnail});

  $ImageMediaCopyWith<$Res> get thumbnail;
}

/// @nodoc
class _$VideoMediaCopyWithImpl<$Res> implements $VideoMediaCopyWith<$Res> {
  _$VideoMediaCopyWithImpl(this._value, this._then);

  final VideoMedia _value;
  // ignore: unused_field
  final $Res Function(VideoMedia) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? postId = freezed,
    Object? type = freezed,
    Object? contentOrder = freezed,
    Object? url = freezed,
    Object? size = freezed,
    Object? thumbnail = freezed,
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
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as ImageMedia,
    ));
  }

  @override
  $ImageMediaCopyWith<$Res> get thumbnail {
    return $ImageMediaCopyWith<$Res>(_value.thumbnail, (value) {
      return _then(_value.copyWith(thumbnail: value));
    });
  }
}

/// @nodoc
abstract class _$VideoMediaCopyWith<$Res> implements $VideoMediaCopyWith<$Res> {
  factory _$VideoMediaCopyWith(
          _VideoMedia value, $Res Function(_VideoMedia) then) =
      __$VideoMediaCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int postId,
      String type,
      int contentOrder,
      String url,
      double size,
      ImageMedia thumbnail});

  @override
  $ImageMediaCopyWith<$Res> get thumbnail;
}

/// @nodoc
class __$VideoMediaCopyWithImpl<$Res> extends _$VideoMediaCopyWithImpl<$Res>
    implements _$VideoMediaCopyWith<$Res> {
  __$VideoMediaCopyWithImpl(
      _VideoMedia _value, $Res Function(_VideoMedia) _then)
      : super(_value, (v) => _then(v as _VideoMedia));

  @override
  _VideoMedia get _value => super._value as _VideoMedia;

  @override
  $Res call({
    Object? id = freezed,
    Object? postId = freezed,
    Object? type = freezed,
    Object? contentOrder = freezed,
    Object? url = freezed,
    Object? size = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_VideoMedia(
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
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as ImageMedia,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_VideoMedia implements _VideoMedia {
  _$_VideoMedia(
      {required this.id,
      required this.postId,
      required this.type,
      required this.contentOrder,
      required this.url,
      required this.size,
      required this.thumbnail});

  factory _$_VideoMedia.fromJson(Map<String, dynamic> json) =>
      _$_$_VideoMediaFromJson(json);

  @override
  final int id;
  @override
  final int postId;
  @override
  final String type;
  @override //video, image, thumbnail
  final int contentOrder;
  @override
  final String url;
  @override
  final double size;
  @override
  final ImageMedia thumbnail;

  @override
  String toString() {
    return 'VideoMedia(id: $id, postId: $postId, type: $type, contentOrder: $contentOrder, url: $url, size: $size, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _VideoMedia &&
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
            (identical(other.thumbnail, thumbnail) ||
                const DeepCollectionEquality()
                    .equals(other.thumbnail, thumbnail)));
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
      const DeepCollectionEquality().hash(thumbnail);

  @JsonKey(ignore: true)
  @override
  _$VideoMediaCopyWith<_VideoMedia> get copyWith =>
      __$VideoMediaCopyWithImpl<_VideoMedia>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_VideoMediaToJson(this);
  }
}

abstract class _VideoMedia implements VideoMedia {
  factory _VideoMedia(
      {required int id,
      required int postId,
      required String type,
      required int contentOrder,
      required String url,
      required double size,
      required ImageMedia thumbnail}) = _$_VideoMedia;

  factory _VideoMedia.fromJson(Map<String, dynamic> json) =
      _$_VideoMedia.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  int get postId => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
  @override //video, image, thumbnail
  int get contentOrder => throw _privateConstructorUsedError;
  @override
  String get url => throw _privateConstructorUsedError;
  @override
  double get size => throw _privateConstructorUsedError;
  @override
  ImageMedia get thumbnail => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$VideoMediaCopyWith<_VideoMedia> get copyWith =>
      throw _privateConstructorUsedError;
}
