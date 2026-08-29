import 'dart:io';

import 'package:flutter/material.dart';
import 'package:noor/core/helpers/silent_mode_helper.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/generated/l10n.dart';

Future<void> showBatteryOptimizationDialog(BuildContext context) async {
  if (!Platform.isAndroid) return;

  final isIgnored = await SilentModeHelper.isBatteryOptimizationIgnored();
  if (isIgnored) return;

  if (!context.mounted) return;

  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            const Icon(Icons.battery_alert, color: MyColors.primary, size: 28),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                S.of(context).battery_optimization_title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
        content: Text(
          S.of(context).battery_optimization_message,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              S.of(context).battery_optimization_skip,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () async {
              Navigator.of(context).pop();
              await SilentModeHelper.requestBatteryOptimizationExclusion();
            },
            child: Text(
              S.of(context).battery_optimization_allow,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );
    },
  );
}
