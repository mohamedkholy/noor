import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/database/cities/cities_database.dart';
import 'package:noor/core/helpers/prayer_times_helper.dart';
import 'package:noor/core/widgets/decorated_container.dart';
import 'package:noor/core/widgets/my_app_bar.dart';
import 'package:noor/features/calender/ui/logic/calender_cubit.dart';
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
  late City _city;

  @override
  void initState() {
    _city =
        context.read<CalenderCubit>().getSavedCity() ??
        const City(name: "Makkah", lat: 21.42664, lng: 39.82563, country: "SA");
    initPrayerTimes(DateTime.now(), _city);
    super.initState();
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
                      initPrayerTimes(date, _city);
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

  void initPrayerTimes(DateTime date, City city) {
    prayerTimes = PrayerTimesHelper.getPrayerTimes(city: city, date: date);
    nextPrayer = DateUtils.dateOnly(date) == DateUtils.dateOnly(DateTime.now())
        ? prayerTimes.nextPrayer()
        : null;
  }
}
