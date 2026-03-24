class Bookmark {
  final int surahNumber;
  final int ayaNumber;
  final int pageNumber;
  final int juzNumber;

  Bookmark({
    required this.surahNumber,
    required this.ayaNumber,
    required this.pageNumber,
    required this.juzNumber,
  });

  factory Bookmark.fromJson(Map<String, dynamic> json) => Bookmark(
    surahNumber: json['surahNumber'],
    ayaNumber: json['ayaNumber'],
    pageNumber: json['pageNumber'],
    juzNumber: json['juzNumber'],
  );

  Map<String, dynamic> toJson() => {
    'surahNumber': surahNumber,
    'ayaNumber': ayaNumber,
    'pageNumber': pageNumber,
    'juzNumber': juzNumber,
  };
}
