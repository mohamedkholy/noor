import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/shared_preferences/shared_preferences_settings_service.dart';
import 'package:noor/features/agri/logic/agri_state.dart';

@Injectable()
class AgriCubit extends Cubit<AgriState> {
  final SharedPreferencesSettingsService _sharedPreferencesSettingsService;
  ValueNotifier<int> treesCount = ValueNotifier<int>(0);

  AgriCubit(this._sharedPreferencesSettingsService) : super(AgriInitial()) {
    treesCount.value = _sharedPreferencesSettingsService.getTreesCount();
  }

  void changeTreesCount(int value) {
    final count = _sharedPreferencesSettingsService.getTreesCount();
    _sharedPreferencesSettingsService.saveTreesCount(count + value);
    treesCount.value = count + value;
  }
}
