import 'package:flutter/material.dart';
import 'package:noor/generated/l10n.dart';

enum AzkarType { morning, evening }

extension AzkarTypeExtensions on AzkarType {
  String getAzkarName(BuildContext context) {
    switch (this) {
      case AzkarType.morning:
        return S.of(context).morning_azkar;
      case AzkarType.evening:
        return S.of(context).evening_azkar;
    }
  }

  String get name {
    switch (this) {
      case AzkarType.morning:
        return "Morning";
      case AzkarType.evening:
        return "Evening";
    }
  }
}
