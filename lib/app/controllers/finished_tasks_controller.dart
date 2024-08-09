import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/models/finished_taks_model.dart';
import 'package:todo_list_flutter/app/models/task_model.dart';
import 'package:todo_list_flutter/app/services/tasks_service.dart';

class FinishedTasksController extends ChangeNotifier {
  static FinishedTasksController instance = FinishedTasksController();
  List<FinishedTaksModel> finishedTasks = [];

  void removeFinishedTask(FinishedTaksModel finishedTask) {
    finishedTasks.remove(finishedTask);
    notifyListeners();
  }

  void refreshFinishedTasks() {
    finishedTasks = TasksService.instance.getFinishedTasks();
    notifyListeners();
  }

  int getNotViewedTasks() {
    int notViewedTasks = 0;
    for (FinishedTaksModel task in finishedTasks) {
      if (!task.alreadyViewed!) {
        notViewedTasks++;
      }
    }
    return notViewedTasks;
  }
}
