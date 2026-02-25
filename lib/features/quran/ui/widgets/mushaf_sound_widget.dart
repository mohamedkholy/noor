import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/widgets/decorated_container.dart';
import 'package:noor/features/quran/logic/mushaf_cubit/mushaf_cubit.dart';
import 'package:noor/features/quran/logic/quran_cubit/quran_cubit.dart';
import 'package:noor/features/quran/ui/widgets/qari_dropdown_widget.dart';

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
    return DecoratedContainer(
      borderRadius: BorderRadius.circular(10),
      padding: const EdgeInsets.only(top: 5, bottom: 15, left: 10, right: 10),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          children: [
            IntrinsicHeight(
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
                        icon: const Icon(
                          Icons.skip_previous_sharp,
                          size: 28,
                          color: Colors.white,
                        ),
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
                                  color: Colors.white,
                                ),
                              )
                            : Icon(
                                isPlaying ? Icons.pause : Icons.play_arrow,
                                size: 28,
                                color: Colors.white,
                              ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: context
                            .read<MushafCubit>()
                            .lastPositionNotifier,
                        builder: (context, ayahCount, child) {
                          return IconButton(
                            disabledColor: Colors.grey,
                            color: Colors.white,
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
                      icon: const Icon(
                        Icons.close,
                        size: 28,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            QariDropdownWidget(
              onChanged: (value) {
                context.read<QuranCubit>().currentQuranReaderNotifier = value;
                context.read<MushafCubit>().getPageSound(
                  pageNumber: pageNumber,
                  verseNumber: ayaNumber,
                  suraNumber: suraNumber,
                  qari: value.url,
                  lineNumber: 1,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
