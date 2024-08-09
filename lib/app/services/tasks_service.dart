import 'package:todo_list_flutter/app/controllers/user_tasks_controller.dart';
import 'package:todo_list_flutter/app/models/finished_taks_model.dart';
import 'package:todo_list_flutter/app/models/task_model.dart';

class TasksService {
  static final TasksService instance = TasksService();
  List<FinishedTaksModel> getFinishedTasks() {
    // TODO implementar
    List<FinishedTaksModel> finishedTasks = [];
    for (TaskModel task in UserTasksController.instance.tasks) {
      if (dateIsHigher(task.date)) {
        finishedTasks.add(
          FinishedTaksModel(
            task: task,
          ),
        );
      }
    }
    return finishedTasks;
  }

  bool dateIsHigher(DateTime date) {
    DateTime now = DateTime.now();
    DateTime removedTimeNow = DateTime(now.year, now.month, now.day);
    DateTime removedTimeCheck = DateTime(date.year, date.month, date.day);
    return removedTimeNow.isAfter(removedTimeCheck);
  }
}
