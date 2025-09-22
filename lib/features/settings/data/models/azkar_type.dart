import 'package:flutter/material.dart';
import 'package:noor/generated/l10n.dart';

enum AzkarType { morning, evening, sleeping }

extension AzkarTypeExtensions on AzkarType {
  String getAzkarName(BuildContext context) {
    switch (this) {
      case AzkarType.morning:
        return S.of(context).morning_azkar;
      case AzkarType.evening:
        return S.of(context).evening_azkar;
      case AzkarType.sleeping:
        return S.of(context).sleepingAzkar;
    }
  }

  String get name {
    switch (this) {
      case AzkarType.morning:
        return "Morning";
      case AzkarType.evening:
        return "Evening";
      case AzkarType.sleeping:
        return "Sleeping";
    }
  }
}
