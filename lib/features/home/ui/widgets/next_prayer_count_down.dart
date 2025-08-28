import 'dart:async';

import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/database/cities/cities_database.dart';
import 'package:noor/core/helpers/assets_helper.dart';
import 'package:noor/features/home/logic/home_cubit.dart';
import 'package:noor/features/home/logic/home_state.dart';
import 'package:noor/features/home/ui/widgets/circular_slider.dart';
import 'package:noor/features/home/ui/widgets/prayers_time_row.dart';

class NextPrayerCountDown extends StatefulWidget {
  const NextPrayerCountDown({super.key});

  @override
  State<NextPrayerCountDown> createState() => _NextPrayerCountDownState();
}

class _NextPrayerCountDownState extends State<NextPrayerCountDown> {
  late PrayerTimes _prayerTimes;
  late Prayer _nextPrayer;
  late DateTime _nextPrayerTime;
  late double _totalDuration;
  late Duration _nextPrayerDuration;
  late City _city;
  final ValueNotifier<Duration> _nextPrayerDurationNotifier = ValueNotifier(
    Duration.zero,
  );
  Timer? timer;

  @override
  void initState() {
    _city =
        context.read<HomeCubit>().getSavedCity() ??
        const City(
          name: "Makkah",
          lat: 21.42664,
          lng: 39.82563,
          country: "SA",
        );
    initPrayerTimes(_city);
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    _nextPrayerDurationNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is CityLoaded) {
          _city = state.city;
          initPrayerTimes(_city);
        }
      },
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              opacity: .06,
              image: AssetImage(Assets.assetsImagesPngMosqueIstanbul),
              fit: BoxFit.cover,
            ),
          ),
          width: double.infinity,
          child: Column(
            children: [
              ValueListenableBuilder<Duration>(
                valueListenable: _nextPrayerDurationNotifier,
                builder: (context, value, child) => CircularSlider(
                  totalDuration: _totalDuration,
                  nextPrayerDuration: _nextPrayerDuration,
                  nextPrayer: _nextPrayer,
                ),
              ),
              PrayersTimeRow(
                prayerTimes: _prayerTimes,
                nextPrayer: _nextPrayer,
              ),
              const SizedBox(height: 15),
            ],
          ),
        );
      },
    );
  }

  void initPrayerTimes(City city) {
    final myCoordinates = Coordinates(
      city.lat,
      city.lng,
    );
    final params = CalculationMethod.egyptian.getParameters();
    params.madhab = Madhab.shafi;
    _prayerTimes = PrayerTimes.today(myCoordinates, params);
    if (_prayerTimes.nextPrayer() == Prayer.none) {
      final tomorrow = DateTime.now().add(const Duration(days: 1));
      _prayerTimes = PrayerTimes(
        myCoordinates,
        DateComponents(tomorrow.year, tomorrow.month, tomorrow.day),
        params,
      );
    }

    _calculateNextPrayer(_prayerTimes);
  }

  void _calculateNextPrayer(PrayerTimes prayerTimes) {
    setState(() {
      _nextPrayer = prayerTimes.nextPrayer();
    });
    _nextPrayerTime = prayerTimes.timeForPrayer(_nextPrayer)!;
    _calcTotalDuration(prayerTimes, _nextPrayer);
    startTimer(prayerTimes);
  }

  void _calcTotalDuration(PrayerTimes prayerTimes, Prayer nextprayer) {
    final previousPrayers = {
      Prayer.sunrise: prayerTimes.fajr,
      Prayer.dhuhr: prayerTimes.sunrise,
      Prayer.asr: prayerTimes.dhuhr,
      Prayer.maghrib: prayerTimes.asr,
      Prayer.isha: prayerTimes.maghrib,
      Prayer.fajr: prayerTimes.isha.subtract(const Duration(days: 1)),
    };
    _totalDuration = _nextPrayerTime
        .difference(previousPrayers[nextprayer]!)
        .inSeconds
        .toDouble();
  }

  void _updateRemainigTime(PrayerTimes prayerTimes) {
    if (prayerTimes.nextPrayer() != _nextPrayer) {
      timer?.cancel();
      initPrayerTimes(_city);
      return;
    }
    _nextPrayerDuration = _nextPrayerTime.difference(DateTime.now());
    _nextPrayerDurationNotifier.value = _nextPrayerDuration;
  }

  void startTimer(PrayerTimes prayerTimes) {
    timer?.cancel();
    _updateRemainigTime(prayerTimes);
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateRemainigTime(prayerTimes);
    });
  }
}
