import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/shared_preferences/shared_preferences_settings_service.dart';
import 'package:noor/features/lands/logic/lands_state.dart';

@Injectable()
class LandsCubit extends Cubit<LandsState> {
  final SharedPreferencesSettingsService _sharedPreferencesSettingsService;
  ValueNotifier<int> landsCount = ValueNotifier<int>(0);

  LandsCubit(this._sharedPreferencesSettingsService) : super(LandsInitial()) {
    landsCount.value = _sharedPreferencesSettingsService.getLandsCount();
  }

  void changeLandsCount(int value) {
    final count = _sharedPreferencesSettingsService.getLandsCount();
    _sharedPreferencesSettingsService.saveLandsCount(count + value);
    landsCount.value = count + value;
  }
}
