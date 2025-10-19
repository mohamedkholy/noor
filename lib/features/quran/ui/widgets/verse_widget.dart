import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/database/quran/quran_database.dart';
import 'package:noor/core/helpers/arabic_numbers_converter.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';
import 'package:noor/features/quran/logic/ayat_cubit/ayat_cubit.dart';
import 'package:noor/features/quran/logic/ayat_cubit/ayat_state.dart';
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

        final isPaused =
            state is AudioPlayerPaused &&
            state.surahNumber == verse.surahNumber &&
            state.verseNumber == verse.number;

        return GestureDetector(
          onLongPress: () {
            if (state is! AyahSoundLoading) {
              context.read<AyatCubit>().getAyaSound(
                surahNumber: verse.surahNumber,
                verseNumber: verse.number,
                qari: "ar.alafasy",
              );
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isPlaying || isPaused
                  ? Colors.green.shade100
                  : Colors.transparent,
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state is AyahSoundLoading &&
                    state.surahNumber == verse.surahNumber &&
                    state.verseNumber == verse.number)
                  const Center(child: CircularProgressIndicator()),
                SizedBox(
                  width: double.infinity,
                  child: RichText(
                    textDirection: TextDirection.rtl,
                    text: TextSpan(
                      text:
                          "${verse.textAr} ${ArabicNumbersConverter.convertToArabicDigits(verse.number)} ",
                      style: const TextStyle(
                        color: Colors.black,
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
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                const SizedBox(height: 20),
                if (isPlaying || isPaused)
                  PlayingRow(isPlaying: isPlaying, verse: verse),
              ],
            ),
          ),
        );
      },
    );
  }
}
