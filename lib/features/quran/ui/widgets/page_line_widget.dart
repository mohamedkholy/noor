import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/features/quran/data/models/line_data.dart';
import 'package:noor/features/quran/logic/quran_cubit.dart';
import 'package:noor/features/quran/logic/quran_state.dart';

class PageLineWidget extends StatelessWidget {
  final int pageNumber;
  final double lineHeight;
  final LineData line;
  const PageLineWidget({
    super.key,
    required this.line,
    required this.pageNumber,
    required this.lineHeight,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranCubit, QuranState>(
      buildWhen: (previous, current) =>
          current is PageSoundError ||
          current is PageSoundLoaded ||
          current is PageSoundLoading,
          listenWhen: (previous, current) => current is PageSoundError,
      listener: (context, state) {},
      builder: (context, state) {
        return DefaultTextStyle(
          style: TextStyle(
            fontFamily: 'QCF_P${pageNumber.toString().padLeft(3, '0')}',
            fontSize: pageNumber == 1 || pageNumber == 2
                ? 30
                : MediaQuery.sizeOf(context).width * .06,
            color: Colors.black,
            height: 1.35,
            fontWeight: FontWeight.bold,
          ),
          child: SizedBox(
            height: lineHeight,
            child: AutoSizeText.rich(
              TextSpan(
                children: line.precomputedText
                    .map((e) => TextSpan(text: e))
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
