import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/database/quran/quran_database.dart';
import 'package:noor/core/helpers/arabic_numbers_converter.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';
import 'package:noor/features/quran/logic/ayat_cubit/ayat_cubit.dart';
import 'package:noor/features/quran/logic/ayat_cubit/ayat_state.dart';
import 'package:noor/features/quran/logic/quran_cubit/quran_cubit.dart';
import 'package:noor/features/quran/ui/widgets/aya_options_dialog.dart';
import 'package:noor/features/quran/ui/widgets/ayat_playing_row.dart';

class VerseWidget extends StatelessWidget {
  final Verse verse;

  const VerseWidget({super.key, required this.verse});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AyatCubit, AyatState>(
      buildWhen: (previous, current) =>
          current is AyahSoundPlayed ||
          current is AyahSoundLoading ||
          current is AyahSoundError ||
          current is AudioPlayerStopped ||
          current is AudioPlayerPaused,
      listenWhen: (previous, current) => current is AyahSoundError,
      listener: (context, state) {
        if (state is AyahSoundError &&
            state.surahNumber == verse.surahNumber &&
            state.verseNumber == verse.number) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        final isPlaying =
            state is AyahSoundPlayed &&
            state.surahNumber == verse.surahNumber &&
            state.verseNumber == verse.number;

        final quranCubit = context.read<QuranCubit>();

        return ValueListenableBuilder<Color>(
          valueListenable: quranCubit.readingBackgroundColorNotifier,
          builder: (context, bgColor, child) {
            final verseTextColor = quranCubit.getVerseTextColor();
            final translationTextColor = quranCubit.getTranslationTextColor();

            return GestureDetector(
              onLongPress: () {
                if (state is! AyahSoundLoading) {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    builder: (_) => BlocProvider.value(
                      value: context.read<QuranCubit>(),
                      child: AyaBottomSheet(
                        ayaText: verse.textAr,
                        suraNumber: verse.surahNumber,
                        ayaNumber: verse.number,
                        pageNumber: verse.page,
                        juzNumber: verse.juz,
                        fontFamily: "KFGQPC_Uthmanic",
                        onPlaySound: () {
                          context.read<AyatCubit>().getAyaSound(
                            surahNumber: verse.surahNumber,
                            verseNumber: verse.number,
                            qari: context
                                .read<QuranCubit>()
                                .currentQuranReaderNotifier
                                .url,
                          );
                        },
                      ),
                    ),
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:
                      state is AyahSoundState &&
                          state.surahNumber == verse.surahNumber &&
                          state.verseNumber == verse.number
                      ? Colors.green.shade100
                      : (context
                                    .read<QuranCubit>()
                                    .bookMarkNotifier
                                    .value
                                    ?.surahNumber ==
                                verse.surahNumber &&
                            context
                                    .read<QuranCubit>()
                                    .bookMarkNotifier
                                    .value
                                    ?.ayaNumber ==
                                verse.number)
                      ? Colors.red.shade50
                      : Colors.transparent,
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: RichText(
                        textDirection: TextDirection.rtl,
                        text: TextSpan(
                          text:
                              "${verse.textAr} ${ArabicNumbersConverter.convertToArabicDigits(verse.number)} ",
                          style: TextStyle(
                            color: verseTextColor,
                            fontSize: 26.3,
                            fontFamily: "KFGQPC_Uthmanic",
                          ),
                        ),
                      ),
                    ),
                    if (Localizations.localeOf(context).languageCode != "ar")
                      const SizedBox(height: 10),
                    if (Localizations.localeOf(context).languageCode != "ar")
                      Text(
                        textDirection: TextDirection.ltr,
                        verse.textEn,
                        style: TextStyle(
                          color: translationTextColor,
                          fontSize: 16,
                          fontWeight: FontWeightHelper.medium,
                        ),
                      ),
                    const SizedBox(height: 20),
                    if (state is AyahSoundState &&
                        state.surahNumber == verse.surahNumber &&
                        state.verseNumber == verse.number)
                      PlayingRow(isPlaying: isPlaying, verse: verse),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
