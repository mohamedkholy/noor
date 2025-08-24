import 'package:flutter/material.dart';
import 'package:noor/core/database/quran/quran_database.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';

class VerseWidget extends StatelessWidget {
  final Verse verse;

  const VerseWidget({super.key, required this.verse});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: RichText(
              textDirection: TextDirection.rtl,
              text: TextSpan(
                text: "${verse.textAr} ${convertToArabicDigits(verse.number)} ",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 26.3,
                  fontFamily: "KFGQPC_Uthmanic",
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            verse.textEn,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeightHelper.medium,
            ),
          ),
        ],
      ),
    );
  }

  String convertToArabicDigits(int number) {
    const arabicDigits = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    return number
        .toString()
        .split('')
        .map((d) => arabicDigits[int.parse(d)])
        .join();
  }
}
