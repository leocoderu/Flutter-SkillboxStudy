// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_purchase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiPurchase _$ApiPurchaseFromJson(Map<String, dynamic> json) {
  return _ApiPurchase.fromJson(json);
}

/// @nodoc
mixin _$ApiPurchase {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  bool get isBought => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiPurchaseCopyWith<ApiPurchase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiPurchaseCopyWith<$Res> {
  factory $ApiPurchaseCopyWith(
          ApiPurchase value, $Res Function(ApiPurchase) then) =
      _$ApiPurchaseCopyWithImpl<$Res, ApiPurchase>;
  @useResult
  $Res call({String id, String label, bool isBought});
}

/// @nodoc
class _$ApiPurchaseCopyWithImpl<$Res, $Val extends ApiPurchase>
    implements $ApiPurchaseCopyWith<$Res> {
  _$ApiPurchaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? isBought = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      isBought: null == isBought
          ? _value.isBought
          : isBought // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApiPurchaseCopyWith<$Res>
    implements $ApiPurchaseCopyWith<$Res> {
  factory _$$_ApiPurchaseCopyWith(
          _$_ApiPurchase value, $Res Function(_$_ApiPurchase) then) =
      __$$_ApiPurchaseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String label, bool isBought});
}

/// @nodoc
class __$$_ApiPurchaseCopyWithImpl<$Res>
    extends _$ApiPurchaseCopyWithImpl<$Res, _$_ApiPurchase>
    implements _$$_ApiPurchaseCopyWith<$Res> {
  __$$_ApiPurchaseCopyWithImpl(
      _$_ApiPurchase _value, $Res Function(_$_ApiPurchase) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? isBought = null,
  }) {
    return _then(_$_ApiPurchase(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      isBought: null == isBought
          ? _value.isBought
          : isBought // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApiPurchase implements _ApiPurchase {
  const _$_ApiPurchase(
      {required this.id, required this.label, required this.isBought});

  factory _$_ApiPurchase.fromJson(Map<String, dynamic> json) =>
      _$$_ApiPurchaseFromJson(json);

  @override
  final String id;
  @override
  final String label;
  @override
  final bool isBought;

  @override
  String toString() {
    return 'ApiPurchase(id: $id, label: $label, isBought: $isBought)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiPurchase &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.isBought, isBought) ||
                other.isBought == isBought));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, label, isBought);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiPurchaseCopyWith<_$_ApiPurchase> get copyWith =>
      __$$_ApiPurchaseCopyWithImpl<_$_ApiPurchase>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiPurchaseToJson(
      this,
    );
  }
}

abstract class _ApiPurchase implements ApiPurchase {
  const factory _ApiPurchase(
      {required final String id,
      required final String label,
      required final bool isBought}) = _$_ApiPurchase;

  factory _ApiPurchase.fromJson(Map<String, dynamic> json) =
      _$_ApiPurchase.fromJson;

  @override
  String get id;
  @override
  String get label;
  @override
  bool get isBought;
  @override
  @JsonKey(ignore: true)
  _$$_ApiPurchaseCopyWith<_$_ApiPurchase> get copyWith =>
      throw _privateConstructorUsedError;
}
