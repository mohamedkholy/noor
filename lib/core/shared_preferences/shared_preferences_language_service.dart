import 'package:injectable/injectable.dart';
import 'package:noor/core/shared_preferences/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
class SharedPreferencesLanguageService {
  final SharedPreferences _sharedPreferences;

  SharedPreferencesLanguageService(this._sharedPreferences);

  Future<void> saveLanguage(String language) async {
    await _sharedPreferences.setString(
      SharedPreferencesKeys.language,
      language,
    );
  }

  String? getLanguage() {
    return _sharedPreferences.getString(SharedPreferencesKeys.language);
  }
}
