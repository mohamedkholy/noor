import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/core/database/cities/cities_database.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/core/widgets/search_app_bar.dart';
import 'package:noor/features/location/logic/location_cubit.dart';
import 'package:noor/features/location/logic/location_state.dart';
import 'package:noor/features/location/ui/widgets/current_location_widget.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late final LocationCubit _locationCubit = context.read();
  List<City> _cities = [];
  int _page = 0;
  late City _city;
  String? _query;

  @override
  void initState() {
    _locationCubit.getCities(_page);
    _city =
        _locationCubit.getSavedCity() ??
        const City(name: "Makkah", lat: 21.42664, lng: 39.82563, country: "SA");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        title: "Cities",
        onstartSearch: (isSearching) {
          _page = 0;
          _query = "";
          if (!isSearching) {
            Future.delayed(const Duration(milliseconds: 100), () {
              _locationCubit.getCities(_page);
            });
          }
        },
        onSearch: (value) {
          setState(() {
            _query = value;
          });
          _page = 0;
          _locationCubit.getCities(_page, value);
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            CurrentLocationWidget(city: _city),
            Expanded(
              child: BlocBuilder<LocationCubit, LocationState>(
                builder: (context, state) {
                  if (state is LocationStateLoading) {
                    return const Center(
                      child: CircularProgressIndicator(color: MyColors.primary),
                    );
                  } else if (state is CitiesLoadedState) {
                    _cities = state.cities;
                  }
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.builder(
                      itemCount: _cities.length,
                      itemBuilder: (context, index) {
                        if (index == _cities.length - 5) {
                          _locationCubit.getCities(++_page, _query);
                        }
                        return InkWell(
                          onTap: () async {
                            await _locationCubit.saveCity(_cities[index]);
                            if (context.mounted) {
                              Navigator.pop(context, _cities[index]);
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                              top: index == 0 ? 15 : 0,
                              bottom: index == _cities.length - 1 ? 15 : 0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${_cities[index].name} (${_cities[index].country})",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeightHelper.medium,
                                      ),
                                    ),
                                    if (_cities[index] == _city)
                                      const Icon(
                                        Icons.check,
                                        size: 20,
                                        color: MyColors.primary,
                                      ),
                                  ],
                                ),
                                const Divider(height: 20),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
