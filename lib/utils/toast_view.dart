import 'package:flutter/material.dart';

import '../main.dart';
import '../utils/colors.dart';

enum ToastStyle { success, error, warning, normal }

class ToastMessage {

  static void show(String message, ToastStyle style) {
    Color bgColor = Colors.greenAccent;
    Color textColor = Colors.white;
    if (style == ToastStyle.success) {
      bgColor = CustomColor.primaryColor;
    } else if (style == ToastStyle.warning) {
      bgColor = Colors.orangeAccent;
    } else if (style == ToastStyle.error) {
      bgColor = Colors.redAccent;
    } else {
      bgColor = Colors.black;
    }
    snackbarKey.currentState?.showSnackBar(
      SnackBar(
          backgroundColor: bgColor,
          content: Text(
              message)),

    );
  }
}

void showErrorToast(String text) {
  ToastMessage.show(text, ToastStyle.error);
}

void showSuccessToast(String text, ) {
  ToastMessage.show(text, ToastStyle.success);
}
