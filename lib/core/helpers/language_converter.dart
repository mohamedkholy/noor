import 'package:noor/core/database/cities/cities_database.dart';

abstract class LanguageConverter {
  static String cityDisplayName({required City city, required String lang}) {
    final searchNames = city.searchNames;
    if (lang == "ar" && searchNames != null && searchNames.contains(',')) {
      final arabic = searchNames
          .split(',')
          .firstWhere(
            (n) => n.runes.any((r) => r >= 0x0600 && r <= 0x06FF),
            orElse: () => city.name,
          );
      return arabic;
    }
    return city.name;
  }
}
