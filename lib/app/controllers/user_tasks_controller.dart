import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/controllers/user_controller.dart';
import 'package:todo_list_flutter/app/core/shared_keys.dart';
import 'package:todo_list_flutter/app/models/task_model.dart';
import 'package:todo_list_flutter/app/services/shared_service.dart';
import 'package:todo_list_flutter/app/services/supabase_service.dart';

import 'package:todo_list_flutter/app/widgets/message_widgets.dart';

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

  void addRestoredTask(TaskModel task) {
    tasks.add(task);
    notifyListeners();
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
    await SupabaseService.instance.addTask(task.toMap());
    List<Map<String, dynamic>> tasksListMap = await SupabaseService.instance
        .getUserTasks(UserController.instance.userLogged!.id);
    tasks = tasksListMap.map((e) => TaskModel.fromMap(e)).toList();
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
  }

  Future<void> changeIsDone(BuildContext context, TaskModel task) async {
    tasks.firstWhere((e) => e.id == task.id).isDone = !task.isDone;
    await SupabaseService.instance.changeIsDone(task.id, task.isDone);
    notifyListeners();
  }

  Future<void> deleteTask(BuildContext context, TaskModel task) async {
    List<String> aux =
        SharedService.instance.prefs.getStringList(SharedKeys.tasksToRecover) ??
            [];
    aux.add(task.toJson());
    await SharedService.instance.prefs
        .setStringList(SharedKeys.tasksToRecover, aux);
    await SupabaseService.instance.deleteTask(task.id);
    tasks.remove(task);
    notifyListeners();
  }

  Future<void> deleteAllTasks(BuildContext context) async {
    //confirmar se o usuário realmente quer excluir todas as tarefas
    bool result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Excluir todas as tarefas'),
          content: const Text(
              'Tem certeza que deseja excluir permanentemente todas as suas tarefas?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Excluir'),
            ),
          ],
        );
      },
    );
    if (!result) return;

    context.mounted ? showLoadingDialog(context) : null;
    for (TaskModel task in tasks) {
      await SupabaseService.instance.deleteTask(task.id);
    }
    tasks = [];
    context.mounted ? Navigator.pop(context) : null;
    notifyListeners();
  }
}
