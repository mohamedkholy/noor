import 'dart:io';

import 'package:flutter/services.dart';

abstract class SilentModeHelper {
  static const MethodChannel _channel = MethodChannel('noor/silent_mode');

  static Future<bool> isDndPermissionGranted() async {
    if (!Platform.isAndroid) return false;
    final result = await _channel.invokeMethod<bool>('isDndPermissionGranted');
    return result ?? false;
  }

  static Future<void> openDndSettings() async {
    if (!Platform.isAndroid) return;
    await _channel.invokeMethod<void>('openDndSettings');
  }

  static Future<void> scheduleSilentWindows(
    List<(DateTime, DateTime)> windows,
  ) async {
    if (!Platform.isAndroid) return;
    await _channel.invokeMethod<void>('scheduleSilentWindows', {
      'windows': windows
          .map(
            (window) => {
              'start': window.$1.millisecondsSinceEpoch,
              'end': window.$2.millisecondsSinceEpoch,
            },
          )
          .toList(),
    });
  }

  static Future<void> cancelSilentWindows() async {
    if (!Platform.isAndroid) return;
    await _channel.invokeMethod<void>('cancelSilentWindows');
  }
}
