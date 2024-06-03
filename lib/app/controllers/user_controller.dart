import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/controllers/user_tasks.controller.dart';
import 'package:todo_list_flutter/app/core/shared_keys.dart';
import 'package:todo_list_flutter/app/models/task_model.dart';
import 'package:todo_list_flutter/app/models/user_model.dart';
import 'package:todo_list_flutter/app/services/shared_service.dart';
import 'package:todo_list_flutter/app/services/supabase_service.dart';

class UserController extends ChangeNotifier {
  static final UserController instance = UserController();
  UserModel? userLogged;

  Future<void> init() async {
    var userMap = SharedService.instance.prefs.getString(SharedKeys.userCredentials);
  UserController.instance.userLogged =
      userMap != null ? UserModel.fromJson(userMap) : null;
  if (UserController.instance.userLogged != null) {
    List<Map<String, dynamic>> tasksListMap = await SupabaseService.instance
        .getUserTasks(UserController.instance.userLogged!.id);
    UserTasksController.instance.tasks =
        tasksListMap.map((e) => TaskModel.fromMap(e)).toList();
  }
  }
}