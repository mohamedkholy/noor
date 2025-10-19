import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/database/quran/quran_database.dart';
import 'package:noor/features/quran/logic/ayat_cubit/ayat_cubit.dart';
import 'package:noor/features/quran/logic/quran_cubit/quran_cubit.dart';

class PlayingRow extends StatefulWidget {
  final bool isPlaying;
  final Verse verse;
  const PlayingRow({super.key, required this.isPlaying, required this.verse});

  @override
  State<PlayingRow> createState() => _PlayingRowState();
}

class _PlayingRowState extends State<PlayingRow> {
  late final QuranCubit _cubit = context.read<QuranCubit>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.green.shade100,
        ),
        width: double.infinity,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: widget.verse.number == 1
                      ? null
                      : () {
                          context.read<AyatCubit>().getAyaSound(
                            surahNumber: widget.verse.surahNumber,
                            verseNumber: widget.verse.number - 1,
                            qari: "ar.alafasy",
                          );
                        },
                  icon: const Icon(Icons.skip_previous_sharp, size: 28),
                ),
                IconButton(
                  onPressed: () {
                    if (widget.isPlaying) {
                      context.read<AyatCubit>().pausePlayer((
                        widget.verse.surahNumber,
                        widget.verse.number,
                      ));
                    } else {
                      context.read<AyatCubit>().continuePlaying();
                    }
                  },
                  icon: Icon(
                    widget.isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 28,
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: _cubit.currentSurahNotifier,
                  builder: (context, surah, child) {
                    print("surahCount ${surah?.versesCount}");
                    return IconButton(
                      onPressed:
                          (surah?.versesCount ?? 1) == widget.verse.number
                          ? null
                          : () {
                              context.read<AyatCubit>().getAyaSound(
                                surahNumber: widget.verse.surahNumber,
                                verseNumber: widget.verse.number + 1,
                                qari: "ar.alafasy",
                              );
                            },
                      icon: const Icon(Icons.skip_next_sharp, size: 28),
                    );
                  },
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: IconButton(
                onPressed: () {
                  context.read<AyatCubit>().stopPlayer();
                },
                icon: const Icon(Icons.close, size: 28),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
