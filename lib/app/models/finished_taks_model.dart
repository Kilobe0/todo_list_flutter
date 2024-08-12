import 'package:todo_list_flutter/app/models/task_model.dart';

class FinishedTaksModel {
  bool alreadyViewed;
  TaskModel task;
  FinishedTaksModel({this.alreadyViewed = false, required this.task});
}
