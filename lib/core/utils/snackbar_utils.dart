import 'package:flutter/material.dart';

class SnackBarUtils {
  static void showSuccess(BuildContext context, {required String message}) {
    _showSnackBar(
      context,
      message: message,
      backgroundColor: Colors.pinkAccent,
    );
  }

  static void showError(BuildContext context, {required String message}) {
    _showSnackBar(context, message: message, backgroundColor: Colors.redAccent);
  }

  static void showLoading(
    BuildContext context, {
    String message = 'Loading...',
  }) {
    _showSnackBar(
      context,
      message: message,
      backgroundColor: Colors.pinkAccent,
    );
  }

  static void _showSnackBar(
    BuildContext context, {
    required String message,
    required Color backgroundColor,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: backgroundColor,
          behavior: SnackBarBehavior.floating,
        ),
      );
  }
}
