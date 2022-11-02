// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'main_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainBlocState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(UserData userData) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(UserData userData)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(UserData userData)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MainLoadingState value) loading,
    required TResult Function(MainLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MainLoadingState value)? loading,
    TResult? Function(MainLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MainLoadingState value)? loading,
    TResult Function(MainLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainBlocStateCopyWith<$Res> {
  factory $MainBlocStateCopyWith(
          MainBlocState value, $Res Function(MainBlocState) then) =
      _$MainBlocStateCopyWithImpl<$Res, MainBlocState>;
}

/// @nodoc
class _$MainBlocStateCopyWithImpl<$Res, $Val extends MainBlocState>
    implements $MainBlocStateCopyWith<$Res> {
  _$MainBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MainLoadingStateCopyWith<$Res> {
  factory _$$MainLoadingStateCopyWith(
          _$MainLoadingState value, $Res Function(_$MainLoadingState) then) =
      __$$MainLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MainLoadingStateCopyWithImpl<$Res>
    extends _$MainBlocStateCopyWithImpl<$Res, _$MainLoadingState>
    implements _$$MainLoadingStateCopyWith<$Res> {
  __$$MainLoadingStateCopyWithImpl(
      _$MainLoadingState _value, $Res Function(_$MainLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MainLoadingState implements MainLoadingState {
  const _$MainLoadingState();

  @override
  String toString() {
    return 'MainBlocState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MainLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(UserData userData) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(UserData userData)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(UserData userData)? loaded,
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
    required TResult Function(MainLoadingState value) loading,
    required TResult Function(MainLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MainLoadingState value)? loading,
    TResult? Function(MainLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MainLoadingState value)? loading,
    TResult Function(MainLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MainLoadingState implements MainBlocState {
  const factory MainLoadingState() = _$MainLoadingState;
}

/// @nodoc
abstract class _$$MainLoadedStateCopyWith<$Res> {
  factory _$$MainLoadedStateCopyWith(
          _$MainLoadedState value, $Res Function(_$MainLoadedState) then) =
      __$$MainLoadedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({UserData userData});

  $UserDataCopyWith<$Res> get userData;
}

/// @nodoc
class __$$MainLoadedStateCopyWithImpl<$Res>
    extends _$MainBlocStateCopyWithImpl<$Res, _$MainLoadedState>
    implements _$$MainLoadedStateCopyWith<$Res> {
  __$$MainLoadedStateCopyWithImpl(
      _$MainLoadedState _value, $Res Function(_$MainLoadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userData = null,
  }) {
    return _then(_$MainLoadedState(
      userData: null == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserData,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res> get userData {
    return $UserDataCopyWith<$Res>(_value.userData, (value) {
      return _then(_value.copyWith(userData: value));
    });
  }
}

/// @nodoc

class _$MainLoadedState implements MainLoadedState {
  const _$MainLoadedState({required this.userData});

  @override
  final UserData userData;

  @override
  String toString() {
    return 'MainBlocState.loaded(userData: $userData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainLoadedState &&
            (identical(other.userData, userData) ||
                other.userData == userData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainLoadedStateCopyWith<_$MainLoadedState> get copyWith =>
      __$$MainLoadedStateCopyWithImpl<_$MainLoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(UserData userData) loaded,
  }) {
    return loaded(userData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(UserData userData)? loaded,
  }) {
    return loaded?.call(userData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(UserData userData)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(userData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MainLoadingState value) loading,
    required TResult Function(MainLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MainLoadingState value)? loading,
    TResult? Function(MainLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MainLoadingState value)? loading,
    TResult Function(MainLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class MainLoadedState implements MainBlocState {
  const factory MainLoadedState({required final UserData userData}) =
      _$MainLoadedState;

  UserData get userData;
  @JsonKey(ignore: true)
  _$$MainLoadedStateCopyWith<_$MainLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MainBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(int userId) setUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int userId)? setUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int userId)? setUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainInitEvent value) init,
    required TResult Function(_MainSetEvent value) setUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MainInitEvent value)? init,
    TResult? Function(_MainSetEvent value)? setUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainInitEvent value)? init,
    TResult Function(_MainSetEvent value)? setUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainBlocEventCopyWith<$Res> {
  factory $MainBlocEventCopyWith(
          MainBlocEvent value, $Res Function(MainBlocEvent) then) =
      _$MainBlocEventCopyWithImpl<$Res, MainBlocEvent>;
}

/// @nodoc
class _$MainBlocEventCopyWithImpl<$Res, $Val extends MainBlocEvent>
    implements $MainBlocEventCopyWith<$Res> {
  _$MainBlocEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_MainInitEventCopyWith<$Res> {
  factory _$$_MainInitEventCopyWith(
          _$_MainInitEvent value, $Res Function(_$_MainInitEvent) then) =
      __$$_MainInitEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_MainInitEventCopyWithImpl<$Res>
    extends _$MainBlocEventCopyWithImpl<$Res, _$_MainInitEvent>
    implements _$$_MainInitEventCopyWith<$Res> {
  __$$_MainInitEventCopyWithImpl(
      _$_MainInitEvent _value, $Res Function(_$_MainInitEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_MainInitEvent implements _MainInitEvent {
  const _$_MainInitEvent();

  @override
  String toString() {
    return 'MainBlocEvent.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_MainInitEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(int userId) setUser,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int userId)? setUser,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int userId)? setUser,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainInitEvent value) init,
    required TResult Function(_MainSetEvent value) setUser,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MainInitEvent value)? init,
    TResult? Function(_MainSetEvent value)? setUser,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainInitEvent value)? init,
    TResult Function(_MainSetEvent value)? setUser,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _MainInitEvent implements MainBlocEvent {
  const factory _MainInitEvent() = _$_MainInitEvent;
}

/// @nodoc
abstract class _$$_MainSetEventCopyWith<$Res> {
  factory _$$_MainSetEventCopyWith(
          _$_MainSetEvent value, $Res Function(_$_MainSetEvent) then) =
      __$$_MainSetEventCopyWithImpl<$Res>;
  @useResult
  $Res call({int userId});
}

/// @nodoc
class __$$_MainSetEventCopyWithImpl<$Res>
    extends _$MainBlocEventCopyWithImpl<$Res, _$_MainSetEvent>
    implements _$$_MainSetEventCopyWith<$Res> {
  __$$_MainSetEventCopyWithImpl(
      _$_MainSetEvent _value, $Res Function(_$_MainSetEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$_MainSetEvent(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_MainSetEvent implements _MainSetEvent {
  const _$_MainSetEvent({required this.userId});

  @override
  final int userId;

  @override
  String toString() {
    return 'MainBlocEvent.setUser(userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainSetEvent &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MainSetEventCopyWith<_$_MainSetEvent> get copyWith =>
      __$$_MainSetEventCopyWithImpl<_$_MainSetEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(int userId) setUser,
  }) {
    return setUser(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int userId)? setUser,
  }) {
    return setUser?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int userId)? setUser,
    required TResult orElse(),
  }) {
    if (setUser != null) {
      return setUser(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainInitEvent value) init,
    required TResult Function(_MainSetEvent value) setUser,
  }) {
    return setUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MainInitEvent value)? init,
    TResult? Function(_MainSetEvent value)? setUser,
  }) {
    return setUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainInitEvent value)? init,
    TResult Function(_MainSetEvent value)? setUser,
    required TResult orElse(),
  }) {
    if (setUser != null) {
      return setUser(this);
    }
    return orElse();
  }
}

abstract class _MainSetEvent implements MainBlocEvent {
  const factory _MainSetEvent({required final int userId}) = _$_MainSetEvent;

  int get userId;
  @JsonKey(ignore: true)
  _$$_MainSetEventCopyWith<_$_MainSetEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
