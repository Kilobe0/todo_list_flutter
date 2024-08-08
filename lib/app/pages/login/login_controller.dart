import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list_flutter/app/controllers/user_tasks_controller.dart';
import 'package:todo_list_flutter/app/core/shared_keys.dart';
import 'package:todo_list_flutter/app/controllers/user_controller.dart';
import 'package:todo_list_flutter/app/models/task_model.dart';
import 'package:todo_list_flutter/app/models/user_model.dart';
import 'package:todo_list_flutter/app/services/shared_service.dart';
import 'package:todo_list_flutter/app/services/supabase_service.dart';

import '../../widgets/message_widgets.dart';

class LoginController {
  static final LoginController instance = LoginController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UserModel? _user;

  ValueNotifier<bool> showForgotPassword = ValueNotifier(false);

  void clearControllers() {
    emailController.clear();
    passwordController.clear();
  }

  Future<void> initUserData() async {
    try {
      UserController.instance.userLogged = _user;
      List<Map<String, dynamic>> tasksListMap =
          await SupabaseService.instance.getUserTasks(_user!.id);
      UserTasksController.instance.tasks =
          tasksListMap.map((e) => TaskModel.fromMap(e)).toList();
      await SharedService.instance.prefs
          .setString(SharedKeys.userCredentials, _user!.toJson());
    } catch (e) {
      rethrow;
    }
  }

  bool validateFields() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> userExists() async {
    UserModel? user;
    try {
      user =
          await SupabaseService.instance.getUserByEmail(emailController.text);
    } catch (e) {
      rethrow;
    }
    if (user == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> getUser() async {
    _user = await SupabaseService.instance.getUserByEmail(emailController.text);
  }

  Future<void> login(BuildContext context) async {
    showLoadingDialog(context);
    if (!validateFields()) {
      context.mounted ? Navigator.pop(context) : null;
      showSnackBarError(context, 'Preencha todos os campos');
      return;
    } else {
      if (await userExists() == false) {
        context.mounted ? Navigator.pop(context) : null;
        context.mounted
            ? showSnackBarError(context, 'Email ou senha inválido')
            : null;
        return;
      } else {
        await getUser();
        if (_user!.password != passwordController.text) {
          context.mounted ? Navigator.pop(context) : null;
          context.mounted
              ? showSnackBarError(context, 'Email ou senha inválido')
              : null;
          showForgotPassword.value = true;
          return;
        } else {
          try {
            await initUserData();
          } catch (e) {
            print(e);
          }
          context.mounted ? Navigator.pop(context) : null;
          context.mounted
              ? Navigator.of(context).pushReplacementNamed('/home')
              : null;
        }
      }
    }
  }
}
