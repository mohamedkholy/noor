import 'package:noor/core/database/quran/quran_database.dart';

class LineData {
  final Line info;
  final List<Word> words;
  final List<String> precomputedText;

  LineData(this.info, this.words)
    : precomputedText = _groupWordsByAyah(words);

  @override
  String toString() {
    return "LineData(info: $info, words: $words, precomputedText: $precomputedText)";
  }

   static List<String> _groupWordsByAyah(List<Word> words) {
    final Map<int, StringBuffer> grouped = {};

    for (final word in words) {
      grouped.putIfAbsent(word.ayah, () => StringBuffer());
      grouped[word.ayah]!.write('${word.wordText} ');
    }

    return grouped.values.map((sb) => sb.toString().trim()).toList();
  }

}
