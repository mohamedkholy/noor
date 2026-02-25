import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/shared_preferences/shared_preferences_settings_service.dart';
import 'package:noor/features/treasures/logic/treasures_state.dart';

@Injectable()
class TreasuresCubit extends Cubit<TreasuresState> {
  final SharedPreferencesSettingsService _sharedPreferencesSettingsService;
  ValueNotifier<int> treasuresCount = ValueNotifier<int>(0);

  TreasuresCubit(this._sharedPreferencesSettingsService)
    : super(TreasuresInitial()) {
    treasuresCount.value = _sharedPreferencesSettingsService
        .getTreasuresCount();
  }

  void changeTreasuresCount(int value) {
    final count = _sharedPreferencesSettingsService.getTreasuresCount();
    _sharedPreferencesSettingsService.saveTreasuresCount(count + value);
    treasuresCount.value = count + value;
  }
}
