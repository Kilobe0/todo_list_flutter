import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list_flutter/app/core/shared_keys.dart';
import 'package:todo_list_flutter/app/services/send_email_service.dart';
import 'dart:math';

import 'package:todo_list_flutter/app/services/shared_service.dart';

class RecoverPasswordController {
  static final RecoverPasswordController instance = RecoverPasswordController();
  TextEditingController emailController = TextEditingController();
  ValueNotifier< int> timeToExpireCode = ValueNotifier(60);

  Future<void> sendCode(BuildContext context) async {
    if (!isEmailValid()) {
      showSnackBarError(context, 'Email inválido');
      return;
    } else {
      await generateAndKeepCode();
      SendEmailService.sendCode(email: emailController.text, code: SharedService.instance.prefs.getString(SharedKeys.temporaryCode)!);

    }
  }

  Future<void> generateAndKeepCode() async {
    Random random = Random();
    int randomNumber = random.nextInt(90000);
    SharedService.instance.prefs
        .setString(SharedKeys.temporaryCode, randomNumber.toString());
    SharedService.instance.prefs
        .setString(SharedKeys.emailCodeAssociated, emailController.text);
    // Manter o código valido por 60 segundos
    Timer.periodic(const Duration(seconds: 60), (timer) {
      timeToExpireCode.value--;
      if (timeToExpireCode.value == 0) {
        timeToExpireCode.value = 60;
        SharedService.instance.prefs.remove(SharedKeys.temporaryCode);
        SharedService.instance.prefs.remove(SharedKeys.emailCodeAssociated);
        timer.cancel();
      }
    });
  }

  bool isEmailValid() {
    return EmailValidator.validate(emailController.text);
  }
}

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
