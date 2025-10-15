import 'package:noor/core/database/quran/quran_database.dart';

class LineData {
  final Line info;
  final List<Word> words;
  final String precomputedText;

  LineData(this.info, this.words)
    : precomputedText = words.map((w) => w.wordText).join(' ');

  @override
  String toString() {
    return "LineData(info: $info, words: $words, precomputedText: $precomputedText)";
  }
}
