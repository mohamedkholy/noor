import 'package:flutter/material.dart';
import 'package:noor/core/helpers/font_weight_helper.dart';

abstract class MyTextStyles {
  static const TextStyle appBarTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  static const fontAmiriBold = TextStyle(
    fontFamily: "Amiri",
    fontWeight: FontWeight.bold,
  );

  static const font15RegularGrey = TextStyle(
    fontSize: 15,
    fontWeight: FontWeightHelper.regular,
    color: Colors.grey,
  );
}
