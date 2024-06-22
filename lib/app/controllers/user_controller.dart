import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/controllers/user_tasks_controller.dart';
import 'package:todo_list_flutter/app/core/shared_keys.dart';
import 'package:todo_list_flutter/app/models/task_model.dart';
import 'package:todo_list_flutter/app/models/user_model.dart';
import 'package:todo_list_flutter/app/services/shared_service.dart';
import 'package:todo_list_flutter/app/services/supabase_service.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends ChangeNotifier {
  static final UserController instance = UserController();
  UserModel? userLogged;

  Future<void> init() async {
    var userMap =
        SharedService.instance.prefs.getString(SharedKeys.userCredentials);
    UserController.instance.userLogged =
        userMap != null ? UserModel.fromJson(userMap) : null;
    if (UserController.instance.userLogged != null) {
      List<Map<String, dynamic>> tasksListMap = await SupabaseService.instance
          .getUserTasks(UserController.instance.userLogged!.id);
      UserTasksController.instance.tasks =
          tasksListMap.map((e) => TaskModel.fromMap(e)).toList();
    }
  }

  Future<void> updateUserImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final String imageBinary = base64Encode(await image.readAsBytes());
      UserController.instance.userLogged!.imageBinary = imageBinary;
      await SupabaseService.instance
          .updateUserImage(UserController.instance.userLogged!.id, imageBinary);
      SharedService.instance.prefs.setString(
        SharedKeys.userCredentials,
        UserController.instance.userLogged!.toJson(),
      );
      notifyListeners();
    }
  }

  Future<void> logout(BuildContext context) async {
    await SharedService.instance.prefs.remove(SharedKeys.userCredentials);
    UserController.instance.userLogged = null;
    UserTasksController.instance.tasks = [];
    context.mounted
        ? Navigator.of(context).pushReplacementNamed('/login')
        : null;
    notifyListeners();
  }
}
