enum Kitab {
   sahihBukhari,
   sahihMuslim
}


extension KitabExtension on Kitab {
  String get name {
    switch (this) {
      case Kitab.sahihBukhari:
        return "Sahih Bukhari";
      case Kitab.sahihMuslim:
        return "Sahih Muslim";
    }
  }
} 