import 'package:flutter/material.dart';
import 'package:noor/core/theming/my_colors.dart';

class LocationDeniedWidget extends StatelessWidget {
  final String? error;
  final void Function()? callback;
  final bool? openSettings;
  const LocationDeniedWidget({
    super.key,
    this.error,
    this.callback,
    this.openSettings,
  });

  @override
  Widget build(BuildContext context) {
    const box = SizedBox(height: 32);
    const errorColor = Color(0xffb00020);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Icon(Icons.location_off, size: 150, color: errorColor),
          box,
          Text(
            error!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: errorColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          box,
          ElevatedButton.icon(
            onPressed: callback,
            icon: Icon(openSettings == true ? Icons.settings : Icons.refresh),
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.primary,
              foregroundColor: Colors.white,
            ),
            label: Text(
              openSettings == true ? "Open Settings" : "Retry",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
