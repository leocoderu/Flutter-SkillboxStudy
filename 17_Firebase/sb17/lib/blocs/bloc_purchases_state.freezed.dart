// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bloc_purchases_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BlocPurchasesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<ApiPurchase> purchases) loaded,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<ApiPurchase> purchases)? loaded,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<ApiPurchase> purchases)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BlocPurchasesStateLoading value) loading,
    required TResult Function(BlocPurchasesStateLoaded value) loaded,
    required TResult Function(BlocPurchasesStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BlocPurchasesStateLoading value)? loading,
    TResult? Function(BlocPurchasesStateLoaded value)? loaded,
    TResult? Function(BlocPurchasesStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BlocPurchasesStateLoading value)? loading,
    TResult Function(BlocPurchasesStateLoaded value)? loaded,
    TResult Function(BlocPurchasesStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlocPurchasesStateCopyWith<$Res> {
  factory $BlocPurchasesStateCopyWith(
          BlocPurchasesState value, $Res Function(BlocPurchasesState) then) =
      _$BlocPurchasesStateCopyWithImpl<$Res, BlocPurchasesState>;
}

/// @nodoc
class _$BlocPurchasesStateCopyWithImpl<$Res, $Val extends BlocPurchasesState>
    implements $BlocPurchasesStateCopyWith<$Res> {
  _$BlocPurchasesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$BlocPurchasesStateLoadingCopyWith<$Res> {
  factory _$$BlocPurchasesStateLoadingCopyWith(
          _$BlocPurchasesStateLoading value,
          $Res Function(_$BlocPurchasesStateLoading) then) =
      __$$BlocPurchasesStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BlocPurchasesStateLoadingCopyWithImpl<$Res>
    extends _$BlocPurchasesStateCopyWithImpl<$Res, _$BlocPurchasesStateLoading>
    implements _$$BlocPurchasesStateLoadingCopyWith<$Res> {
  __$$BlocPurchasesStateLoadingCopyWithImpl(_$BlocPurchasesStateLoading _value,
      $Res Function(_$BlocPurchasesStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BlocPurchasesStateLoading implements BlocPurchasesStateLoading {
  const _$BlocPurchasesStateLoading();

  @override
  String toString() {
    return 'BlocPurchasesState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlocPurchasesStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<ApiPurchase> purchases) loaded,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<ApiPurchase> purchases)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<ApiPurchase> purchases)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BlocPurchasesStateLoading value) loading,
    required TResult Function(BlocPurchasesStateLoaded value) loaded,
    required TResult Function(BlocPurchasesStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BlocPurchasesStateLoading value)? loading,
    TResult? Function(BlocPurchasesStateLoaded value)? loaded,
    TResult? Function(BlocPurchasesStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BlocPurchasesStateLoading value)? loading,
    TResult Function(BlocPurchasesStateLoaded value)? loaded,
    TResult Function(BlocPurchasesStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class BlocPurchasesStateLoading implements BlocPurchasesState {
  const factory BlocPurchasesStateLoading() = _$BlocPurchasesStateLoading;
}

/// @nodoc
abstract class _$$BlocPurchasesStateLoadedCopyWith<$Res> {
  factory _$$BlocPurchasesStateLoadedCopyWith(_$BlocPurchasesStateLoaded value,
          $Res Function(_$BlocPurchasesStateLoaded) then) =
      __$$BlocPurchasesStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ApiPurchase> purchases});
}

/// @nodoc
class __$$BlocPurchasesStateLoadedCopyWithImpl<$Res>
    extends _$BlocPurchasesStateCopyWithImpl<$Res, _$BlocPurchasesStateLoaded>
    implements _$$BlocPurchasesStateLoadedCopyWith<$Res> {
  __$$BlocPurchasesStateLoadedCopyWithImpl(_$BlocPurchasesStateLoaded _value,
      $Res Function(_$BlocPurchasesStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchases = null,
  }) {
    return _then(_$BlocPurchasesStateLoaded(
      null == purchases
          ? _value._purchases
          : purchases // ignore: cast_nullable_to_non_nullable
              as List<ApiPurchase>,
    ));
  }
}

/// @nodoc

class _$BlocPurchasesStateLoaded implements BlocPurchasesStateLoaded {
  const _$BlocPurchasesStateLoaded(final List<ApiPurchase> purchases)
      : _purchases = purchases;

  final List<ApiPurchase> _purchases;
  @override
  List<ApiPurchase> get purchases {
    if (_purchases is EqualUnmodifiableListView) return _purchases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_purchases);
  }

  @override
  String toString() {
    return 'BlocPurchasesState.loaded(purchases: $purchases)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlocPurchasesStateLoaded &&
            const DeepCollectionEquality()
                .equals(other._purchases, _purchases));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_purchases));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlocPurchasesStateLoadedCopyWith<_$BlocPurchasesStateLoaded>
      get copyWith =>
          __$$BlocPurchasesStateLoadedCopyWithImpl<_$BlocPurchasesStateLoaded>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<ApiPurchase> purchases) loaded,
    required TResult Function(String error) error,
  }) {
    return loaded(purchases);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<ApiPurchase> purchases)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loaded?.call(purchases);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<ApiPurchase> purchases)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(purchases);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BlocPurchasesStateLoading value) loading,
    required TResult Function(BlocPurchasesStateLoaded value) loaded,
    required TResult Function(BlocPurchasesStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BlocPurchasesStateLoading value)? loading,
    TResult? Function(BlocPurchasesStateLoaded value)? loaded,
    TResult? Function(BlocPurchasesStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BlocPurchasesStateLoading value)? loading,
    TResult Function(BlocPurchasesStateLoaded value)? loaded,
    TResult Function(BlocPurchasesStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class BlocPurchasesStateLoaded implements BlocPurchasesState {
  const factory BlocPurchasesStateLoaded(final List<ApiPurchase> purchases) =
      _$BlocPurchasesStateLoaded;

  List<ApiPurchase> get purchases;
  @JsonKey(ignore: true)
  _$$BlocPurchasesStateLoadedCopyWith<_$BlocPurchasesStateLoaded>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BlocPurchasesStateErrorCopyWith<$Res> {
  factory _$$BlocPurchasesStateErrorCopyWith(_$BlocPurchasesStateError value,
          $Res Function(_$BlocPurchasesStateError) then) =
      __$$BlocPurchasesStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$BlocPurchasesStateErrorCopyWithImpl<$Res>
    extends _$BlocPurchasesStateCopyWithImpl<$Res, _$BlocPurchasesStateError>
    implements _$$BlocPurchasesStateErrorCopyWith<$Res> {
  __$$BlocPurchasesStateErrorCopyWithImpl(_$BlocPurchasesStateError _value,
      $Res Function(_$BlocPurchasesStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$BlocPurchasesStateError(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BlocPurchasesStateError implements BlocPurchasesStateError {
  const _$BlocPurchasesStateError(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'BlocPurchasesState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlocPurchasesStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlocPurchasesStateErrorCopyWith<_$BlocPurchasesStateError> get copyWith =>
      __$$BlocPurchasesStateErrorCopyWithImpl<_$BlocPurchasesStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<ApiPurchase> purchases) loaded,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<ApiPurchase> purchases)? loaded,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<ApiPurchase> purchases)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BlocPurchasesStateLoading value) loading,
    required TResult Function(BlocPurchasesStateLoaded value) loaded,
    required TResult Function(BlocPurchasesStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BlocPurchasesStateLoading value)? loading,
    TResult? Function(BlocPurchasesStateLoaded value)? loaded,
    TResult? Function(BlocPurchasesStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BlocPurchasesStateLoading value)? loading,
    TResult Function(BlocPurchasesStateLoaded value)? loaded,
    TResult Function(BlocPurchasesStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class BlocPurchasesStateError implements BlocPurchasesState {
  const factory BlocPurchasesStateError(final String error) =
      _$BlocPurchasesStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$BlocPurchasesStateErrorCopyWith<_$BlocPurchasesStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
