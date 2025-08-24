import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:noor/core/database/azkar/azkar_database.dart';
import 'package:noor/core/helpers/arabic_numbers_converter.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/core/theming/my_text_styles.dart';
import 'package:noor/features/azkar/ui/widgets/zikr_count.dart';

class ZikrWidget extends StatefulWidget {
  final AzkarData zekr;
  final int count;
  final Null Function(dynamic count) onCountChange;

  const ZikrWidget({
    super.key,
    required this.zekr,
    required this.count,
    required this.onCountChange,
  });

  @override
  State<ZikrWidget> createState() => _ZikrWidgetState();
}

class _ZikrWidgetState extends State<ZikrWidget> {
  late int count = widget.count;

  @override
  Widget build(BuildContext context) {
    final zekr = widget.zekr;
    final hasDescriptionOrReference =
        zekr.description != null || zekr.reference != null;
    final hasCount = zekr.count != null && zekr.count! > 0;

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
          textDirection: TextDirection.rtl,
          children: [
            const SizedBox(height: 10),
            _buildText(zekr.zekr, fontSize: 25),
            if (hasDescriptionOrReference)
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: const DottedLine(
                  dashColor: MyColors.primary,
                  dashGapLength: 10,
                  dashLength: 10,
                  lineThickness: 2,
                ),
              ),
            if (zekr.description != null) _buildText(zekr.description!),
            if (zekr.reference != null) _buildText("المصدر: ${zekr.reference}"),
            if (hasCount) ...[
              _buildText(
                "عدد مرات الذكر: ${ArabicNumbersConverter.convertToArabicDigits(zekr.count!)}",
              ),
              ZikrCount(
                progress: count / zekr.count!.toDouble(),
                count: count,
                onTap: () {
                  if (count < zekr.count!) {
                    setState(() => count++);
                    widget.onCountChange(count);
                  }
                },
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildText(String text, {double fontSize = 20}) => Container(
    margin: const EdgeInsets.only(bottom: 10),
    width: double.infinity,
    child: Text(
      text,
      textDirection: TextDirection.rtl,
      style: MyTextStyles.font20AmiriBlack.copyWith(fontSize: fontSize),
    ),
  );
}
