import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geolocator/geolocator.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/core/widgets/location_denied_widget.dart';
import 'package:noor/features/qibla/ui/widgets/qibla_compass_widget.dart';

class QiblahCompass extends StatefulWidget {
  const QiblahCompass({super.key});

  @override
  QiblahCompassState createState() => QiblahCompassState();
}

class QiblahCompassState extends State<QiblahCompass> {
  final _locationStreamController = StreamController<LocationStatus>();

  @override
  void initState() {
    super.initState();
    _checkLocationStatus();
  }

  @override
  void dispose() {
    _locationStreamController.close();
    FlutterQiblah().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder(
        stream: _locationStreamController.stream,
        builder: (context, AsyncSnapshot<LocationStatus> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: MyColors.primary),
            );
          }
          if (snapshot.data?.enabled == true) {
            switch (snapshot.data!.status) {
              case LocationPermission.always:
              case LocationPermission.whileInUse:
                return QiblahCompassWidget();
              case LocationPermission.deniedForever:
                return LocationDeniedWidget(
                  error: "Location service Denied Forever !",
                  openSettings: true,
                  callback: () {
                    Geolocator.openAppSettings();
                  },
                );
              case LocationPermission.denied:
                return LocationDeniedWidget(
                  error: "Location service permission denied",
                  callback: _checkLocationStatus,
                );
              default:
                return const SizedBox();
            }
          } else {
            return LocationDeniedWidget(
              error: "Please enable Location service",
              callback: _checkLocationStatus,
            );
          }
        },
      ),
    );
  }

  Future<void> _checkLocationStatus() async {
    final locationStatus = await FlutterQiblah.checkLocationStatus();
    if (locationStatus.enabled &&
        locationStatus.status == LocationPermission.denied) {
      await FlutterQiblah.requestPermissions();
      final s = await FlutterQiblah.checkLocationStatus();
      _locationStreamController.sink.add(s);
    } else {
      _locationStreamController.sink.add(locationStatus);
    }
  }
}
