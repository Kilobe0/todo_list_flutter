import 'package:flutter/material.dart';
showLoadingDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => const SizedBox(
      height: 80,
      width: 80,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    ),
  );
}