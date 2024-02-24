// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'some_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SomeData {
  double get first => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  List<String> get posts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SomeDataCopyWith<SomeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SomeDataCopyWith<$Res> {
  factory $SomeDataCopyWith(SomeData value, $Res Function(SomeData) then) =
      _$SomeDataCopyWithImpl<$Res, SomeData>;
  @useResult
  $Res call({double first, String text, int count, List<String> posts});
}

/// @nodoc
class _$SomeDataCopyWithImpl<$Res, $Val extends SomeData>
    implements $SomeDataCopyWith<$Res> {
  _$SomeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = null,
    Object? text = null,
    Object? count = null,
    Object? posts = null,
  }) {
    return _then(_value.copyWith(
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as double,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SomeDataImplCopyWith<$Res>
    implements $SomeDataCopyWith<$Res> {
  factory _$$SomeDataImplCopyWith(
          _$SomeDataImpl value, $Res Function(_$SomeDataImpl) then) =
      __$$SomeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double first, String text, int count, List<String> posts});
}

/// @nodoc
class __$$SomeDataImplCopyWithImpl<$Res>
    extends _$SomeDataCopyWithImpl<$Res, _$SomeDataImpl>
    implements _$$SomeDataImplCopyWith<$Res> {
  __$$SomeDataImplCopyWithImpl(
      _$SomeDataImpl _value, $Res Function(_$SomeDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = null,
    Object? text = null,
    Object? count = null,
    Object? posts = null,
  }) {
    return _then(_$SomeDataImpl(
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as double,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      posts: null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$SomeDataImpl implements _SomeData {
  const _$SomeDataImpl(
      {required this.first,
      required this.text,
      required this.count,
      required final List<String> posts})
      : _posts = posts;

  @override
  final double first;
  @override
  final String text;
  @override
  final int count;
  final List<String> _posts;
  @override
  List<String> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  String toString() {
    return 'SomeData(first: $first, text: $text, count: $count, posts: $posts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SomeDataImpl &&
            (identical(other.first, first) || other.first == first) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other._posts, _posts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, first, text, count,
      const DeepCollectionEquality().hash(_posts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SomeDataImplCopyWith<_$SomeDataImpl> get copyWith =>
      __$$SomeDataImplCopyWithImpl<_$SomeDataImpl>(this, _$identity);
}

abstract class _SomeData implements SomeData {
  const factory _SomeData(
      {required final double first,
      required final String text,
      required final int count,
      required final List<String> posts}) = _$SomeDataImpl;

  @override
  double get first;
  @override
  String get text;
  @override
  int get count;
  @override
  List<String> get posts;
  @override
  @JsonKey(ignore: true)
  _$$SomeDataImplCopyWith<_$SomeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
