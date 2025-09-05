import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/database/quran/quran_database.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';
import 'package:noor/features/quran/logic/quran_cubit.dart';
import 'package:noor/features/quran/logic/quran_state.dart';
import 'package:noor/features/quran/ui/widgets/basmallah.dart';
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
  List<(Surah, List<Verse>)> surahs = [];
  final String bismala = "بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ";
  PageController pageController = PageController();
  ValueNotifier<Verse?> currentVerseNotifier = ValueNotifier(null);
  late int currentSuraIndex = widget.surahNumber;

  @override
  void initState() {
    super.initState();
    quranCubit.getReadingData(widget.surahNumber);
  }

  @override
  void dispose() {
    if (currentVerseNotifier.value != null) {
      final verse = currentVerseNotifier.value;
      if (verse != null) {
        quranCubit.saveLastReading(
          verse,
          surahs
              .where((element) => element.$1.number == verse.surahNumber)
              .single
              .$1
              .nameTransliteration,
        );
      }
    }
    pageController.dispose();
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
            if (verse == null) return AppBar(automaticallyImplyLeading: false);
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
            surahs = state.surahs;
            currentSuraIndex = surahs.indexWhere(
              (element) => element.$1.number == widget.surahNumber,
            );
            currentVerseNotifier.value = surahs[currentSuraIndex]
                .$2[widget.ayaNumber == null ? 0 : widget.ayaNumber! - 1];
            pageController.jumpToPage(currentSuraIndex);
          } else if (state is QuranLodedFromStart) {
            final currentPage =
                pageController.page!.toInt() + state.surahs.length;
            surahs.insertAll(0, state.surahs);
            pageController.jumpToPage(currentPage);
          } else if (state is QuranLodedFromEnd) {
            surahs.addAll(state.surahs);
          }
        },
        builder: (context, state) {
          return Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: PageView.builder(
                onPageChanged: (index) {
                  currentVerseNotifier.value = surahs[index].$2[0];
                  if (index == surahs.length - 2 &&
                      surahs.last.$1.number != 114) {
                    quranCubit.getReadingDataPagination(
                      suraNumber: surahs.last.$1.number,
                      isFromStart: false,
                    );
                  } else if (index == 2 && surahs.first.$1.number != 1) {
                    Future.delayed(const Duration(milliseconds: 500), () {
                      quranCubit.getReadingDataPagination(
                        suraNumber: surahs.first.$1.number,
                        isFromStart: true,
                      );
                    });
                  }
                },
                reverse: Localizations.localeOf(context).languageCode != "ar",
                controller: pageController,
                itemCount: surahs.length,
                itemBuilder: (context, index) {
                  int page = surahs[index].$2[0].page;
                  final surahVerses = surahs[index].$2;
                  return SafeArea(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: ScrollablePositionedList.separated(
                        minCacheExtent: 0,
                        initialScrollIndex:
                            currentSuraIndex == index &&
                                widget.ayaNumber != null
                            ? widget.ayaNumber! - 1
                            : 0,
                        separatorBuilder: (context, index) =>
                            const Divider(height: 50),
                        itemCount: surahVerses.length,
                        itemBuilder: (context, i) {
                          final verse = surahVerses[i];
                          final bool isNewPage =
                              surahVerses.length - 1 == i ||
                              verse.page != surahVerses[i + 1].page;
                          if (isNewPage) {
                            page = verse.page;
                          }
                          if (verse.number == 1) {
                            return Column(
                              children: [
                                const SizedBox(height: 20),
                                HeaderWidget(
                                  surahName: surahs[index].$1.nameAr,
                                ),
                                const SizedBox(height: 20),
                                index == 0 || index == 8
                                    ? Container()
                                    : Basmallah(index: index),
                                const SizedBox(height: 20),
                                VerseWidget(verse: verse),
                              ],
                            );
                          }
                          return VisibilityDetector(
                            onVisibilityChanged: (info) {
                              if (info.visibleFraction == 1) {
                                WidgetsBinding.instance.addPostFrameCallback((
                                  _,
                                ) {
                                  currentVerseNotifier.value = verse;
                                });
                              }
                            },
                            key: UniqueKey(),
                            child: Column(
                              children: [
                                VerseWidget(verse: verse),
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
              ),
            ),
          );
        },
      ),
    );
  }
}
