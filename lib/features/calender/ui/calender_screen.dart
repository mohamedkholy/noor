import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:noor/core/widgets/decorated_container.dart';
import 'package:noor/core/widgets/my_app_bar.dart';
import 'package:noor/features/calender/ui/widgets/calender_widget.dart';
import 'package:noor/features/calender/ui/widgets/prayers_item.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  late PrayerTimes prayerTimes;
  Prayer? nextPrayer;

  @override
  void initState() {
    super.initState();
    initPrayerTimes(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Calender'),
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: SingleChildScrollView(
            child: DecoratedContainer(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  CalenderWidget(
                    onDateChanged: (date) {
                      initPrayerTimes(date);
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 20),
                  PrayersItem(prayerTimes: prayerTimes, nextPrayer: nextPrayer),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void initPrayerTimes(DateTime date) {
    final myCoordinates = Coordinates(30.789319545900607, 30.99762890423023);
    final params = CalculationMethod.egyptian.getParameters();
    params.madhab = Madhab.shafi;
    prayerTimes = PrayerTimes(
      myCoordinates,
      DateComponents(date.year, date.month, date.day),
      params,
    );
    nextPrayer = DateUtils.dateOnly(date) == DateUtils.dateOnly(DateTime.now())
        ? prayerTimes.nextPrayer()
        : null;
  }
}
