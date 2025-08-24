// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:noor/core/database/azkar/azkar_database.dart' as _i155;
import 'package:noor/core/database/quran/quran_database.dart' as _i651;
import 'package:noor/core/di/register_module.dart' as _i662;
import 'package:noor/features/azkar/data/repos/azkar_repo.dart' as _i99;
import 'package:noor/features/azkar/logic/azkar_cubit.dart' as _i824;
import 'package:noor/features/home/logic/home_cubit.dart' as _i892;
import 'package:noor/features/quran/data/repos/quran_repo.dart' as _i1015;
import 'package:noor/features/quran/logic/quran_cubit.dart' as _i239;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i892.HomeCubit>(() => _i892.HomeCubit());
    gh.singleton<_i651.QuranDatabase>(() => _i651.QuranDatabase());
    gh.singleton<_i155.AzkarDatabase>(() => _i155.AzkarDatabase());
    gh.factory<_i99.AzkarRepo>(() => _i99.AzkarRepo(gh<_i155.AzkarDatabase>()));
    gh.factory<_i1015.QuranRepo>(
      () => _i1015.QuranRepo(gh<_i651.QuranDatabase>()),
    );
    gh.factory<_i824.AzkarCubit>(() => _i824.AzkarCubit(gh<_i99.AzkarRepo>()));
    gh.factory<_i239.QuranCubit>(
      () => _i239.QuranCubit(gh<_i1015.QuranRepo>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i662.RegisterModule {}
