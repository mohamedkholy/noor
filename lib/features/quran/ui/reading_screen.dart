import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:noor/core/di/dependency_injection.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/core/theming/my_text_styles.dart';
import 'package:noor/features/quran/data/models/reading_position.dart';
import 'package:noor/features/quran/logic/ayat_cubit/ayat_cubit.dart';
import 'package:noor/features/quran/logic/mushaf_cubit/mushaf_cubit.dart';
import 'package:noor/features/quran/logic/quran_cubit/quran_cubit.dart';
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
  void dispose() {
    _quranCubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageNumber =
        _quranCubit.currentReadingPositionNotifier.value?.pageNumber ??
        widget.pageNumber;
    final surahNumber =
        _quranCubit.currentReadingPositionNotifier.value?.surahNumber ??
        widget.surahNumber;
    return ValueListenableBuilder<Color>(
      valueListenable: _quranCubit.readingBackgroundColorNotifier,
      builder: (context, backgroundColor, child) {
        return Scaffold(
          backgroundColor: backgroundColor,
          body: SafeArea(
            bottom: false,
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Container(
                    color: MyColors.primary,
                    child: Row(
                      children: [
                        if (Platform.isIOS)
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                        Expanded(
                          child: TabBar(
                            onTap: (value) {
                              _quranCubit.currentTabNotifier.value = value;
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
                        IconButton(
                          onPressed: () => _showColorPicker(context),
                          icon: const Icon(
                            Icons.color_lens,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        ValueListenableBuilder<ReadingPosition?>(
                          valueListenable:
                              _quranCubit.currentReadingPositionNotifier,
                          builder: (context, verse, child) {
                            if (verse == null) {
                              return const SizedBox.shrink();
                            }
                            return SurahAppBar(
                              juz: verse.juz.toString(),
                              surahNumber: verse.surahNumber.toString(),
                              surahName: verse.surahName,
                            );
                          },
                        ),
                        Expanded(
                          child: ValueListenableBuilder(
                            valueListenable: _quranCubit.bookMarkNotifier,
                            builder: (context, bookmark, child) {
                              return IndexedStack(
                                index: _index,
                                children: [
                                  BlocProvider(
                                    create: (context) => getIt<MushafCubit>(),
                                    child: MushafScreen(
                                      key: ValueKey(pageNumber),
                                      pageNumber: pageNumber,
                                    ),
                                  ),
                                  BlocProvider(
                                    create: (context) => getIt<AyatCubit>(),
                                    child: QuranAyatScreen(
                                      key: ValueKey(surahNumber),
                                      surahNumber: surahNumber,
                                      ayaNumber:
                                          _quranCubit
                                              .currentReadingPositionNotifier
                                              .value
                                              ?.verseNumber ??
                                          widget.ayaNumber,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showColorPicker(BuildContext context) {
    Color pickerColor = _quranCubit.readingBackgroundColorNotifier.value;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(S.of(context).settings),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: pickerColor,
            onColorChanged: (color) {
              pickerColor = color;
            },
            enableAlpha: false,
            labelTypes: const [],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              S.of(context).cancel,
              style: MyTextStyles.font15RegularGrey.copyWith(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              _quranCubit.updateReadingBackgroundColor(pickerColor);
              Navigator.pop(context);
            },
            child: Text(
              S.of(context).add,
              style: MyTextStyles.font15RegularGrey.copyWith(
                color: MyColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
