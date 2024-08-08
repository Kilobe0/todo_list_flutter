import 'package:flutter/material.dart';

void showSnackBarError(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.red,
    ),
  );
}

void showSnackBarSuccess(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 1),
      backgroundColor: Color(0xFF4F378B),
    ),
  );
}

showLoadingDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => const SizedBox(
      height: 80,
      width: 80,
      child: Center(
        child: CircularProgressIndicator(
          color: Color(0xFF4F378B),
        ),
      ),
    ),
  );
}
