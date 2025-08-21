import 'dart:math';

import 'package:flutter/material.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CircularSlider extends StatelessWidget {
  final double totalDuration;
  final Duration nextPrayerDuration;
  final String nextPrayer;

  const CircularSlider({
    super.key,
    required this.totalDuration,
    required this.nextPrayerDuration,
    required this.nextPrayer,
  });

  @override
  Widget build(BuildContext context) {
    return SleekCircularSlider(
      min: 0,
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
          padding: EdgeInsets.all(10),
          child: Text(
            textAlign: TextAlign.center,
            "${nextPrayer[0].toUpperCase()}${nextPrayer.substring(1)} Prayer in\n${_formatDuration(nextPrayerDuration)}",
            style: TextStyle(
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
    String twoDigitMinutes = twoDigits(d.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(d.inSeconds.remainder(60));
    return "${twoDigits(d.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
