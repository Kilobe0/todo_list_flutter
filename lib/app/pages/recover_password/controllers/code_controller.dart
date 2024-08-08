import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/core/shared_keys.dart';
import 'package:todo_list_flutter/app/pages/recover_password/pages/create_new_password_page.dart';
import 'package:todo_list_flutter/app/services/shared_service.dart';
import 'package:todo_list_flutter/app/widgets/message_widgets.dart';

class CodeController {
  static final CodeController instance = CodeController();
  TextEditingController codeController = TextEditingController();


  void goToCreateNewPasswordPage(BuildContext context) {
    if (isCodeValid()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CreateNewPasswordPage(),
        ),
      );
    } else {
      showSnackBarError(context, 'Código inválido');
    }
  }

  bool isCodeValid() {
    return SharedService.instance.prefs.getString(SharedKeys.temporaryCode) ==
        codeController.text;
  }
}
