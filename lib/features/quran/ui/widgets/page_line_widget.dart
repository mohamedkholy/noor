import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/features/quran/data/models/line_data.dart';
import 'package:noor/features/quran/data/models/line_type.dart';
import 'package:noor/features/quran/logic/mushaf_cubit/mushaf_cubit.dart';
import 'package:noor/features/quran/logic/mushaf_cubit/mushaf_state.dart';
import 'package:noor/features/quran/logic/quran_cubit/quran_cubit.dart';
import 'package:noor/features/quran/ui/widgets/aya_options_dialog.dart';

class PageLineWidget extends StatelessWidget {
  final int pageNumber;
  final double? lineHeight;
  final LineData line;
  const PageLineWidget({
    super.key,
    required this.line,
    required this.pageNumber,
    required this.lineHeight,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MushafCubit, MushafState>(
      listener: (context, state) {
        if (state is PageSoundError &&
            state.lineNumber == line.info.lineNumber &&
            state.suraNumber == line.words.firstOrNull?.surah &&
            state.ayaNumber == line.words.firstOrNull?.ayah) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return DefaultTextStyle(
          style: TextStyle(
            fontFamily: 'QCF_P${pageNumber.toString().padLeft(3, '0')}',
            fontSize: pageNumber == 1 || pageNumber == 2
                ? 30
                : MediaQuery.sizeOf(context).width * .06,
            color: Colors.black,
            height:
                pageNumber == 1 ||
                    pageNumber == 2 ||
                    MediaQuery.sizeOf(context).height < 600
                ? 1.7
                : 1.35,
            fontWeight: FontWeight.w100,
          ),
          child: SizedBox(
            height: lineHeight,
            child: AutoSizeText.rich(
              TextSpan(
                children: line.data
                    .map(
                      (e) => TextSpan(
                        text: e.$1,
                        style: TextStyle(
                          background:
                              (context
                                          .read<QuranCubit>()
                                          .bookMarkNotifier
                                          .value
                                          ?.surahNumber ==
                                      line.words.firstOrNull?.surah &&
                                  context
                                          .read<QuranCubit>()
                                          .bookMarkNotifier
                                          .value
                                          ?.ayaNumber ==
                                      e.$2)
                              ? (Paint()..color = Colors.red.shade100)
                              : null,
                          color:
                              (state is AudioPlayerState &&
                                  state.suraNumber ==
                                      line.words.firstOrNull?.surah &&
                                  state.ayaNumber == e.$2)
                              ? Colors.red
                              : Colors.black,
                        ),
                        recognizer: LongPressGestureRecognizer()
                          ..onLongPress = () async {
                            final ayaText = await context
                                .read<MushafCubit>()
                                .getAyaText(
                                  suraNumber:
                                      line.words.firstOrNull?.surah ?? 0,
                                  ayaNumber: e.$2,
                                );
                            if (context.mounted) {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                isScrollControlled: true,
                                builder: (_) => BlocProvider.value(
                                  value: context.read<QuranCubit>(),
                                  child: AyaBottomSheet(
                                    ayaText: ayaText,
                                    suraNumber:
                                        line.words.firstOrNull?.surah ?? 0,
                                    ayaNumber: e.$2,
                                    pageNumber: pageNumber,
                                    juzNumber: line.words.firstOrNull?.juz ?? 0,
                                    fontFamily: "KFGQPC_Uthmanic",
                                    onPlaySound: () {
                                      if (line.info.lineType ==
                                              LineType.ayah.name &&
                                          (state is! AudioPlayerState)) {
                                        context
                                            .read<MushafCubit>()
                                            .getPageSound(
                                              pageNumber: pageNumber,
                                              verseNumber: e.$2,
                                              suraNumber:
                                                  line.words.first.surah,
                                              lineNumber: line.info.lineNumber,
                                              qari: context
                                                  .read<QuranCubit>()
                                                  .currentQuranReaderNotifier
                                                  .url,
                                            );
                                      }
                                    },
                                  ),
                                ),
                              );
                            }
                          },
                      ),
                    )
                    .toList(),
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              stepGranularity: 4,
            ),
          ),
        );
      },
    );
  }
}
