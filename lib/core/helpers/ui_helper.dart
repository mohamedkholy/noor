import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class UiHelper {
  static void showToast({required String text, required ToastStates state}) =>
      Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 7,
        backgroundColor: toastColor(state),
        textColor: state == ToastStates.warning ? Colors.black : Colors.white,
        fontSize: 16,
      );

  static Color toastColor(ToastStates state) {
    switch (state) {
      case ToastStates.success:
        return Colors.green;

      case ToastStates.error:
        return Colors.red;

      case ToastStates.warning:
        return Colors.grey.shade400;
    }
  }
}

enum ToastStates { success, error, warning }
