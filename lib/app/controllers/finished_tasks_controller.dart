import 'package:flutter/material.dart';

import '../models/task_model.dart';

class FinishedTasksController extends ChangeNotifier {
  static FinishedTasksController instance = FinishedTasksController();
  List<TaskModel> finishedTasks = [
    TaskModel(
      id: '0',
      title: 'Tarefa 1',
      description: 'Descricão da tarefa 1',
      date: DateTime.now(),
      isDone: true,
    ),
    TaskModel(
      id: '1',
      title: 'Tarefa 2',
      description: 'Descricão da tarefa 2',
      date: DateTime.now(),
      isDone: false,
    ),
  ];
  removeFinishedTask(TaskModel task) {
    finishedTasks.remove(task);
    notifyListeners();
  }
}
