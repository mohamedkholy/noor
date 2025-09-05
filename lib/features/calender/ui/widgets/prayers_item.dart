import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';
import 'package:noor/core/theming/my_colors.dart';

import '../../../../generated/l10n.dart';

class PrayersItem extends StatefulWidget {
  final PrayerTimes prayerTimes;
  final Prayer? nextPrayer;
  const PrayersItem({super.key, required this.prayerTimes, this.nextPrayer});

  @override
  State<PrayersItem> createState() => _PrayersItemState();
}

class _PrayersItemState extends State<PrayersItem> {
  List<(String, IconData, DateTime, Prayer)> prayers = [];

  @override
  void didUpdateWidget(covariant PrayersItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    initPrayers();
  }

  void initPrayers() {
    prayers = [
      (S.current.fajr, Icons.nights_stay, widget.prayerTimes.fajr, Prayer.fajr),
      (
        S.current.shorok,
        Icons.wb_twighlight,
        widget.prayerTimes.sunrise,
        Prayer.sunrise,
      ),
      (S.current.dhuhr, Icons.sunny, widget.prayerTimes.dhuhr, Prayer.dhuhr),
      (
        S.current.asr,
        Icons.brightness_medium,
        widget.prayerTimes.asr,
        Prayer.asr,
      ),
      (
        S.current.maghrib,
        Icons.nightlight_round,
        widget.prayerTimes.maghrib,
        Prayer.maghrib,
      ),
      (S.current.isha, Icons.nightlight, widget.prayerTimes.isha, Prayer.isha),
    ];
  }

  @override
  Widget build(BuildContext context) {
    initPrayers();
    return Column(
      children: [
        ...prayers.map((e) {
          final isNextPrayer = widget.nextPrayer == e.$4;
          final color = isNextPrayer ? MyColors.secondary : Colors.white;
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Icon(e.$2, color: color),
                const SizedBox(width: 10),
                Text(
                  e.$1,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(width: 5),
                const Spacer(),
                Text(
                  DateFormat.Hm().format(e.$3),
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeightHelper.medium,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          );
        }),
        const SizedBox(height: 20),
      ],
    );
  }
}
