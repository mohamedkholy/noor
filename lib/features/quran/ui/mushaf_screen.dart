import 'package:flutter/material.dart' hide Page;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/features/quran/data/models/line_data.dart';
import 'package:noor/features/quran/data/models/line_type.dart';
import 'package:noor/features/quran/logic/mushaf_cubit/mushaf_cubit.dart';
import 'package:noor/features/quran/logic/mushaf_cubit/mushaf_state.dart';
import 'package:noor/features/quran/logic/quran_cubit/quran_cubit.dart';
import 'package:noor/features/quran/ui/widgets/basmallah.dart';
import 'package:noor/features/quran/ui/widgets/header_widget.dart';
import 'package:noor/features/quran/ui/widgets/mushaf_sound_widget.dart';
import 'package:noor/features/quran/ui/widgets/page_line_widget.dart';
import 'package:preload_page_view/preload_page_view.dart';

class MushafScreen extends StatefulWidget {
  final int pageNumber;
  const MushafScreen({super.key, required this.pageNumber});

  @override
  State<MushafScreen> createState() => _MushafScreenState();
}

class _MushafScreenState extends State<MushafScreen> {
  late final QuranCubit _quranCubit = context.read();
  late final MushafCubit _mushafCubit = context.read();
  final List<List<LineData>> pages = [];
  PreloadPageController pageController = PreloadPageController();
  UniqueKey key = UniqueKey();

  int currentPageIndex = 1;

  @override
  void initState() {
    super.initState();
    _mushafCubit.getSurasLines(widget.pageNumber);
    _mushafCubit.init();
    _quranCubit.currentTabNotifier.addListener(() {
      _mushafCubit.stopPlayer();
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    _mushafCubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFF8EE),
      child: SafeArea(
        top: false,
        right: false,
        left: false,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (_, constraints) {
                    print(
                      "LayoutBuilder widget.pageNumber ${widget.pageNumber} ${_quranCubit.currentReadingPositionNotifier.value?.pageNumber}",
                    );
                    final isSmallScreen =
                        MediaQuery.sizeOf(context).height < 500;
                    return BlocConsumer<MushafCubit, MushafState>(
                      buildWhen: (previous, current) =>
                          current is QuranLinesLoaded ||
                          current is QuranLinesLodedFromStart ||
                          current is QuranLinesLodedFromEnd,
                      listenWhen: (previous, current) =>
                          current is QuranLinesLoaded ||
                          current is QuranLinesLodedFromStart ||
                          current is QuranLinesLodedFromEnd,
                      listener: (context, state) {
                        if (state is QuranLinesLoaded) {
                          pages.addAll(state.pages);
                          currentPageIndex = pages.indexWhere(
                            (element) =>
                                element.last.info.pageNumber ==
                                (_quranCubit
                                        .currentReadingPositionNotifier
                                        .value
                                        ?.pageNumber ??
                                    widget.pageNumber),
                          );
                          final firstAya = pages[currentPageIndex].firstWhere(
                            (element) =>
                                element.info.lineType == LineType.ayah.name,
                          );
                          _quranCubit.updateReadingPosition(
                            firstAya.words.first.surah,
                            firstAya.words.first.ayah,
                            firstAya.words.first.juz,
                            firstAya.info.pageNumber,
                          );
                        } else if (state is QuranLinesLodedFromStart) {
                          pages.insertAll(0, state.pages);
                          currentPageIndex =
                              pageController.page!.toInt() + state.pages.length;
                          pageController = PreloadPageController(
                            initialPage: currentPageIndex,
                          );
                        } else if (state is QuranLinesLodedFromEnd) {
                          pages.addAll(state.pages);
                        }
                      },
                      builder: (_, state) {
                        currentPageIndex = pages.indexWhere(
                          (element) =>
                              element.last.info.pageNumber ==
                              (_quranCubit
                                      .currentReadingPositionNotifier
                                      .value
                                      ?.pageNumber ??
                                  widget.pageNumber),
                        );
                        pageController = PreloadPageController(
                          initialPage: currentPageIndex,
                        );
                        if (state is! QuranLinesLodedFromEnd) {
                          key = UniqueKey();
                        }
                        return NotificationListener<ScrollNotification>(
                          onNotification: (notification) {
                            if (notification is ScrollStartNotification) {
                              _mushafCubit.stopPlayer();
                            }
                            return true;
                          },
                          child: PreloadPageView.builder(
                            reverse:
                                Localizations.localeOf(context).languageCode !=
                                "ar",
                            key: key,
                            controller: pageController,
                            itemCount: pages.length,
                            onPageChanged: (value) {
                              final firstAyaLine = pages[value].firstWhere(
                                (element) =>
                                    element.info.lineType == LineType.ayah.name,
                              );
                              final firstPageNumber = pages.first
                                  .firstWhere(
                                    (element) =>
                                        element.info.lineType ==
                                        LineType.ayah.name,
                                  )
                                  .info
                                  .pageNumber;
                              final lastPageNumber = pages.last
                                  .firstWhere(
                                    (element) =>
                                        element.info.lineType ==
                                        LineType.ayah.name,
                                  )
                                  .info
                                  .pageNumber;

                              _quranCubit.updateReadingPosition(
                                firstAyaLine.words.first.surah,
                                firstAyaLine.words.first.ayah,
                                firstAyaLine.words.first.juz,
                                firstAyaLine.info.pageNumber,
                              );
                              if (value == pages.length - 2 &&
                                  lastPageNumber != 604) {
                                _mushafCubit.getSurasLinesPagination(
                                  pageNumber: lastPageNumber,
                                  isFromStart: false,
                                );
                              } else if (value == 2 && firstPageNumber != 1) {
                                Future.delayed(
                                  const Duration(milliseconds: 500),
                                  () {
                                    _mushafCubit.getSurasLinesPagination(
                                      pageNumber: firstPageNumber,
                                      isFromStart: true,
                                    );
                                  },
                                );
                              }
                            },
                            itemBuilder: (context, index) {
                              final page = pages[index];

                              int notAyaCount = 0;

                              for (var element in pages[index]) {
                                if (element.info.lineType ==
                                        LineType.basmallah.name ||
                                    element.info.lineType ==
                                        LineType.surah_name.name) {
                                  notAyaCount++;
                                }
                              }

                              final lineHeight = isSmallScreen
                                  ? null
                                  : (constraints.maxHeight -
                                            (30 + (notAyaCount) * 50)) /
                                        (pages[index].length - (notAyaCount));
                              final pageNumber = page
                                  .firstWhere(
                                    (element) =>
                                        element.info.lineType ==
                                        LineType.ayah.name,
                                  )
                                  .info
                                  .pageNumber;
                              return Column(
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                      physics: isSmallScreen
                                          ? const AlwaysScrollableScrollPhysics()
                                          : const NeverScrollableScrollPhysics(),
                                      itemCount: page.length,
                                      itemBuilder: (_, i) {
                                        final line = page[i];
                                        if (line.info.lineType ==
                                            LineType.surah_name.name) {
                                          return HeaderWidget(
                                            surahNumber: line.info.surahNumber!,
                                          );
                                        } else if (line.info.lineType ==
                                            LineType.basmallah.name) {
                                          return const Basmallah();
                                        }

                                        return PageLineWidget(
                                          line: line,
                                          pageNumber: pageNumber,
                                          lineHeight:
                                              pageNumber == 1 || pageNumber == 2
                                              ? null
                                              : lineHeight!,
                                        );
                                      },
                                    ),
                                  ),
                                  Text(pageNumber.toString()),
                                ],
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              BlocBuilder<MushafCubit, MushafState>(
                builder: (context, state) {
                  if (state is AudioPlayerState) {
                    print(state);
                    return MushafSoundWidget(
                      pageNumber: state.pageNumber,
                      suraNumber: state.suraNumber,
                      ayaNumber: state.ayaNumber,
                      isPlaying: state is AudioPlayerPlaying,
                      isLoading: state is PageSoundLoading,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
