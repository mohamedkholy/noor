import 'package:flutter/material.dart' hide Page;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/di/dependency_injection.dart';
import 'package:noor/core/shared_preferences/shared_preferences_keys.dart';
import 'package:noor/features/quran/data/models/line_data.dart';
import 'package:noor/features/quran/data/models/line_type.dart';
import 'package:noor/features/quran/logic/mushaf_cubit/mushaf_cubit.dart';
import 'package:noor/features/quran/logic/mushaf_cubit/mushaf_state.dart';
import 'package:noor/features/quran/logic/quran_cubit/quran_cubit.dart';
import 'package:noor/features/quran/ui/widgets/basmallah.dart';
import 'package:noor/features/quran/ui/widgets/header_widget.dart';
import 'package:noor/features/quran/ui/widgets/mushaf_sound_widget.dart';
import 'package:noor/features/quran/ui/widgets/page_line_widget.dart';
import 'package:noor/features/quran/ui/widgets/quran_lines_loading_widget.dart';
import 'package:noor/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

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
  PageController pageController = PageController();
  UniqueKey key = UniqueKey();
  final GlobalKey _showCaseKey = GlobalKey();

  int currentPageIndex = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ShowcaseView.register(
        globalFloatingActionWidget: (showcaseContext) => FloatingActionWidget(
          left: 16,
          bottom: 16,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () => ShowcaseView.get().dismiss(),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffEE5366),
              ),
              child: Text(
                S.of(context).skip,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
        ),
        blurValue: 1,
        disableBarrierInteraction: true,
        onDismiss: (dismissedAt) async {
          await getIt<SharedPreferences>().setBool(
            SharedPreferencesKeys.showCaseDone,
            true,
          );
        },
      );
    });
    _quranCubit.currentTabNotifier.addListener(() {
      _mushafCubit.stopPlayer();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(_mushafCubit.delay, () {
        _mushafCubit.getSurasLines(widget.pageNumber);
      });
    });
  }

  @override
  void dispose() {
    ShowcaseView.get().unregister();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  final isSmallScreen = MediaQuery.sizeOf(context).height < 500;
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
                        if (getIt<SharedPreferences>().getBool(
                              SharedPreferencesKeys.showCaseDone,
                            ) !=
                            true) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            Future.delayed(
                              const Duration(milliseconds: 500),
                              () {
                                ShowcaseView.get().startShowCase([
                                  _showCaseKey,
                                ]);
                              },
                            );
                          });
                        }
                      } else if (state is QuranLinesLodedFromStart) {
                        pages.insertAll(0, state.pages);
                        currentPageIndex =
                            pageController.page!.toInt() + state.pages.length;
                        pageController = PageController(
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
                      pageController = PageController(
                        initialPage: currentPageIndex,
                      );
                      if (state is! QuranLinesLodedFromEnd) {
                        key = UniqueKey();
                      }
                      return NotificationListener<ScrollNotification>(
                        onNotification: (notification) {
                          if (notification is ScrollUpdateNotification &&
                              notification.scrollDelta != null &&
                              notification.scrollDelta!.abs() > 2 &&
                              notification.metrics.axis == Axis.horizontal) {
                            _mushafCubit.stopPlayer();
                          }
                          return true;
                        },
                        child: state is QuranLinesLoading
                            ? const QuranLinesLoadingWidget()
                            : PageView.builder(
                                reverse:
                                    Localizations.localeOf(
                                      context,
                                    ).languageCode !=
                                    "ar",
                                key: key,
                                controller: pageController,
                                itemCount: pages.length,
                                onPageChanged: (value) {
                                  if (pages.isEmpty) {
                                    return;
                                  }
                                  final firstAyaLine = pages[value].firstWhere(
                                    (element) =>
                                        element.info.lineType ==
                                        LineType.ayah.name,
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
                                  } else if (value == 2 &&
                                      firstPageNumber != 1) {
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
                                            (pages[index].length -
                                                (notAyaCount));
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
                                            final firstAyaIndex = page
                                                .indexWhere(
                                                  (element) =>
                                                      element.info.lineType ==
                                                      LineType.ayah.name,
                                                );

                                            if (line.info.lineType ==
                                                LineType.surah_name.name) {
                                              return HeaderWidget(
                                                surahNumber:
                                                    line.info.surahNumber!,
                                              );
                                            } else if (line.info.lineType ==
                                                LineType.basmallah.name) {
                                              return const Basmallah();
                                            }
                                            if (i == firstAyaIndex) {
                                              return Showcase(
                                                key: _showCaseKey,
                                                description: S
                                                    .of(context)
                                                    .pressToShowOptions,
                                                child: PageLineWidget(
                                                  line: line,
                                                  pageNumber: pageNumber,
                                                  lineHeight:
                                                      pageNumber == 1 ||
                                                          pageNumber == 2
                                                      ? null
                                                      : lineHeight,
                                                ),
                                              );
                                            }
                                            return PageLineWidget(
                                              line: line,
                                              pageNumber: pageNumber,
                                              lineHeight:
                                                  pageNumber == 1 ||
                                                      pageNumber == 2
                                                  ? null
                                                  : lineHeight,
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
    );
  }
}
