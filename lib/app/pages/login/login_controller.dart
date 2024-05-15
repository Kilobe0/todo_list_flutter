import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list_flutter/app/core/shared_keys.dart';
import 'package:todo_list_flutter/app/models/user_model.dart';
import 'package:todo_list_flutter/app/services/shared_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:uuid/uuid.dart';

class LoginController {
  static final LoginController instance = LoginController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void clearControllers() {
    emailController.clear();
    passwordController.clear();
  }

  void login() {}
}
