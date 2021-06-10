// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'simple_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SimplePost _$SimplePostFromJson(Map<String, dynamic> json) {
  return _SimplePost.fromJson(json);
}

/// @nodoc
class _$SimplePostTearOff {
  const _$SimplePostTearOff();

  _SimplePost call(
      {required int id,
      required int authorId,
      required double score,
      required String title,
      required String firstContentText,
      required String secondContentText,
      required String createdAt}) {
    return _SimplePost(
      id: id,
      authorId: authorId,
      score: score,
      title: title,
      firstContentText: firstContentText,
      secondContentText: secondContentText,
      createdAt: createdAt,
    );
  }

  SimplePost fromJson(Map<String, Object> json) {
    return SimplePost.fromJson(json);
  }
}

/// @nodoc
const $SimplePost = _$SimplePostTearOff();

/// @nodoc
mixin _$SimplePost {
  int get id => throw _privateConstructorUsedError;
  int get authorId => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get firstContentText => throw _privateConstructorUsedError;
  String get secondContentText => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SimplePostCopyWith<SimplePost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimplePostCopyWith<$Res> {
  factory $SimplePostCopyWith(
          SimplePost value, $Res Function(SimplePost) then) =
      _$SimplePostCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int authorId,
      double score,
      String title,
      String firstContentText,
      String secondContentText,
      String createdAt});
}

/// @nodoc
class _$SimplePostCopyWithImpl<$Res> implements $SimplePostCopyWith<$Res> {
  _$SimplePostCopyWithImpl(this._value, this._then);

  final SimplePost _value;
  // ignore: unused_field
  final $Res Function(SimplePost) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? authorId = freezed,
    Object? score = freezed,
    Object? title = freezed,
    Object? firstContentText = freezed,
    Object? secondContentText = freezed,
    Object? createdAt = freezed,
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
    ));
  }
}

/// @nodoc
abstract class _$SimplePostCopyWith<$Res> implements $SimplePostCopyWith<$Res> {
  factory _$SimplePostCopyWith(
          _SimplePost value, $Res Function(_SimplePost) then) =
      __$SimplePostCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int authorId,
      double score,
      String title,
      String firstContentText,
      String secondContentText,
      String createdAt});
}

/// @nodoc
class __$SimplePostCopyWithImpl<$Res> extends _$SimplePostCopyWithImpl<$Res>
    implements _$SimplePostCopyWith<$Res> {
  __$SimplePostCopyWithImpl(
      _SimplePost _value, $Res Function(_SimplePost) _then)
      : super(_value, (v) => _then(v as _SimplePost));

  @override
  _SimplePost get _value => super._value as _SimplePost;

  @override
  $Res call({
    Object? id = freezed,
    Object? authorId = freezed,
    Object? score = freezed,
    Object? title = freezed,
    Object? firstContentText = freezed,
    Object? secondContentText = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_SimplePost(
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
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_SimplePost implements _SimplePost {
  _$_SimplePost(
      {required this.id,
      required this.authorId,
      required this.score,
      required this.title,
      required this.firstContentText,
      required this.secondContentText,
      required this.createdAt});

  factory _$_SimplePost.fromJson(Map<String, dynamic> json) =>
      _$_$_SimplePostFromJson(json);

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
  String toString() {
    return 'SimplePost(id: $id, authorId: $authorId, score: $score, title: $title, firstContentText: $firstContentText, secondContentText: $secondContentText, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SimplePost &&
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
                    .equals(other.createdAt, createdAt)));
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
      const DeepCollectionEquality().hash(createdAt);

  @JsonKey(ignore: true)
  @override
  _$SimplePostCopyWith<_SimplePost> get copyWith =>
      __$SimplePostCopyWithImpl<_SimplePost>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SimplePostToJson(this);
  }
}

abstract class _SimplePost implements SimplePost {
  factory _SimplePost(
      {required int id,
      required int authorId,
      required double score,
      required String title,
      required String firstContentText,
      required String secondContentText,
      required String createdAt}) = _$_SimplePost;

  factory _SimplePost.fromJson(Map<String, dynamic> json) =
      _$_SimplePost.fromJson;

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
  @JsonKey(ignore: true)
  _$SimplePostCopyWith<_SimplePost> get copyWith =>
      throw _privateConstructorUsedError;
}
