import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/core/shared_keys.dart';
import 'package:todo_list_flutter/app/models/user_model.dart';
import 'package:todo_list_flutter/app/services/shared_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:todo_list_flutter/app/widgets/snackbar_message.dart';
import 'package:uuid/uuid.dart';

class RegisterController {
  static final RegisterController instance = RegisterController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void clearControllers() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  void registerUser(BuildContext context) async {
    String erroMensage;
    bool isValid;
    (erroMensage, isValid) = validarCampos();
    if (!isValid) {
      showSnackBarError(context, erroMensage);
      return;
    }

    UserModel user = UserModel(
      id: const Uuid().v4(),
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    await SharedService.instance.setValue(key: SharedKeys.instance.userCredentials, value: user.toMap());
  }

  //criar uma função com retorno duplo
  (String, bool) validarCampos() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      return ('Preencha todos os campos', false);
    } else if (!EmailValidator.validate(emailController.text)) {
      return ('Email inválido', false);
    } else if (passwordController.text != confirmPasswordController.text) {
      return ('As senhas devem ser iguais', false);
    } else if (passwordController.text.trim().length < 6) {
      return ('A senha deve ter pelo menos 6 caracteres', false);
    }
    return ('', true);
  }
}
