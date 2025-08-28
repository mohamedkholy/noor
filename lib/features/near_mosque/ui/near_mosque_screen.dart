import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:noor/core/helpers/assets_helper.dart';
import 'package:noor/core/widgets/my_app_bar.dart';
import 'package:noor/features/near_mosque/data/models/mosque_data.dart';
import 'package:noor/features/near_mosque/logic/near_mosque_cubit.dart';
import 'package:noor/features/near_mosque/logic/near_mosque_state.dart';
import 'package:noor/features/near_mosque/ui/widgets/collapesd_error_widget.dart';
import 'package:noor/features/near_mosque/ui/widgets/current_location_button.dart';
import 'package:noor/features/near_mosque/ui/widgets/error_state_widget.dart';
import 'package:noor/features/near_mosque/ui/widgets/expand_button.dart';
import 'package:noor/features/near_mosque/ui/widgets/nearby_mosques_widget.dart';

class NearMosqueScreen extends StatefulWidget {
  const NearMosqueScreen({super.key});

  @override
  State<NearMosqueScreen> createState() => _NearMosqueScreenState();
}

class _NearMosqueScreenState extends State<NearMosqueScreen> {
  late final NearMosqueCubit _nearMosqueCubit = context.read();
  ValueNotifier<bool> isNerbayMosquesExpanded = ValueNotifier<bool>(false);
  ValueNotifier<bool> isLocationDeniedExpanded = ValueNotifier<bool>(true);
  LatLng? currentLocation;
  MosqueData? mosqueData;
  late BitmapDescriptor mosqueIcon;
  late BitmapDescriptor currentLocationIcon;
  List<MosqueData> mosques = [];
  final Set<Marker> markers = {};
  final Set<Polyline> polylines = {};
  GoogleMapController? mapController;

  @override
  void initState() {
    super.initState();
    initIcons();
  }

  @override
  void dispose() {
    super.dispose();
    isNerbayMosquesExpanded.dispose();
    isLocationDeniedExpanded.dispose();
    mapController?.dispose();
  }

  void initIcons() async {
    mosqueIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(35, 35)),
      Assets.assetsImagesPngCurrentMosque,
    );
    currentLocationIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(25, 25)),
      Assets.assetsImagesPngCurrentLocation,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MediaQuery.sizeOf(context).height > 700
          ? const MyAppBar(title: 'Near Mosque')
          : null,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            BlocConsumer<NearMosqueCubit, NearMosqueState>(
              listener: (context, state) {
                if (state is NearMosquesLoaded) {
                  isNerbayMosquesExpanded.value = true;
                }
              },
              builder: (context, state) {
                if (state is NearMosquesLoaded) {
                  mosques = state.mosques;
                  currentLocation = state.currelocation;
                  polylines.clear();
                  markers.clear();
                  animateCameraToCurrentLocation();
                }
                if (state is UnselectMosque) {
                  polylines.clear();
                  markers.clear();
                  animateCameraToCurrentLocation();
                }
                if (currentLocation != null) {
                  markers.add(
                    Marker(
                      markerId: const MarkerId("current_location"),
                      position: currentLocation!,
                      infoWindow: const InfoWindow(title: "Current Location"),
                      icon: currentLocationIcon,
                    ),
                  );
                }
                if (state is MosqueSelected) {
                  mosqueData = state.mosque;
                  markers.add(
                    Marker(
                      markerId: MarkerId(mosqueData!.name),
                      position: mosqueData!.location,
                      icon: mosqueIcon,
                    ),
                  );
                  polylines.add(
                    Polyline(
                      polylineId: PolylineId(mosqueData!.name),
                      points: mosqueData!.route,
                      color: Colors.blueAccent,
                      width: 4,
                    ),
                  );
                  final bounds = getBounds();
                  mapController?.animateCamera(
                    CameraUpdate.newLatLngBounds(bounds, 15),
                  );
                }
                return GoogleMap(
                  onMapCreated: (controller) {
                    mapController = controller;
                    _nearMosqueCubit.initMap();
                  },
                  initialCameraPosition: CameraPosition(
                    target: currentLocation ?? const LatLng(0, 0),
                    zoom: currentLocation != null ? 14 : 0,
                  ),
                  markers: markers,
                  polylines: polylines,
                  zoomControlsEnabled: false,
                );
              },
            ),
            BlocBuilder<NearMosqueCubit, NearMosqueState>(
              buildWhen: (previous, current) =>
                  current is! MosqueSelected && current is! UnselectMosque,
              builder: (context, state) {
                if (state is NearMosqueErrorState) {
                  return ValueListenableBuilder(
                    valueListenable: isLocationDeniedExpanded,
                    builder: (context, value, child) {
                      return value
                          ? ErrorStateWidget(
                              errorMessage: state.message,
                              onArrowClick: () {
                                isLocationDeniedExpanded.value =
                                    !isLocationDeniedExpanded.value;
                              },
                              callback: () {
                                _nearMosqueCubit.checkLocationStatus(
                                  currentLocation,
                                );
                              },
                              errorType: state.errorType,
                              openSettings: state.openSettings,
                            )
                          : CollapesdErrorWidget(
                              isLocationDeniedExpanded:
                                  isLocationDeniedExpanded,
                              errorType: state.errorType,
                              message: state.message,
                            );
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: BlocBuilder<NearMosqueCubit, NearMosqueState>(
                      buildWhen: (previous, current) =>
                          (current is NearMosqueLoading ||
                          (current is! MosqueSelected &&
                              current is! UnselectMosque)),
                      builder: (context, state) {
                        return InkWell(
                          onTap: state is NearMosqueLoading
                              ? null
                              : () {
                                  animateCameraToCurrentLocation();
                                },
                          child: CurrentLocationButton(
                            isLoading: state is NearMosqueLoading,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  ValueListenableBuilder(
                    valueListenable: isNerbayMosquesExpanded,
                    builder: (context, value, child) {
                      return value == true
                          ? BlocBuilder<NearMosqueCubit, NearMosqueState>(
                              buildWhen: (previous, current) =>
                                  current is NearMosquesLoaded,
                              builder: (context, state) {
                                return NearbyMosquesWidget(
                                  mosques: mosques,
                                  onArrowClick: () {
                                    isNerbayMosquesExpanded.value =
                                        !isNerbayMosquesExpanded.value;
                                  },
                                );
                              },
                            )
                          : Align(
                              alignment: Alignment.bottomRight,
                              child: ExpandButton(
                                arrowUp: true,
                                margin: const EdgeInsets.only(
                                  right: 5,
                                  bottom: 10,
                                ),
                                padding: const EdgeInsets.all(4),
                                onArrowClick: () {
                                  isNerbayMosquesExpanded.value =
                                      !isNerbayMosquesExpanded.value;
                                },
                              ),
                            );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void animateCameraToCurrentLocation() {
    mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: currentLocation!, zoom: 16),
      ),
    );
  }

  LatLngBounds getBounds() {
    final double minLat = min(
      mosqueData!.location.latitude,
      currentLocation!.latitude,
    );
    final double maxLat = max(
      mosqueData!.location.latitude,
      currentLocation!.latitude,
    );
    final double minLng = min(
      mosqueData!.location.longitude,
      currentLocation!.longitude,
    );
    final double maxLng = max(
      mosqueData!.location.longitude,
      currentLocation!.longitude,
    );

    const buffer = 0.009;
    final southwest = LatLng(minLat - buffer, minLng - buffer);
    final northeast = LatLng(maxLat + buffer, maxLng + buffer);

    return LatLngBounds(southwest: southwest, northeast: northeast);
  }
}
