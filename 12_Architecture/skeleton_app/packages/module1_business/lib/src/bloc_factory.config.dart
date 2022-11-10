// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:module1_data/module1_data.dart' as _i4;

import 'main_bloc.dart' as _i3;
import 'main_health_bloc.dart' as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.MainBloc>(
      () => _i3.MainBloc(userService: get<_i4.UserService>()));
  gh.factory<_i5.MainHealthBloc>(
      () => _i5.MainHealthBloc(healthService: get<_i4.HealthService>()));
  return get;
}
