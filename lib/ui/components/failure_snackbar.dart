import 'package:flutter/material.dart';

class FailureSnackBar extends SnackBar {
  FailureSnackBar._({required String message})
      : super(
          content: Text(message),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        );

  static void show(
    ScaffoldMessengerState scaffoldMessenger, {
    required String message,
  }) {
    scaffoldMessenger.showSnackBar(FailureSnackBar._(message: message));
  }
}
