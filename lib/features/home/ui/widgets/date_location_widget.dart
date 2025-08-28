import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:noor/core/database/cities/cities_database.dart';
import 'package:noor/core/routing/my_routes.dart';
import 'package:noor/features/home/logic/home_cubit.dart';
import 'package:noor/features/home/logic/home_state.dart';

class DateLocationWidget extends StatefulWidget {
  const DateLocationWidget({super.key});

  @override
  State<DateLocationWidget> createState() => _DateLocationWidgetState();
}

class _DateLocationWidgetState extends State<DateLocationWidget> {
  late final HomeCubit _homeCubit = context.read();
  late City _city;

  @override
  void initState() {
    _city =
        _homeCubit.getSavedCity() ??
        const City(name: "Makkah", lat: 21.42664, lng: 39.82563, country: "SA");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MyRoutes.location).then((value) {
          _city = value as City;
          _homeCubit.setCity(_city);
        });
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) => current is CityLoaded,
        builder: (context, state) {
          if (state is CityLoaded) {
            _city = state.city;
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(HijriCalendar.now().toFormat("dd MMMM yyyy")),
              Text(_city.name),
            ],
          );
        },
      ),
    );
  }
}
