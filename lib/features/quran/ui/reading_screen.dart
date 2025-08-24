import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/database/quran/quran_database.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';
import 'package:noor/features/quran/logic/quran_cubit.dart';
import 'package:noor/features/quran/logic/quran_state.dart';
import 'package:noor/features/quran/ui/widgets/basmallah%20.dart';
import 'package:noor/features/quran/ui/widgets/header_widget.dart';
import 'package:noor/features/quran/ui/widgets/surah_app_bar.dart';
import 'package:noor/features/quran/ui/widgets/verse_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ReadingScreen extends StatefulWidget {
  final int surahNumber;
  final int? ayaNumber;
  const ReadingScreen({super.key, required this.surahNumber, this.ayaNumber});

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  late final QuranCubit quranCubit = context.read<QuranCubit>();
  List<(Surah, List<Verse>)> ayats = [];
  final String bismala = "بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ";
  PageController pageController = PageController();
  ValueNotifier<Verse?> currentVerseNotifier = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    quranCubit.getVerses();
  }

  @override
  void dispose() {
    if (currentVerseNotifier.value != null) {
      quranCubit.saveLastReading(
        currentVerseNotifier.value,
        ayats[currentVerseNotifier.value!.surahNumber - 1]
            .$1
            .nameTransliteration,
      );
    }
    currentVerseNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: ValueListenableBuilder<Verse?>(
          valueListenable: currentVerseNotifier,
          builder: (context, verse, child) {
            if (verse == null) return Container();

            return SurahAppBar(
              juz: verse.juz.toString(),
              surahNumber: verse.surahNumber.toString(),
              surahName: verse.surahName,
            );
          },
        ),
      ),
      backgroundColor: const Color(0xFFFFF8EE),
      body: BlocConsumer<QuranCubit, QuranState>(
        listener: (context, state) {
          if (state is QuranLoaded) {
            ayats = state.verses;
            currentVerseNotifier.value = ayats[widget.surahNumber - 1]
                .$2[widget.ayaNumber == null ? 0 : widget.ayaNumber! - 1];
            pageController.jumpToPage(widget.surahNumber - 1);
          }
        },
        builder: (context, state) {
          return PageView.builder(
            onPageChanged: (index) {
              currentVerseNotifier.value = ayats[index].$2[0];
            },
            reverse: true,
            controller: pageController,
            itemCount: ayats.length,
            itemBuilder: (context, index) {
              int page = ayats[index].$2[0].page;
              final surahVerses = ayats[index].$2;
              return SafeArea(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: ScrollablePositionedList.separated(
                    minCacheExtent: 0,
                    initialScrollIndex:
                        widget.surahNumber == index + 1 &&
                            widget.ayaNumber != null
                        ? widget.ayaNumber! - 1
                        : 0,
                    separatorBuilder: (context, index) =>
                        const Divider(height: 50),
                    itemCount: surahVerses.length,
                    itemBuilder: (context, i) {
                      final e = surahVerses[i];
                      final bool isNewPage =
                          surahVerses.length - 1 == i ||
                          e.page != surahVerses[i + 1].page;
                      if (isNewPage) {
                        page = e.page;
                      }
                      if (e.number == 1) {
                        return Column(
                          children: [
                            const SizedBox(height: 20),
                            HeaderWidget(surahName: ayats[index].$1.nameAr),
                            const SizedBox(height: 20),
                            index == 0 || index == 8
                                ? Container()
                                : Basmallah(index: index),
                            const SizedBox(height: 20),
                            VerseWidget(verse: e),
                          ],
                        );
                      }
                      return VisibilityDetector(
                        onVisibilityChanged: (info) {
                          if (info.visibleFraction == 1) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              currentVerseNotifier.value = e;
                            });
                          }
                        },
                        key: UniqueKey(),
                        child: Column(
                          children: [
                            VerseWidget(verse: e),
                            if (isNewPage)
                              Container(
                                margin: const EdgeInsets.only(top: 30),
                                child: Text(
                                  "$page",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeightHelper.medium,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
