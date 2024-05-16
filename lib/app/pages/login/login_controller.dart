import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_flutter/app/controllers/user_tasks.controller.dart';
import 'package:todo_list_flutter/app/core/shared_keys.dart';
import 'package:todo_list_flutter/app/controllers/user_controller.dart';
import 'package:todo_list_flutter/app/models/task_model.dart';
import 'package:todo_list_flutter/app/models/user_model.dart';
import 'package:todo_list_flutter/app/services/shared_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:todo_list_flutter/app/services/supabase_service.dart';
import 'package:uuid/uuid.dart';

import '../../widgets/snackbar_message.dart';

class LoginController {
  static final LoginController instance = LoginController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void clearControllers() {
    emailController.clear();
    passwordController.clear();
  }

  Future<void> login(BuildContext context) async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      showSnackBarError(context, 'Preencha todos os campos');
      return;
    } else {
      UserModel? user =
          await SupabaseService.instance.getUserByEmail(emailController.text);
      if (user == null) {
        context.mounted
            ? showSnackBarError(context, 'Email ou senha inválido')
            : null;
        return;
      } else {
        if (user.password != passwordController.text) {
          context.mounted
              ? showSnackBarError(context, 'Email ou senha inválido')
              : null;
          return;
        } else {
          UserController.instance.userLogged = user;
          List<Map<String, dynamic>> tasksListMap = await SupabaseService.instance.getUserTasks(user.id);
          UserTasksController.instance.tasks = tasksListMap.map((e) => TaskModel.fromMap(e)).toList();
          var prefs = await SharedPreferences.getInstance();
          prefs.setString(SharedKeys.instance.userCredentials, user.toJson());
          context.mounted
              ? Navigator.of(context).pushReplacementNamed('/home')
              : null;
        }
      }
    }
  }
}
