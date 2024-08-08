import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_list_flutter/app/controllers/user_tasks_controller.dart';
import 'package:todo_list_flutter/app/core/shared_keys.dart';
import 'package:todo_list_flutter/app/models/task_model.dart';
import 'package:todo_list_flutter/app/services/shared_service.dart';
import 'package:todo_list_flutter/app/services/supabase_service.dart';

class RestoreTasksController extends ChangeNotifier {
  static final RestoreTasksController instance = RestoreTasksController();
  List<TaskModel> restorableTasks = [];
  Future<void> restoreTask(TaskModel task) async {
    restorableTasks.remove(task);
    SharedService.instance.prefs.setStringList(SharedKeys.tasksToRecover,
        restorableTasks.map((e) => e.toJson()).toList());
    String taskId = await SupabaseService.instance.addTask(task.toMap());
    task.id = taskId;
    UserTasksController.instance.addRestoredTask(task);
    notifyListeners();
  }

  Future<void> deleteTask(TaskModel task) async {
    restorableTasks.remove(task);
    await SharedService.instance.prefs.setStringList(SharedKeys.tasksToRecover,
        restorableTasks.map((e) => e.toJson()).toList());
    notifyListeners();
  }

  Future<void> getRestorableTasks() async {
    List<String> aux =
        SharedService.instance.prefs.getStringList(SharedKeys.tasksToRecover) ??
            [];
    restorableTasks = aux.map((e) => TaskModel.fromJson(e)).toList();
    notifyListeners();
  }
}
