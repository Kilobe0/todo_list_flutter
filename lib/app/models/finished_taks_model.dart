
import 'package:todo_list_flutter/app/models/task_model.dart';

class FinishedTaksModel {
  bool? alreadyViewed = false;
  TaskModel task;
  FinishedTaksModel({ this.alreadyViewed, required this.task});
}