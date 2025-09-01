import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/shared_preferences/shared_preferences_settings_service.dart';
import 'package:noor/features/settings/data/models/azan_notifications_settings.dart';
import 'package:noor/features/settings/data/models/azkar_notifications_settings.dart';

@Injectable()
class SettingsCubit extends Cubit {
  final SharedPreferencesSettingsService _sharedPreferencesSettingsService;
  SettingsCubit(this._sharedPreferencesSettingsService) : super(null);

  bool getLocationUpdateSetting() {
    final result = _sharedPreferencesSettingsService.getLocationUpdateSetting();
    return result;
  }

  void saveLocationUpdateSetting(bool state) {
    _sharedPreferencesSettingsService.saveLocationUpdateSetting(state);
  }

  AzkarNotificationsSettings getAzkarNotificationSetting() {
    return _sharedPreferencesSettingsService.getAzkarNotificationSetting();
  }

  void saveAzkarNotificationSetting(AzkarNotificationsSettings state) {
    _sharedPreferencesSettingsService.saveAzkarNotificationSetting(state);
  }

  AzanNotificationsSettings getAzanNotificationSetting() {
    return _sharedPreferencesSettingsService.getAzanNotificationSetting();
  }

  void saveAzanNotificationSetting(AzanNotificationsSettings state) {
    _sharedPreferencesSettingsService.saveAzanNotificationSetting(state);
  }
}
