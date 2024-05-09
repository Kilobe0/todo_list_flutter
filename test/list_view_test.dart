import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/models/task_model.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key, required this.tasks});
  final List<TaskModel> tasks;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return;
      },
    );
  }
}
