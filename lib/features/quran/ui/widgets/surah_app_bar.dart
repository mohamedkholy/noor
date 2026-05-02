import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';
import 'package:noor/features/quran/logic/quran_cubit/quran_cubit.dart';

import '../../../../generated/l10n.dart';

class SurahAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String juz;
  final String surahNumber;
  final String surahName;
  const SurahAppBar({
    super.key,
    required this.juz,
    required this.surahNumber,
    required this.surahName,
  });

  final Map<int, String> arabicOrdinals = const {
    1: 'الأول',
    2: 'الثاني',
    3: 'الثالث',
    4: 'الرابع',
    5: 'الخامس',
    6: 'السادس',
    7: 'السابع',
    8: 'الثامن',
    9: 'التاسع',
    10: 'العاشر',

    11: 'الحادي عشر',
    12: 'الثاني عشر',
    13: 'الثالث عشر',
    14: 'الرابع عشر',
    15: 'الخامس عشر',
    16: 'السادس عشر',
    17: 'السابع عشر',
    18: 'الثامن عشر',
    19: 'التاسع عشر',

    20: 'العشرون',
    21: 'الحادي والعشرون',
    22: 'الثاني والعشرون',
    23: 'الثالث والعشرون',
    24: 'الرابع والعشرون',
    25: 'الخامس والعشرون',
    26: 'السادس والعشرون',
    27: 'السابع والعشرون',
    28: 'الثامن والعشرون',
    29: 'التاسع والعشرون',
    30: 'الثلاثون',
  };

  @override
  Widget build(BuildContext context) {
    final quranCubit = context.read<QuranCubit>();
    return ValueListenableBuilder(
      valueListenable: quranCubit.readingBackgroundColorNotifier,
      builder: (context, value, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          color: value,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Expanded(
                child: Text(
                  " ${S.current.juz_2} ${Localizations.localeOf(context).languageCode == 'ar' ? arabicOrdinals[int.parse(juz)] : juz}",
                  style: TextStyle(
                    fontSize: 17,
                    color: quranCubit.getVerseTextColor(),
                    fontWeight: FontWeightHelper.medium,
                  ),
                ),
              ),

              // Text(
              //   surahNumber,
              //   style: const TextStyle(
              //     fontSize: 17,
              //     color: Colors.white,
              //     fontWeight: FontWeightHelper.medium,
              //   ),
              // ),
              Text(
                " $surahName",
                style: TextStyle(
                  fontSize: 23,
                  fontFamily: "KFGQPC_Uthmanic",
                  color: quranCubit.getVerseTextColor(),
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
