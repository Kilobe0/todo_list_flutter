import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/controllers/user_controller.dart';
import 'package:todo_list_flutter/app/core/shared_keys.dart';
import 'package:todo_list_flutter/app/models/user_model.dart';
import 'package:todo_list_flutter/app/services/shared_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:todo_list_flutter/app/services/supabase_service.dart';
import 'package:todo_list_flutter/app/widgets/snackbar_message.dart';
import 'package:uuid/uuid.dart';

const String kFillAllFieldsError = 'Preencha todos os campos';
const String kInvalidEmailError = 'Email inválido';
const String kEmailAlreadyRegisteredError = 'Email já cadastrado';
const String kPasswordsMustMatchError = 'As senhas devem ser iguais';
const String kPasswordMinLengthError =
    'A senha deve ter pelo menos 6 caracteres';

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

  Future<void> registerUser(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    String erroMensage;
    bool isValid;
    (erroMensage, isValid) = await validarCampos();
    if (!isValid) {
      Navigator.of(context).pop();
      showSnackBarError(context, erroMensage);
      return;
    }

    UserModel user = UserModel(
      id: const Uuid().v4(),
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    UserController.instance.userLogged = user;
    await SharedService.instance.prefs
        .setString(SharedKeys.userCredentials, user.toJson());
    await SupabaseService.instance.userRegister(user);
    context.mounted
        ? Navigator.of(context).pushReplacementNamed('/home')
        : null;
  }

  //criar uma função com retorno duplo
  Future<(String, bool)> validarCampos() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      return (kFillAllFieldsError, false);
    } else if (!EmailValidator.validate(emailController.text)) {
      return ('Email inválido', false);
    } else {
      UserModel? user =
          await SupabaseService.instance.getUserByEmail(emailController.text);
      if (user != null) {
        return (kEmailAlreadyRegisteredError, false);
      }
    }
    if (passwordController.text != confirmPasswordController.text) {
      return (kPasswordsMustMatchError, false);
    } else if (passwordController.text.trim().length < 6) {
      return (kPasswordMinLengthError, false);
    }
    return ('', true);
  }
}
