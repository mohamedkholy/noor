import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:noor/core/database/cities/cities_database.dart';
import 'package:noor/core/helpers/constants.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';
import 'package:noor/core/helpers/language_converter.dart';
import 'package:noor/core/routing/my_routes.dart';
import 'package:noor/features/navigation/logic/navigation_cubit.dart';
import 'package:noor/features/navigation/logic/navigation_state.dart';

class DateLocationWidget extends StatefulWidget {
  const DateLocationWidget({super.key});

  @override
  State<DateLocationWidget> createState() => _DateLocationWidgetState();
}

class _DateLocationWidgetState extends State<DateLocationWidget> {
  late final NavigationCubit _navigationCubit = context.read();
  late City _city;

  @override
  void initState() {
    _city = _navigationCubit.getSavedCity() ?? Constants.defaultCity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MyRoutes.location).then((value) {
          if (value != null) {
            _city = value as City;
            _navigationCubit.setCity(_city);
          }
        });
      },
      child: BlocBuilder<NavigationCubit, NavigationState>(
        buildWhen: (previous, current) => current is CityLoaded,
        builder: (context, state) {
          if (state is CityLoaded) {
            _city = state.city;
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                HijriCalendar.now().toFormat("dd MMMM yyyy"),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
              Text(
                LanguageConverter.cityDisplayName(
                  city: _city,
                  lang: Localizations.localeOf(context).languageCode,
                ),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
