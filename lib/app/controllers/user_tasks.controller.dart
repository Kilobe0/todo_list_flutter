import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/controllers/user_controller.dart';
import 'package:todo_list_flutter/app/models/task_model.dart';
import 'package:todo_list_flutter/app/services/supabase_service.dart';
import 'package:todo_list_flutter/app/widgets/loading_dialog.dart';
import 'package:todo_list_flutter/app/widgets/snackbar_message.dart';

class UserTasksController extends ChangeNotifier {
  static final UserTasksController instance = UserTasksController();
  List<TaskModel> tasks = [];
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  DateTime dateTime = DateTime.now();

  void clearControllers() {
    taskNameController.clear();
    taskDescriptionController.clear();
    dateTime = DateTime.now();
  }

  Future<void> addTask(BuildContext context) async {
    if (taskNameController.text.isEmpty) {
      showSnackBarError(context, 'Preencha o nome da tarefa');
      return;
    }
    showLoadingDialog(context);
    TaskModel task = TaskModel(
      id: '',
      userId: UserController.instance.userLogged!.id,
      title: taskNameController.text,
      description: taskDescriptionController.text,
      date: dateTime,
      isDone: false,
    );
    tasks.add(task);
    await SupabaseService.instance.addTask(task.toMap());
    clearControllers();
    notifyListeners();
    context.mounted ? Navigator.pop(context) : null;
  }

  Future<void> updateTask(BuildContext context, TaskModel task) async {
    tasks.firstWhere((e) => e.id == task.id).title = taskNameController.text;
    tasks.firstWhere((e) => e.id == task.id).description =
        taskDescriptionController.text;
    tasks.firstWhere((e) => e.id == task.id).date = dateTime;
    await SupabaseService.instance.updateTask(task.toMap());
    clearControllers();
    notifyListeners();
    context.mounted ? Navigator.pop(context) : null;
  }

  Future<void> changeIsDone(BuildContext context, TaskModel task) async {
    tasks.firstWhere((e) => e.id == task.id).isDone = !task.isDone;
    await SupabaseService.instance.changeIsDone(task.id, task.isDone);
    notifyListeners();
  }

  Future<void> deleteTask(BuildContext context, TaskModel task) async {
    tasks.remove(task);
    await SupabaseService.instance.deleteTask(task.id);
    notifyListeners();
  }
}
