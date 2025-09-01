import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:noor/core/database/cities/cities_database.dart';
import 'package:noor/core/helpers/assets_helper.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/core/theming/my_text_styles.dart';
import 'package:noor/features/location/logic/location_cubit.dart';
import 'package:noor/features/location/logic/location_state.dart';
import 'package:noor/generated/l10n.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CurrentLocationWidget extends StatefulWidget {
  final City city;
  const CurrentLocationWidget({super.key, required this.city});

  @override
  State<CurrentLocationWidget> createState() => _CurrentLocationWidgetState();
}

class _CurrentLocationWidgetState extends State<CurrentLocationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: MyColors.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).current_location,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.location_on, color: MyColors.primary),
                    const SizedBox(width: 5),
                    Text(
                      widget.city.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeightHelper.medium,
                      ),
                    ),
                  ],
                ),
              ),
              BlocConsumer<LocationCubit, LocationState>(
                listener: (context, state) {
                  if (state is RelocatingErrorState) {
                    showDenialDialog(state);
                  } else if (state is RelocatingSuccessState) {
                    Navigator.pop(context, state.city);
                  }
                },
                builder: (context, state) {
                  final isLoading = state is RelocatingState;
                  return InkWell(
                    onTap: () {
                      context.read<LocationCubit>().getUserLocation();
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 3,
                                ),
                              )
                            : Text(
                                S.of(context).Relocate,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> showDenialDialog(RelocatingErrorState state) async {
    Alert(
      context: context,
      image: SvgPicture.asset(Assets.assetsImagesSvgMap, height: 100),
      title: S.of(context).location,
      desc: state.message,
      style: AlertStyle(
        titleStyle: MyTextStyles.font20PrimarySemiBold,
        descStyle: MyTextStyles.font15greyRegular,
      ),
      buttons: [
        DialogButton(
          color: MyColors.primary,
          child: Text(
            state.openSettings
                ? S.of(context).open_settings
                : S.of(context).ask_again,
            style: MyTextStyles.font15whiteRegular,
          ),
          onPressed: () async {
            Navigator.of(context).pop();
            if (state.openSettings) {
              Geolocator.openAppSettings();
            } else {
              context.read<LocationCubit>().getUserLocation();
            }
          },
        ),
      ],
    ).show();
  }
}
