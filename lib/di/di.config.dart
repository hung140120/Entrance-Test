// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:entrance_test/di/di.dart' as _i11;
import 'package:entrance_test/helpers/location_helper.dart' as _i3;
import 'package:entrance_test/repository/database/app_database.dart' as _i6;
import 'package:entrance_test/repository/user_location_repository.dart' as _i7;
import 'package:entrance_test/ui/home/bloc/home_bloc.dart' as _i8;
import 'package:entrance_test/ui/list_location/bloc/list_bloc.dart' as _i9;
import 'package:entrance_test/ui/map/bloc/map_bloc.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:objectbox/objectbox.dart' as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final serviceModule = _$ServiceModule();
    gh.lazySingleton<_i3.LocationHelper>(() => _i3.LocationHelper());
    await gh.factoryAsync<_i4.SharedPreferences>(
      () => serviceModule.prefs,
      preResolve: true,
    );
    await gh.factoryAsync<_i5.Store>(
      () => serviceModule.getStore(),
      preResolve: true,
    );
    gh.lazySingleton<_i6.AppDatabase>(() => _i6.AppDatabase(gh<_i5.Store>()));
    gh.lazySingleton<_i7.UserLocationRepository>(
        () => _i7.UserLocationRepository(gh<_i6.AppDatabase>()));
    gh.factory<_i8.HomeBloc>(() => _i8.HomeBloc(
          gh<_i7.UserLocationRepository>(),
          gh<_i3.LocationHelper>(),
        ));
    gh.factory<_i9.ListBloc>(
        () => _i9.ListBloc(gh<_i7.UserLocationRepository>()));
    gh.factory<_i10.MapBloc>(
        () => _i10.MapBloc(gh<_i7.UserLocationRepository>()));
    return this;
  }
}

class _$ServiceModule extends _i11.ServiceModule {}
