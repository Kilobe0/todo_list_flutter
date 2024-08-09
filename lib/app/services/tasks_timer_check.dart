import 'dart:async';

import 'package:todo_list_flutter/app/controllers/finished_tasks_controller.dart';
import 'package:todo_list_flutter/app/services/tasks_service.dart';

class TasksTimerCheck {
  static final TasksTimerCheck instance = TasksTimerCheck();
  late DateTime _lastCheckedDate;

  void startDailyCheckTimer() {
    _lastCheckedDate = DateTime.now();

    Timer.periodic(const Duration(minutes: 10), (timer) {
      DateTime now = DateTime.now();

      // Se a data mudou, ou seja, passou para um novo dia
      if (now.day != _lastCheckedDate.day) {
        _lastCheckedDate = now;
        // Chama a função para verificar e mover as tarefas
        FinishedTasksController.instance.refreshFinishedTasks();
      }
    });
  }
}
