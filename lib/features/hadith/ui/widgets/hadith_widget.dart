import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';
import 'package:noor/core/theming/my_colors.dart';

class HadithWidget extends StatelessWidget {
  final String textAr;
  final String textEn;
  final int hadithNumber;
  final String searchValue;
  const HadithWidget({
    super.key,
    required this.textAr,
    required this.textEn,
    required this.hadithNumber,
    required this.searchValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.primary.withAlpha(50),
      margin: const EdgeInsets.all(15),
      child: DottedBorder(
        options: const RectDottedBorderOptions(
          strokeWidth: 2,
          color: MyColors.primary,
          dashPattern: [10, 10],
          padding: EdgeInsets.all(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              child: CircleAvatar(
                backgroundColor: MyColors.primary.withAlpha(100),
                child: Text(
                  "$hadithNumber",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeightHelper.medium,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: TextHighlight(
                textDirection: TextDirection.rtl,
                text: formatText(textAr),
                words: {
                  searchValue: HighlightedWord(
                    textStyle: const TextStyle(color: Colors.red, fontSize: 28),
                  ),
                },
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontFamily: "KFGQPC_Uthmanic",
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextHighlight(
              textDirection: TextDirection.rtl,
              text: formatText(textEn),
              words: {
                searchValue: HighlightedWord(
                  textStyle: const TextStyle(color: Colors.red, fontSize: 20),
                ),
              },
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatText(String text) {
    return text.replaceAll(r'\n', '\n').replaceAll(r'\"', '"');
  }
}
