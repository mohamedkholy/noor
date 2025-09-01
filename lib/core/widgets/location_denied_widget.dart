import 'package:flutter/material.dart';
import 'package:noor/core/theming/my_colors.dart';

import '../../generated/l10n.dart';

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
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Icon(Icons.location_off, size: 100, color: MyColors.errorColor),
          const SizedBox(height: 20),
          Text(
            error!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: MyColors.errorColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: callback,
            icon: Icon(openSettings == true ? Icons.settings : Icons.refresh),
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.primary,
              foregroundColor: Colors.white,
            ),
            label: Text(
              openSettings == true ? S.current.open_settings : S.current.retry,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
