import 'package:flutter/material.dart';
import 'package:noor/core/widgets/decorated_container.dart';

import '../../../../generated/l10n.dart';

class QiblaTextWidget extends StatelessWidget {
  final double qibla;
  const QiblaTextWidget({super.key, required this.qibla});

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      fullWidth: false,
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            S.current.qibla,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "${qibla.toStringAsFixed(3)}°",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
