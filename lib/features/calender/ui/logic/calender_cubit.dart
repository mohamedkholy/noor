import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/constants/shared_preferences_keys.dart';
import 'package:noor/core/database/cities/cities_database.dart';
import 'package:noor/core/di/dependency_injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalenderCubit extends Cubit {
  CalenderCubit() : super(0);

  City? getSavedCity() {
    final result = getIt<SharedPreferences>().getString(
      SharedPreferencesKeys.savedCity,
    );
    if (result == null) return null;
    final map = jsonDecode(result) as Map<String, dynamic>;
    return City.fromJson(map);
  }
}
