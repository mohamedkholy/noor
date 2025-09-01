import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/core/widgets/my_app_bar.dart';
import 'package:noor/features/qibla/ui/widgets/qibla_compass.dart';

import '../../../generated/l10n.dart';

class QiblaScreen extends StatefulWidget {
  const QiblaScreen({super.key});

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: S.current.qibla),
      body: SafeArea(
        child: FutureBuilder<bool?>(
          future: FlutterQiblah.androidDeviceSensorSupport(),
          builder: (_, AsyncSnapshot<bool?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: MyColors.primary),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("${S.current.error}: ${snapshot.error.toString()}"),
              );
            }
            if (snapshot.data != null) {
              return const QiblahCompass();
            } else {
              return Center(
                child: Text(
                  S.current.no_compass_sensor,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
