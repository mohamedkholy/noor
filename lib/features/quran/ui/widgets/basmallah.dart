import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/helpers/assets_helper.dart';
import 'package:noor/features/quran/logic/quran_cubit/quran_cubit.dart';

class Basmallah extends StatefulWidget {
  const Basmallah({super.key});

  @override
  State<Basmallah> createState() => _BasmallahState();
}

class _BasmallahState extends State<Basmallah> {
  @override
  Widget build(BuildContext context) {
    final quranCubit = context.read<QuranCubit>();

    return ValueListenableBuilder<Color>(
      valueListenable: quranCubit.readingBackgroundColorNotifier,
      builder: (context, bgColor, child) {
        final textColor = quranCubit.getVerseTextColor();

        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: FractionallySizedBox(
            widthFactor: 0.5,
            child: Image.asset(
              Assets.assetsImagesPngBasmala,
              fit: BoxFit.cover,
              color: textColor,
            ),
          ),
        );
      },
    );
  }
}
