import 'package:noor/core/database/quran/quran_database.dart';

class LineData {
  final Line info;
  final List<Word> words;
  final List<(String, int)> data;

  LineData(this.info, this.words) : data = _groupWordsByAyah(words);

  @override
  String toString() {
    return "LineData(info: $info, words: $words, precomputedText: $data)";
  }

  static List<(String, int)> _groupWordsByAyah(List<Word> words) {
    final Map<int, (StringBuffer, int)> grouped = {};

    for (final word in words) {
      grouped.putIfAbsent(word.ayah, () => (StringBuffer(), word.ayah));
      grouped[word.ayah]!.$1.write('${word.wordText} ');
    }

    return grouped.values.map((e) => (e.$1.toString().trim(), e.$2)).toList();
  }
}
