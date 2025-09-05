import 'package:adhan/adhan.dart';

extension PrayerExtension on Prayer {
  String getTranslatedName({required String lang}) {
    switch (this) {
      case Prayer.fajr:
        return lang == "ar" ? "صلاة الفجر" : "Fajr Prayer";
      case Prayer.sunrise:
        return lang == "ar" ? "الشروق" : "Sunrise";
      case Prayer.dhuhr:
        return lang == "ar" ? "صلاة الظهر" : "Dhuhr Prayer";
      case Prayer.asr:
        return lang == "ar" ? "صلاة العصر" : "Asr Prayer";
      case Prayer.maghrib:
        return lang == "ar" ? "صلاة المغرب" : "Maghrib Prayer";
      case Prayer.isha:
        return lang == "ar" ? "صلاة العشاء" : "Isha Prayer";
      default:
        return "";
    }
  }
}
