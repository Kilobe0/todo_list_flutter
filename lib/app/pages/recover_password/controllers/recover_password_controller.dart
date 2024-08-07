import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_list_flutter/app/core/shared_keys.dart';
import 'package:todo_list_flutter/app/models/user_model.dart';
import 'package:todo_list_flutter/app/pages/recover_password/pages/code_page.dart';
import 'package:todo_list_flutter/app/services/send_email_service.dart';
import 'dart:math';

import 'package:todo_list_flutter/app/services/shared_service.dart';
import 'package:todo_list_flutter/app/services/supabase_service.dart';
import 'package:todo_list_flutter/app/widgets/snackbar_message.dart';

class RecoverPasswordController {
  static final RecoverPasswordController instance = RecoverPasswordController();
  TextEditingController emailController = TextEditingController();
  ValueNotifier<int> timeToExpireCode = ValueNotifier(60);

  Future<void> sendCode(BuildContext context) async {
    bool firstValidation = await emailIsRegistered();
    bool secondValidation = isEmailValid();
    if (!firstValidation || !secondValidation) {
      context.mounted
          ? showSnackBarError(context, 'Email inválido ou não cadastrado')
          : null;
      return;
    } else {
      await generateAndKeepCode();
      await SendEmailService.sendCode(
          email: emailController.text,
          code: SharedService.instance.prefs
              .getString(SharedKeys.temporaryCode)!);

      context.mounted
          ? Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CodePage(),
              ),
            )
          : null;
    }
  }

  Future<bool> emailIsRegistered() async {
    UserModel? user =
        await SupabaseService.instance.getUserByEmail(emailController.text);
    return user != null;
  }

  Future<void> generateAndKeepCode() async {
    Random random = Random();
    int randomNumber = random.nextInt(90000);
    await SharedService.instance.prefs
        .setString(SharedKeys.temporaryCode, randomNumber.toString());
    await SharedService.instance.prefs
        .setString(SharedKeys.emailCodeAssociated, emailController.text);
    // Manter o código valido por 60 segundos
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      timeToExpireCode.value--;
      if (timeToExpireCode.value == 0) {
        timeToExpireCode.value = 60;
        await SharedService.instance.prefs.remove(SharedKeys.temporaryCode);
        timer.cancel();
      }
    });
  }

  bool isEmailValid() {
    return EmailValidator.validate(emailController.text);
  }
}
