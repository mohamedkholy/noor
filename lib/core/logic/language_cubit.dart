import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/shared_preferences/shared_preferences_language_service.dart';

@Injectable()
class LanguageCubit extends Cubit<String?> {
  final SharedPreferencesLanguageService _spLanguageService;
  LanguageCubit(this._spLanguageService)
    : super(PlatformDispatcher.instance.locale.languageCode);

  void changeLanguage(String language) {
    emit(language);
    _spLanguageService.saveLanguage(language);
  }

  void getLanguage() {
    final lang = _spLanguageService.getLanguage();
    emit(lang);
  }
}
