import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class CustomToast {
  final BuildContext context;

  CustomToast(this.context);

  void show({
    required String message,
    ToastificationType? type,
    Color? backgroundColor,
    Color? primaryColor,
    Color? foregroundColor,
    Alignment alignment = Alignment.bottomCenter,
    Duration autoCloseDuration = const Duration(seconds: 2),
    ProgressIndicatorThemeData? progressBarTheme,
    bool closeOnClick = true,
  }) {
    Toastification().show(
      context: context,
      dragToClose: true,
      type: type ?? ToastificationType.info,
      backgroundColor: backgroundColor ?? Colors.white,
      foregroundColor: foregroundColor ?? Colors.black,
      title: Text(
        message,
        style: TextStyle(color: foregroundColor ?? Colors.black, fontSize: 16),
      ),
      primaryColor: primaryColor,
      autoCloseDuration: autoCloseDuration,
      alignment: alignment,
      progressBarTheme:
          progressBarTheme ??
          ProgressIndicatorThemeData(
            linearMinHeight: 1,
            color: foregroundColor ?? Colors.grey,
          ),
      closeOnClick: closeOnClick,
    );
  }
}
