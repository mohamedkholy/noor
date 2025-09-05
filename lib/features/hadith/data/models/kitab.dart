import '../../../../generated/l10n.dart';

enum Kitab { sahihBukhari, sahihMuslim }

extension KitabExtension on Kitab {
  String get name {
    switch (this) {
      case Kitab.sahihBukhari:
        return "Sahih Bukhari";
      case Kitab.sahihMuslim:
        return "Sahih Muslim";
    }
  }

  String getTranslatedName() {
    switch (this) {
      case Kitab.sahihBukhari:
        return S.current.sahih_bukhari;
      case Kitab.sahihMuslim:
        return S.current.sahih_muslim;
    }
  }

   static String getTranslatedNameFromStirng(String name) {
    switch (name) {
      case "Sahih Bukhari":
        return S.current.sahih_bukhari;
      case "Sahih Muslim":
        return S.current.sahih_muslim;
      default:
        return "";
    }
  }

}

