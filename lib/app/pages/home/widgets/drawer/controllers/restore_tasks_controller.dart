import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_list_flutter/app/core/shared_keys.dart';
import 'package:todo_list_flutter/app/models/task_model.dart';
import 'package:todo_list_flutter/app/services/shared_service.dart';
import 'package:todo_list_flutter/app/services/supabase_service.dart';

class RestoreTasksController {
  static final RestoreTasksController instance = RestoreTasksController();
  List<TaskModel> restorableTasks = [];
  void restoreTask(TaskModel task) async {
    await SupabaseService.instance.addTask(task.toMap());
  }

  Future<void> getRestorableTasks() async {
    List<String> aux =
        SharedService.instance.prefs.getStringList(SharedKeys.tasksToRecover) ??
            [];
    restorableTasks = aux.map((e) => TaskModel.fromJson(e)).toList();
  }
  
}
