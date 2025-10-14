import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/features/quran/data/models/reading_position.dart';
import 'package:noor/features/quran/logic/quran_cubit.dart';
import 'package:noor/features/quran/ui/mushaf_screen.dart';
import 'package:noor/features/quran/ui/quran_ayat_screen.dart';
import 'package:noor/features/quran/ui/widgets/surah_app_bar.dart';
import 'package:noor/generated/l10n.dart';

class ReadingScreen extends StatefulWidget {
  final int surahNumber;
  final int ayaNumber;
  final int pageNumber;
  final int juzNumber;

  const ReadingScreen({
    super.key,
    required this.surahNumber,
    required this.ayaNumber,
    required this.pageNumber,
    required this.juzNumber,
  });

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  late final QuranCubit _quranCubit = context.read<QuranCubit>();
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _quranCubit.updateReadingPosition(
      widget.surahNumber,
      widget.ayaNumber,
      widget.juzNumber,
      widget.pageNumber,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: ValueListenableBuilder<ReadingPosition?>(
          valueListenable: _quranCubit.currentReadingPositionNotifier,
          builder: (context, verse, child) {
            if (verse == null) return AppBar(automaticallyImplyLeading: false);
            return SurahAppBar(
              juz: verse.juz.toString(),
              surahNumber: verse.surahNumber.toString(),
              surahName: verse.surahName,
            );
          },
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              color: MyColors.primary,
              child: TabBar(
                onTap: (value) {
                  setState(() {
                    _index = value;
                  });
                },
                indicatorColor: Colors.black,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey.shade400,
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                tabs: [
                  Tab(text: S.of(context).mushafStyle, height: 60),
                  Tab(text: S.of(context).ayatStyle, height: 60),
                ],
              ),
            ),
            Expanded(
              child: IndexedStack(
                index: _index,
                children: [
                  MushafScreen(
                    key: UniqueKey(),
                    pageNumber:
                        _quranCubit
                            .currentReadingPositionNotifier
                            .value
                            ?.pageNumber ??
                        widget.pageNumber,
                  ),
                  QuranAyatScreen(
                    key: UniqueKey(),
                    surahNumber:
                        _quranCubit
                            .currentReadingPositionNotifier
                            .value
                            ?.surahNumber ??
                        widget.surahNumber,
                    ayaNumber:
                        _quranCubit
                            .currentReadingPositionNotifier
                            .value
                            ?.verseNumber ??
                        widget.ayaNumber,
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
