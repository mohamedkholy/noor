import 'package:injectable/injectable.dart';
import 'package:noor/core/shared_preferences/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
class SharedPreferencesAzanService {
  final SharedPreferences _sharedPreferences;

  SharedPreferencesAzanService(this._sharedPreferences);

  Future<void> saveAzanSound(String azanSound) async {
    await _sharedPreferences.setString(
      SharedPreferencesKeys.azanSound,
      azanSound,
    );
  }

  String getAzanSound() {
    return _sharedPreferences.getString(SharedPreferencesKeys.azanSound) ??
        "azan_makkah";
  }
}
