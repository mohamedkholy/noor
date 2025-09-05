import 'dart:math';

import 'package:adhan/adhan.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:noor/core/helpers/extensions.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/generated/l10n.dart' show S;

class CircularSlider extends StatelessWidget {
  final double totalDuration;
  final Duration nextPrayerDuration;
  final Prayer nextPrayer;

  const CircularSlider({
    super.key,
    required this.totalDuration,
    required this.nextPrayerDuration,
    required this.nextPrayer,
  });

  @override
  Widget build(BuildContext context) {
    final nextPrayerName = nextPrayer == Prayer.sunrise
        ? S.of(context).shorok
        : nextPrayer.getTranslatedName(
            lang: Localizations.localeOf(context).languageCode,
          );
    return DashedCircularProgressBar(
      width: 250,
      height: 250,
      startAngle: 225,
      sweepAngle: 270,
      foregroundColor: MyColors.secondary,
      seekColor: MyColors.secondary,
      backgroundColor: Colors.white24,
      foregroundStrokeWidth: 10,
      backgroundStrokeWidth: 5,
      animation: true,
      seekSize: 15,
      progress:
          (max(0, totalDuration - nextPrayerDuration.inSeconds.toDouble()) /
              totalDuration) *
          100,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            textAlign: TextAlign.center,
            "$nextPrayerName ${S.of(context).in_word}\n${_formatDuration(nextPrayerDuration)}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
        ),
      ),
    );
  }

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final String twoDigitMinutes = twoDigits(d.inMinutes.remainder(60));
    final String twoDigitSeconds = twoDigits(d.inSeconds.remainder(60));
    return "${twoDigits(d.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}

// SleekCircularSlider(
//       max: totalDuration,
//       initialValue: max(
//         0,
//         totalDuration - nextPrayerDuration.inSeconds.toDouble(),
//       ),
//       appearance: CircularSliderAppearance(
//         size: 250,
//         customWidths: CustomSliderWidths(
//           progressBarWidth: 10,
//           trackWidth: 5,
//           handlerSize: 10,
//         ),
//         customColors: CustomSliderColors(
//           dotColor: MyColors.secondary,
//           progressBarColor: MyColors.secondary,
//           trackColor: Colors.white,
//         ),
//       ),
//       innerWidget: (percentage) => Center(
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Text(
//             textAlign: TextAlign.center,
//             "$nextPrayerName in\n${_formatDuration(nextPrayerDuration)}",
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 24,
//               fontWeight: FontWeightHelper.bold,
//             ),
//           ),
//         ),
//       ),
//     );
