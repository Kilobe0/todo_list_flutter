import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/models/task_model.dart';
import 'package:todo_list_flutter/app/models/user_model.dart';

class UserController extends ChangeNotifier {
  static final UserController instance = UserController();
  UserModel? userLogged;
}