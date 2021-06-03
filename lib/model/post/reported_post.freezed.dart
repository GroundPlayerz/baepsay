// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'reported_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReportedPost _$ReportedPostFromJson(Map<String, dynamic> json) {
  return _ReportedPost.fromJson(json);
}

/// @nodoc
class _$ReportedPostTearOff {
  const _$ReportedPostTearOff();

  _ReportedPost call(
      {required int id,
      required int authorId,
      required double score,
      required String title,
      required String firstContentText,
      required String secondContentText,
      required String createdAt,
      required int reportCount}) {
    return _ReportedPost(
      id: id,
      authorId: authorId,
      score: score,
      title: title,
      firstContentText: firstContentText,
      secondContentText: secondContentText,
      createdAt: createdAt,
      reportCount: reportCount,
    );
  }

  ReportedPost fromJson(Map<String, Object> json) {
    return ReportedPost.fromJson(json);
  }
}

/// @nodoc
const $ReportedPost = _$ReportedPostTearOff();

/// @nodoc
mixin _$ReportedPost {
  int get id => throw _privateConstructorUsedError;
  int get authorId => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get firstContentText => throw _privateConstructorUsedError;
  String get secondContentText => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  int get reportCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportedPostCopyWith<ReportedPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportedPostCopyWith<$Res> {
  factory $ReportedPostCopyWith(
          ReportedPost value, $Res Function(ReportedPost) then) =
      _$ReportedPostCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int authorId,
      double score,
      String title,
      String firstContentText,
      String secondContentText,
      String createdAt,
      int reportCount});
}

/// @nodoc
class _$ReportedPostCopyWithImpl<$Res> implements $ReportedPostCopyWith<$Res> {
  _$ReportedPostCopyWithImpl(this._value, this._then);

  final ReportedPost _value;
  // ignore: unused_field
  final $Res Function(ReportedPost) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? authorId = freezed,
    Object? score = freezed,
    Object? title = freezed,
    Object? firstContentText = freezed,
    Object? secondContentText = freezed,
    Object? createdAt = freezed,
    Object? reportCount = freezed,
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
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
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
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      reportCount: reportCount == freezed
          ? _value.reportCount
          : reportCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ReportedPostCopyWith<$Res>
    implements $ReportedPostCopyWith<$Res> {
  factory _$ReportedPostCopyWith(
          _ReportedPost value, $Res Function(_ReportedPost) then) =
      __$ReportedPostCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int authorId,
      double score,
      String title,
      String firstContentText,
      String secondContentText,
      String createdAt,
      int reportCount});
}

/// @nodoc
class __$ReportedPostCopyWithImpl<$Res> extends _$ReportedPostCopyWithImpl<$Res>
    implements _$ReportedPostCopyWith<$Res> {
  __$ReportedPostCopyWithImpl(
      _ReportedPost _value, $Res Function(_ReportedPost) _then)
      : super(_value, (v) => _then(v as _ReportedPost));

  @override
  _ReportedPost get _value => super._value as _ReportedPost;

  @override
  $Res call({
    Object? id = freezed,
    Object? authorId = freezed,
    Object? score = freezed,
    Object? title = freezed,
    Object? firstContentText = freezed,
    Object? secondContentText = freezed,
    Object? createdAt = freezed,
    Object? reportCount = freezed,
  }) {
    return _then(_ReportedPost(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      authorId: authorId == freezed
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as int,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
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
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      reportCount: reportCount == freezed
          ? _value.reportCount
          : reportCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_ReportedPost implements _ReportedPost {
  _$_ReportedPost(
      {required this.id,
      required this.authorId,
      required this.score,
      required this.title,
      required this.firstContentText,
      required this.secondContentText,
      required this.createdAt,
      required this.reportCount});

  factory _$_ReportedPost.fromJson(Map<String, dynamic> json) =>
      _$_$_ReportedPostFromJson(json);

  @override
  final int id;
  @override
  final int authorId;
  @override
  final double score;
  @override
  final String title;
  @override
  final String firstContentText;
  @override
  final String secondContentText;
  @override
  final String createdAt;
  @override
  final int reportCount;

  @override
  String toString() {
    return 'ReportedPost(id: $id, authorId: $authorId, score: $score, title: $title, firstContentText: $firstContentText, secondContentText: $secondContentText, createdAt: $createdAt, reportCount: $reportCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ReportedPost &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.authorId, authorId) ||
                const DeepCollectionEquality()
                    .equals(other.authorId, authorId)) &&
            (identical(other.score, score) ||
                const DeepCollectionEquality().equals(other.score, score)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.firstContentText, firstContentText) ||
                const DeepCollectionEquality()
                    .equals(other.firstContentText, firstContentText)) &&
            (identical(other.secondContentText, secondContentText) ||
                const DeepCollectionEquality()
                    .equals(other.secondContentText, secondContentText)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.reportCount, reportCount) ||
                const DeepCollectionEquality()
                    .equals(other.reportCount, reportCount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(authorId) ^
      const DeepCollectionEquality().hash(score) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(firstContentText) ^
      const DeepCollectionEquality().hash(secondContentText) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(reportCount);

  @JsonKey(ignore: true)
  @override
  _$ReportedPostCopyWith<_ReportedPost> get copyWith =>
      __$ReportedPostCopyWithImpl<_ReportedPost>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ReportedPostToJson(this);
  }
}

abstract class _ReportedPost implements ReportedPost {
  factory _ReportedPost(
      {required int id,
      required int authorId,
      required double score,
      required String title,
      required String firstContentText,
      required String secondContentText,
      required String createdAt,
      required int reportCount}) = _$_ReportedPost;

  factory _ReportedPost.fromJson(Map<String, dynamic> json) =
      _$_ReportedPost.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  int get authorId => throw _privateConstructorUsedError;
  @override
  double get score => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get firstContentText => throw _privateConstructorUsedError;
  @override
  String get secondContentText => throw _privateConstructorUsedError;
  @override
  String get createdAt => throw _privateConstructorUsedError;
  @override
  int get reportCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ReportedPostCopyWith<_ReportedPost> get copyWith =>
      throw _privateConstructorUsedError;
}
