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

  @JsonKey(ignore: true)
  $SomeDataCopyWith<SomeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SomeDataCopyWith<$Res> {
  factory $SomeDataCopyWith(SomeData value, $Res Function(SomeData) then) =
      _$SomeDataCopyWithImpl<$Res, SomeData>;
  @useResult
  $Res call({double first, String text, int count});
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SomeDataCopyWith<$Res> implements $SomeDataCopyWith<$Res> {
  factory _$$_SomeDataCopyWith(
          _$_SomeData value, $Res Function(_$_SomeData) then) =
      __$$_SomeDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double first, String text, int count});
}

/// @nodoc
class __$$_SomeDataCopyWithImpl<$Res>
    extends _$SomeDataCopyWithImpl<$Res, _$_SomeData>
    implements _$$_SomeDataCopyWith<$Res> {
  __$$_SomeDataCopyWithImpl(
      _$_SomeData _value, $Res Function(_$_SomeData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = null,
    Object? text = null,
    Object? count = null,
  }) {
    return _then(_$_SomeData(
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
    ));
  }
}

/// @nodoc

class _$_SomeData implements _SomeData {
  const _$_SomeData(
      {required this.first, required this.text, required this.count});

  @override
  final double first;
  @override
  final String text;
  @override
  final int count;

  @override
  String toString() {
    return 'SomeData(first: $first, text: $text, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SomeData &&
            (identical(other.first, first) || other.first == first) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, first, text, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SomeDataCopyWith<_$_SomeData> get copyWith =>
      __$$_SomeDataCopyWithImpl<_$_SomeData>(this, _$identity);
}

abstract class _SomeData implements SomeData {
  const factory _SomeData(
      {required final double first,
      required final String text,
      required final int count}) = _$_SomeData;

  @override
  double get first;
  @override
  String get text;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_SomeDataCopyWith<_$_SomeData> get copyWith =>
      throw _privateConstructorUsedError;
}
