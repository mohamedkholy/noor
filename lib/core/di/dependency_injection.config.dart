// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:noor/core/database/azkar/azkar_database.dart' as _i155;
import 'package:noor/core/database/cities/cities_database.dart' as _i502;
import 'package:noor/core/database/hadith/hadith_database.dart' as _i928;
import 'package:noor/core/database/mosques/mosques_database.dart' as _i495;
import 'package:noor/core/database/quran/quran_database.dart' as _i651;
import 'package:noor/core/database/tasbih/tasbih_database.dart' as _i339;
import 'package:noor/core/di/register_module.dart' as _i662;
import 'package:noor/core/logic/language_cubit.dart' as _i1019;
import 'package:noor/core/networking/mosque_api_service.dart' as _i543;
import 'package:noor/core/notifications/notifications_manager.dart' as _i555;
import 'package:noor/core/shared_preferences/shared_preferences_language_service.dart'
    as _i655;
import 'package:noor/core/shared_preferences/shared_preferences_settings_service.dart'
    as _i479;
import 'package:noor/features/azkar/data/repos/azkar_repo.dart' as _i99;
import 'package:noor/features/azkar/logic/azkar_cubit.dart' as _i824;
import 'package:noor/features/hadith/data/repos/hadith_repo.dart' as _i952;
import 'package:noor/features/hadith/logic/hadith_cubit.dart' as _i501;
import 'package:noor/features/home/data/repos/home_repo.dart' as _i298;
import 'package:noor/features/home/logic/home_cubit.dart' as _i892;
import 'package:noor/features/location/data/repos/location_repo.dart' as _i839;
import 'package:noor/features/location/logic/location_cubit.dart' as _i803;
import 'package:noor/features/navigation/data/repos/navigation_repo.dart'
    as _i730;
import 'package:noor/features/navigation/logic/navigation_cubit.dart' as _i915;
import 'package:noor/features/near_mosque/data/repos/near_mosque_repo.dart'
    as _i1051;
import 'package:noor/features/near_mosque/logic/near_mosque_cubit.dart'
    as _i881;
import 'package:noor/features/quran/data/repos/quran_repo.dart' as _i1015;
import 'package:noor/features/quran/logic/quran_cubit.dart' as _i239;
import 'package:noor/features/settings/logic/settings_cubit.dart' as _i663;
import 'package:noor/features/tasbih/data/repos/tasbih_repo.dart' as _i966;
import 'package:noor/features/tasbih/logic/tasbih_cubit.dart' as _i434;
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
    gh.factory<_i361.Dio>(() => registerModule.dio);
    gh.singleton<_i155.AzkarDatabase>(() => _i155.AzkarDatabase());
    gh.singleton<_i502.CitiesDatabase>(() => _i502.CitiesDatabase());
    gh.singleton<_i928.HadithDatabase>(() => _i928.HadithDatabase());
    gh.singleton<_i495.MosquesDatabase>(() => _i495.MosquesDatabase());
    gh.singleton<_i651.QuranDatabase>(() => _i651.QuranDatabase());
    gh.singleton<_i339.TasbihDatabase>(() => _i339.TasbihDatabase());
    gh.factory<_i298.HomeRepo>(
      () =>
          _i298.HomeRepo(gh<_i928.HadithDatabase>(), gh<_i651.QuranDatabase>()),
    );
    gh.factory<_i839.LocationRepo>(
      () => _i839.LocationRepo(gh<_i502.CitiesDatabase>()),
    );
    gh.factory<_i543.MosqueApiService>(
      () => _i543.MosqueApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i655.SharedPreferencesLanguageService>(
      () =>
          _i655.SharedPreferencesLanguageService(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i1019.LanguageCubit>(
      () => _i1019.LanguageCubit(gh<_i655.SharedPreferencesLanguageService>()),
    );
    gh.singleton<_i952.HadithRepo>(
      () => _i952.HadithRepo(gh<_i928.HadithDatabase>()),
    );
    gh.factory<_i966.TasbihRepo>(
      () => _i966.TasbihRepo(gh<_i339.TasbihDatabase>()),
    );
    gh.factory<_i99.AzkarRepo>(() => _i99.AzkarRepo(gh<_i155.AzkarDatabase>()));
    gh.factory<_i892.HomeCubit>(() => _i892.HomeCubit(gh<_i298.HomeRepo>()));
    gh.factory<_i501.HadithCubit>(
      () => _i501.HadithCubit(gh<_i952.HadithRepo>()),
    );
    gh.factory<_i1015.QuranRepo>(
      () => _i1015.QuranRepo(gh<_i651.QuranDatabase>()),
    );
    gh.factory<_i479.SharedPreferencesSettingsService>(
      () =>
          _i479.SharedPreferencesSettingsService(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i434.TasbihCubit>(
      () => _i434.TasbihCubit(gh<_i966.TasbihRepo>()),
    );
    gh.factory<_i803.LocationCubit>(
      () => _i803.LocationCubit(gh<_i839.LocationRepo>()),
    );
    gh.factory<_i1051.NearMosqueRepo>(
      () => _i1051.NearMosqueRepo(
        gh<_i495.MosquesDatabase>(),
        gh<_i543.MosqueApiService>(),
      ),
    );
    gh.factory<_i824.AzkarCubit>(() => _i824.AzkarCubit(gh<_i99.AzkarRepo>()));
    gh.factory<_i663.SettingsCubit>(
      () => _i663.SettingsCubit(gh<_i479.SharedPreferencesSettingsService>()),
    );
    gh.factory<_i881.NearMosqueCubit>(
      () => _i881.NearMosqueCubit(gh<_i1051.NearMosqueRepo>()),
    );
    gh.singleton<_i730.NavigationRepo>(
      () => _i730.NavigationRepo(
        gh<_i502.CitiesDatabase>(),
        gh<_i479.SharedPreferencesSettingsService>(),
      ),
    );
    gh.factory<_i915.NavigationCubit>(
      () => _i915.NavigationCubit(gh<_i730.NavigationRepo>()),
    );
    gh.factory<_i239.QuranCubit>(
      () => _i239.QuranCubit(gh<_i1015.QuranRepo>()),
    );
    gh.singleton<_i555.NotificationsManager>(
      () => _i555.NotificationsManager(
        gh<_i479.SharedPreferencesSettingsService>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i662.RegisterModule {}
