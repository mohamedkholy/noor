import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/database/quran/quran_database.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';
import 'package:noor/features/quran/data/models/reading_position.dart';
import 'package:noor/features/quran/logic/ayat_cubit/ayat_cubit.dart';
import 'package:noor/features/quran/logic/ayat_cubit/ayat_state.dart';
import 'package:noor/features/quran/logic/quran_cubit/quran_cubit.dart';
import 'package:noor/features/quran/ui/widgets/basmallah.dart';
import 'package:noor/features/quran/ui/widgets/header_widget.dart';
import 'package:noor/features/quran/ui/widgets/verse_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:visibility_detector/visibility_detector.dart';

class QuranAyatScreen extends StatefulWidget {
  final int surahNumber;
  final int? ayaNumber;
  const QuranAyatScreen({super.key, required this.surahNumber, this.ayaNumber});

  @override
  State<QuranAyatScreen> createState() => _QuranAyatScreenState();
}

class _QuranAyatScreenState extends State<QuranAyatScreen> {
  late final QuranCubit _quranCubit = context.read<QuranCubit>();
  late final AyatCubit _ayatCubit = context.read<AyatCubit>();
  List<(Surah, List<Verse>)> surahs = [];
  final String bismala = "بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ";
  PageController pageController = PageController();
  late int currentSuraIndex = widget.surahNumber;
  UniqueKey key = UniqueKey();

  @override
  void initState() {
    super.initState();
    _ayatCubit.getReadingData(widget.surahNumber);
    _ayatCubit.init();
    _quranCubit.currentTabNotifier.addListener(() {
      _ayatCubit.stopPlayer();
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    _ayatCubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFF8EE),
      child: BlocConsumer<AyatCubit, AyatState>(
        buildWhen: (previous, current) =>
            current is QuranLoaded ||
            current is QuranLodedFromStart ||
            current is QuranLodedFromEnd,
        listenWhen: (previous, current) =>
            current is QuranLoaded ||
            current is QuranLodedFromStart ||
            current is QuranLodedFromEnd,
        listener: (context, state) {
          if (state is QuranLoaded) {
            surahs = state.surahs;
            currentSuraIndex = surahs.indexWhere(
              (element) => element.$1.number == widget.surahNumber,
            );
            _quranCubit.currentReadingPositionNotifier.value =
                ReadingPosition.fromVerse(
                  surahs[currentSuraIndex].$2[widget.ayaNumber == null
                      ? 0
                      : widget.ayaNumber! - 1],
                );
            pageController = PageController(initialPage: currentSuraIndex);
          } else if (state is QuranLodedFromStart) {
            surahs.insertAll(0, state.surahs);
            final currentPage = pageController.page!.toInt();
            pageController = PageController(
              initialPage: currentPage + state.surahs.length,
            );
          } else if (state is QuranLodedFromEnd) {
            surahs.addAll(state.surahs);
          }
        },
        builder: (context, state) {
          if (state is! QuranLodedFromEnd) {
            key = UniqueKey();
          }
          return Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: PageView.builder(
                key: key,
                onPageChanged: (index) {
                  _ayatCubit.stopPlayer();
                  _quranCubit.currentReadingPositionNotifier.value =
                      ReadingPosition.fromVerse(surahs[index].$2[0]);
                  _quranCubit.currentSurahNotifier.value = surahs[index].$1;
                  if (index == surahs.length - 2 &&
                      surahs.last.$1.number != 114) {
                    _ayatCubit.getReadingDataPagination(
                      suraNumber: surahs.last.$1.number,
                      isFromStart: false,
                    );
                  } else if (index == 2 && surahs.first.$1.number != 1) {
                    Future.delayed(const Duration(milliseconds: 500), () {
                      _ayatCubit.getReadingDataPagination(
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
                                  surahNumber: surahs[index].$1.number,
                                ),
                                const SizedBox(height: 20),
                                index == 0 || surahs[index].$1.number == 9
                                    ? Container()
                                    : const Basmallah(),
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
                                  _quranCubit
                                      .currentReadingPositionNotifier
                                      .value = ReadingPosition.fromVerse(
                                    verse,
                                  );
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
