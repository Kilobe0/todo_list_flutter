import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/models/finished_taks_model.dart';
import 'package:todo_list_flutter/app/models/task_model.dart';
import 'package:todo_list_flutter/app/services/tasks_service.dart';

class FinishedTasksController extends ChangeNotifier {
  static FinishedTasksController instance = FinishedTasksController();
  List<FinishedTaksModel> finishedTasks = [];
  ValueNotifier<int> notViewedTasks = ValueNotifier(0);
  void removeFinishedTask(FinishedTaksModel finishedTask) {
    finishedTasks.remove(finishedTask);
    notifyListeners();
  }

  void refreshFinishedTasks() {
    finishedTasks = TasksService.instance.getFinishedTasks();
    notifyListeners();
  }

  void getNotViewedTasks() {
    for (FinishedTaksModel task in finishedTasks) {
      if (!task.alreadyViewed) {
        notViewedTasks.value++;
      }
    }
  }

  void notificationsOpened() {
    for (FinishedTaksModel task in finishedTasks) {
      task.alreadyViewed = true;
    }
    notViewedTasks.value = 0;
  }
}
