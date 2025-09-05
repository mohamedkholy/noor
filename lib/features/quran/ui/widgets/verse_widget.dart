import 'package:flutter/material.dart';
import 'package:noor/core/database/quran/quran_database.dart';
import 'package:noor/core/helpers/arabic_numbers_converter.dart';
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
                text:
                    "${verse.textAr} ${ArabicNumbersConverter.convertToArabicDigits(verse.number)} ",
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
            textDirection: TextDirection.ltr,
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
}
