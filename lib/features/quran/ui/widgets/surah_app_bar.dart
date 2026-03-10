import 'dart:io';

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
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          if (Platform.isIOS) ...[
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            ),
            const SizedBox(width: 16),
          ],
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Expanded(
                  child: Text(
                    " ${S.current.juz} $juz",
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                ),

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
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
