import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class CustomSnackbar {
  static void show(
    BuildContext context, {
    required String title,
    required String message,
    required Color color,
    required ContentType contentType,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: AwesomeSnackbarContent(
          title: title,
          message: message,
          contentType: contentType,
          color: color,
        ),
      ),
    );
  }
}
