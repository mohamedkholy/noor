import 'package:flutter/material.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';

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

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            " ${S.current.juz} $juz",
            style: const TextStyle(
              fontSize: 17,
              color: Colors.white,
              fontWeight: FontWeightHelper.medium,
            ),
          ),
          const Spacer(),
          Text(
            surahNumber,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.white,
              fontWeight: FontWeightHelper.medium,
            ),
          ),
          Text(
            " $surahName",
            style: const TextStyle(
              fontSize: 23,
              color: Colors.white,
              fontFamily: "KFGQPC_Uthmanic",
              fontWeight: FontWeightHelper.medium,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
