import 'dart:math';

import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

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
        ? "Shorok"
        : "${nextPrayer.name[0].toUpperCase()}${nextPrayer.name.substring(1)} Prayer";
    return SleekCircularSlider(
      max: totalDuration,
      initialValue: max(
        0,
        totalDuration - nextPrayerDuration.inSeconds.toDouble(),
      ),
      appearance: CircularSliderAppearance(
        size: 250,
        customWidths: CustomSliderWidths(
          progressBarWidth: 10,
          trackWidth: 5,
          handlerSize: 10,
        ),
        customColors: CustomSliderColors(
          dotColor: MyColors.secondary,
          progressBarColor: MyColors.secondary,
          trackColor: Colors.white,
        ),
      ),
      innerWidget: (percentage) => Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            textAlign: TextAlign.center,
            "$nextPrayerName in\n${_formatDuration(nextPrayerDuration)}",
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
