import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noor/core/theming/my_colors.dart';

class PrayersTimeRow extends StatefulWidget {
  final PrayerTimes prayerTimes;
  final String nextPrayer;
  const PrayersTimeRow({super.key, required this.prayerTimes, required this.nextPrayer});

  @override
  State<PrayersTimeRow> createState() => _PrayersTimeRowState();
}

class _PrayersTimeRowState extends State<PrayersTimeRow> {
  late final List<(String, IconData, DateTime, Prayer)> prayers;

  @override
  void initState() {
    super.initState();
    prayers = [
      ("Fajr", Icons.nights_stay, widget.prayerTimes.fajr, Prayer.fajr),
      (
        "Shorok",
        Icons.wb_twighlight,
        widget.prayerTimes.sunrise,
        Prayer.sunrise,
      ),
      ("Dhuhr", Icons.sunny, widget.prayerTimes.dhuhr, Prayer.dhuhr),
      ("Asr", Icons.brightness_medium, widget.prayerTimes.asr, Prayer.asr),
      (
        "Maghrib",
        Icons.nightlight_round,
        widget.prayerTimes.maghrib,
        Prayer.maghrib,
      ),
      ("Isha", Icons.nightlight, widget.prayerTimes.isha, Prayer.isha),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: prayers.map((e) {
        final isNextPrayer = widget.nextPrayer == e.$4.name;
        final color = isNextPrayer ? MyColors.secondary : Colors.white;
        return Column(
          children: [
            Text(
              e.$1,
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Icon(e.$2, color: color),
            SizedBox(height: 5),
            Text(DateFormat.Hm().format(e.$3), style: TextStyle(color: color)),
          ],
        );
      }).toList(),
    );
  }
}
