enum Kitab {
   sahihBukhari,
   sahihMuslim
}


extension KitabExtension on Kitab {
  String get name {
    switch (this) {
      case Kitab.sahihBukhari:
        return "Shahih Bukhari";
      case Kitab.sahihMuslim:
        return "Shahih Muslim";
    }
  }
} 