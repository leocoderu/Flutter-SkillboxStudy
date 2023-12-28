// Model of App State with Hive

import 'package:hive/hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state_model.freezed.dart';

@HiveType(typeId: 1)
@freezed
class AppStateModel with _$AppStateModel{
  const factory AppStateModel({
    @HiveField(0)
    required bool summary_panel,
  }) = _AppStateModel;
}
