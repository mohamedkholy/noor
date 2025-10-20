import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/database/quran/quran_database.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/core/widgets/decorated_container.dart';
import 'package:noor/features/quran/data/models/quran_reader.dart';
import 'package:noor/features/quran/logic/ayat_cubit/ayat_cubit.dart';
import 'package:noor/features/quran/logic/ayat_cubit/ayat_state.dart';
import 'package:noor/features/quran/logic/quran_cubit/quran_cubit.dart';
import 'package:noor/features/quran/ui/widgets/qari_dropdown_widget.dart';

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
      child: DecoratedContainer(
        borderRadius: BorderRadius.circular(10),
        padding: const EdgeInsets.only(top: 5, bottom: 15, left: 10, right: 10),
        child: Column(
          children: [
            Stack(
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
                                qari: _cubit.currentQuranReaderNotifier.url,
                              );
                            },
                      icon: const Icon(
                        Icons.skip_previous_sharp,
                        size: 28,
                        color: Colors.white,
                      ),
                    ),
                    BlocBuilder<AyatCubit, AyatState>(
                      builder: (context, state) {
                        return IconButton(
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
                          icon:
                              state is AyahSoundLoading &&
                                  state.surahNumber ==
                                      widget.verse.surahNumber &&
                                  state.verseNumber == widget.verse.number
                              ? const SizedBox(
                                  width: 25,
                                  height: 25,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Icon(
                                  widget.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  size: 28,
                                  color: Colors.white,
                                ),
                        );
                      },
                    ),
                    ValueListenableBuilder(
                      valueListenable: _cubit.currentSurahNotifier,
                      builder: (context, surah, child) {
                        return IconButton(
                          onPressed:
                              (surah?.versesCount ?? 1) == widget.verse.number
                              ? null
                              : () {
                                  context.read<AyatCubit>().getAyaSound(
                                    surahNumber: widget.verse.surahNumber,
                                    verseNumber: widget.verse.number + 1,
                                    qari: _cubit
                                        .currentQuranReaderNotifier
                                        
                                        .url,
                                  );
                                },
                          icon: const Icon(
                            Icons.skip_next_sharp,
                            size: 28,
                            color: Colors.white,
                          ),
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
                    icon: const Icon(
                      Icons.close,
                      size: 28,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            QariDropdownWidget(
              onChanged: (value) {
                _cubit.currentQuranReaderNotifier = value;
                context.read<AyatCubit>().getAyaSound(
                  surahNumber: widget.verse.surahNumber,
                  verseNumber: widget.verse.number,
                  qari: _cubit.currentQuranReaderNotifier.url,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
