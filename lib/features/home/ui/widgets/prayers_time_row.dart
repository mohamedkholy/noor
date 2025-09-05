import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/generated/l10n.dart';

class PrayersTimeRow extends StatefulWidget {
  final PrayerTimes prayerTimes;
  final Prayer nextPrayer;
  const PrayersTimeRow({
    super.key,
    required this.prayerTimes,
    required this.nextPrayer,
  });

  @override
  State<PrayersTimeRow> createState() => _PrayersTimeRowState();
}

class _PrayersTimeRowState extends State<PrayersTimeRow> {
  late List<(String, IconData, DateTime, Prayer)> prayers;

  @override
  Widget build(BuildContext context) {
    _initPrayers();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: prayers.map((e) {
        final isNextPrayer = widget.nextPrayer == e.$4;
        final color = isNextPrayer ? MyColors.secondary : Colors.white;
        return Column(
          children: [
            Text(
              e.$1,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 5),
            Icon(e.$2, color: color),
            const SizedBox(height: 5),
            Text(
              DateFormat.Hm().format(e.$3),
              style: TextStyle(
                color: color,
                fontWeight: FontWeightHelper.semiBold,
                fontSize: 15,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  void _initPrayers() {
    prayers = [
      (
        S.of(context).fajr,
        Icons.nights_stay,
        widget.prayerTimes.fajr,
        Prayer.fajr,
      ),
      (
        S.of(context).shorok,
        Icons.wb_twighlight,
        widget.prayerTimes.sunrise,
        Prayer.sunrise,
      ),
      (
        S.of(context).dhuhr,
        Icons.sunny,
        widget.prayerTimes.dhuhr,
        Prayer.dhuhr,
      ),
      (
        S.of(context).asr,
        Icons.brightness_medium,
        widget.prayerTimes.asr,
        Prayer.asr,
      ),
      (
        S.of(context).maghrib,
        Icons.nightlight_round,
        widget.prayerTimes.maghrib,
        Prayer.maghrib,
      ),
      (
        S.of(context).isha,
        Icons.nightlight,
        widget.prayerTimes.isha,
        Prayer.isha,
      ),
    ];
  }
}
