import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/core/shared_keys.dart';
import 'package:todo_list_flutter/app/pages/login/login_page.dart';
import 'package:todo_list_flutter/app/services/shared_service.dart';
import 'package:todo_list_flutter/app/services/supabase_service.dart';
import 'package:todo_list_flutter/app/widgets/message_widgets.dart';

class CreateNewPasswordController {
  static final CreateNewPasswordController instance =
      CreateNewPasswordController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isPasswordValid() {
    return passwordController.text.trim().length >= 6;
  }

  Future<void> createNewPassword(BuildContext context) async {
    if (isPasswordValid()) {
      if (passwordController.text == confirmPasswordController.text) {
        await SupabaseService.instance.updateUserPassword(
          SharedService.instance.prefs
              .getString(SharedKeys.emailCodeAssociated)!,
          passwordController.text,
        );
        await SharedService.instance.prefs.remove(SharedKeys.temporaryCode);
        await SharedService.instance.prefs.remove(SharedKeys.emailCodeAssociated);
        context.mounted
            ? Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              )
            : null;
      } else {
        context.mounted
            ? showSnackBarError(context, 'As senhas devem ser iguais')
            : null;
      }
    } else {
      context.mounted
          ? showSnackBarError(context, 'A senha deve ter pelo menos 6 digitos')
          : null;
    }
  }
}
