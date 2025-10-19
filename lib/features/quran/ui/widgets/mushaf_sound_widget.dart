import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/features/quran/logic/mushaf_cubit/mushaf_cubit.dart';

class MushafSoundWidget extends StatelessWidget {
  final bool isPlaying;
  final bool isLoading;
  final int pageNumber;
  final int suraNumber;
  final int ayaNumber;
  const MushafSoundWidget({
    super.key,
    required this.isPlaying,
    required this.isLoading,
    required this.pageNumber,
    required this.suraNumber,
    required this.ayaNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green.shade100,
      ),
      width: double.infinity,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: IntrinsicHeight(
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: ayaNumber == 1
                        ? null
                        : () {
                            context.read<MushafCubit>().playAyah(
                              -1,
                              suraNumber: suraNumber,
                              verseNumber: ayaNumber - 1,
                            );
                          },
                    icon: const Icon(Icons.skip_previous_sharp, size: 28),
                  ),
                  IconButton(
                    onPressed: () {
                      if (isPlaying) {
                        context.read<MushafCubit>().pausePlayer(
                          pageNumber: pageNumber,
                          suraNumber: suraNumber,
                          ayaNumber: ayaNumber,
                        );
                      } else {
                        context.read<MushafCubit>().continuePlaying();
                      }
                    },
                    icon: isLoading
                        ? const SizedBox(
                            width: 25,
                            height: 25,
                            child: CircularProgressIndicator(
                              color: MyColors.primary,
                            ),
                          )
                        : Icon(
                            isPlaying ? Icons.pause : Icons.play_arrow,
                            size: 28,
                          ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: context
                        .read<MushafCubit>()
                        .lastPositionNotifier,
                    builder: (context, ayahCount, child) {
                      return IconButton(
                        onPressed: ayahCount
                            ? null
                            : () {
                                context.read<MushafCubit>().playAyah(
                                  1,
                                  suraNumber: suraNumber,
                                  verseNumber: ayaNumber + 1,
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
                    context.read<MushafCubit>().stopPlayer();
                  },
                  icon: const Icon(Icons.close, size: 28),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
