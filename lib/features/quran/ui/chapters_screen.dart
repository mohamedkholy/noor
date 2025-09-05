import 'package:flutter/material.dart';
import 'package:noor/core/database/quran/quran_database.dart';
import 'package:noor/features/quran/ui/widgets/chapter_widget.dart';

class ChaptersScreen extends StatelessWidget {
  final List<Verse> verses;
  const ChaptersScreen({super.key, required this.verses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(
              top: index == 0 ? 15 : 5,
              bottom: index == verses.length - 1 ? 15 : 5,
            ),
            child: ChapterWidget(verse: verses[index]),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(color: Colors.grey.shade300);
        },
        itemCount: verses.length,
      ),
    );
  }
}
