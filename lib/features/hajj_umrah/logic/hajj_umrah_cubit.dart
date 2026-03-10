import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/shared_preferences/shared_preferences_settings_service.dart';
import 'package:noor/features/hajj_umrah/data/models/sunan_data.dart';
import 'package:noor/features/hajj_umrah/logic/hajj_umrah_state.dart';

@Injectable()
class HajjUmrahCubit extends Cubit<HajjUmrahState> {
  final SharedPreferencesSettingsService _sharedPreferencesSettingsService;
  ValueNotifier<int> hajjUmrahCount = ValueNotifier<int>(0);

  HajjUmrahCubit(this._sharedPreferencesSettingsService)
    : super(HajjUmrahInitial()) {
    hajjUmrahCount.value = _sharedPreferencesSettingsService
        .getHajjUmrahCount();
  }

  void changeHajjUmrahCount(int value) {
    final count = _sharedPreferencesSettingsService.getHajjUmrahCount();
    _sharedPreferencesSettingsService.saveHajjUmrahCount(count + value);
    hajjUmrahCount.value = count + value;
  }

    void saveHajjUmrahData(HajjUmrahData hajjUmrahData) {
    _sharedPreferencesSettingsService.saveHajjUmrahData(hajjUmrahData);
  }

  HajjUmrahData getHajjUmrahData() {
    return _sharedPreferencesSettingsService.getHajjUmrahData();
  }

}
