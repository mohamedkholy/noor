import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/shared_preferences/shared_preferences_settings_service.dart';
import 'package:noor/features/properties/data/models/sunan_data.dart';
import 'package:noor/features/properties/data/repos/properties_repo.dart';
import 'package:noor/features/properties/logic/properties_state.dart';

@Injectable()
class PropertiesCubit extends Cubit<PropertiesState> {
  final PropertiesRepo _propertiesRepo;
  final SharedPreferencesSettingsService _sharedPreferencesSettingsService;
  ValueNotifier<int> propertiesCount = ValueNotifier<int>(0);

  PropertiesCubit(this._propertiesRepo, this._sharedPreferencesSettingsService)
    : super(PropertiesInitial()) {
    propertiesCount.value = _sharedPreferencesSettingsService
        .getPropertiesCount();
  }

  void saveSunanSetting(SunanData sunanSetting) {
    _sharedPreferencesSettingsService.saveSunanData(sunanSetting);
  }

  SunanData getSunanSetting() {
    return _sharedPreferencesSettingsService.getSunanData();
  }

  void changePropertiesCount(int value) {
    final count = _sharedPreferencesSettingsService.getPropertiesCount();
    _sharedPreferencesSettingsService.savePropertiesCount(count + value);
    propertiesCount.value = count + value;
  }
}
