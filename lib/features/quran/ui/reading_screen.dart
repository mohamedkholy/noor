import 'package:flutter/material.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/features/quran/ui/mushaf_screen.dart';
import 'package:noor/features/quran/ui/quran_ayat_screen.dart';
import 'package:noor/generated/l10n.dart';

class ReadingScreen extends StatefulWidget {
  final int surahNumber;
  final int? ayaNumber;
  final int pageNumber;
  const ReadingScreen({
    super.key,
    required this.surahNumber,
    this.ayaNumber,
    required this.pageNumber,
  });

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              indicatorColor: MyColors.primary,
              labelColor: MyColors.primary,
              unselectedLabelColor: Colors.grey,
              labelStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              tabs: [
                Tab(text: S.of(context).mushafStyle, height: 60),
                Tab(text: S.of(context).ayatStyle, height: 60),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  MushafScreen(pageNumber: widget.pageNumber),
                  QuranAyatScreen(
                    surahNumber: widget.surahNumber,
                    ayaNumber: widget.ayaNumber,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
