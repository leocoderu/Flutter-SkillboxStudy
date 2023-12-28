// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppStateModel {
  @HiveField(0)
  bool get summary_panel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateModelCopyWith<AppStateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateModelCopyWith<$Res> {
  factory $AppStateModelCopyWith(
          AppStateModel value, $Res Function(AppStateModel) then) =
      _$AppStateModelCopyWithImpl<$Res, AppStateModel>;
  @useResult
  $Res call({@HiveField(0) bool summary_panel});
}

/// @nodoc
class _$AppStateModelCopyWithImpl<$Res, $Val extends AppStateModel>
    implements $AppStateModelCopyWith<$Res> {
  _$AppStateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary_panel = null,
  }) {
    return _then(_value.copyWith(
      summary_panel: null == summary_panel
          ? _value.summary_panel
          : summary_panel // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppStateModelCopyWith<$Res>
    implements $AppStateModelCopyWith<$Res> {
  factory _$$_AppStateModelCopyWith(
          _$_AppStateModel value, $Res Function(_$_AppStateModel) then) =
      __$$_AppStateModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) bool summary_panel});
}

/// @nodoc
class __$$_AppStateModelCopyWithImpl<$Res>
    extends _$AppStateModelCopyWithImpl<$Res, _$_AppStateModel>
    implements _$$_AppStateModelCopyWith<$Res> {
  __$$_AppStateModelCopyWithImpl(
      _$_AppStateModel _value, $Res Function(_$_AppStateModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary_panel = null,
  }) {
    return _then(_$_AppStateModel(
      summary_panel: null == summary_panel
          ? _value.summary_panel
          : summary_panel // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AppStateModel implements _AppStateModel {
  const _$_AppStateModel({@HiveField(0) required this.summary_panel});

  @override
  @HiveField(0)
  final bool summary_panel;

  @override
  String toString() {
    return 'AppStateModel(summary_panel: $summary_panel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppStateModel &&
            (identical(other.summary_panel, summary_panel) ||
                other.summary_panel == summary_panel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, summary_panel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppStateModelCopyWith<_$_AppStateModel> get copyWith =>
      __$$_AppStateModelCopyWithImpl<_$_AppStateModel>(this, _$identity);
}

abstract class _AppStateModel implements AppStateModel {
  const factory _AppStateModel(
      {@HiveField(0) required final bool summary_panel}) = _$_AppStateModel;

  @override
  @HiveField(0)
  bool get summary_panel;
  @override
  @JsonKey(ignore: true)
  _$$_AppStateModelCopyWith<_$_AppStateModel> get copyWith =>
      throw _privateConstructorUsedError;
}
