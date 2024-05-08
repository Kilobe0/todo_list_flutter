import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/controllers/finished_tasks_controller.dart';
import 'package:todo_list_flutter/app/models/task_model.dart';

class TaskListTileOnNotifications extends StatelessWidget {
  const TaskListTileOnNotifications({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: ListTile(
        title: Text(task.title),
        subtitle: Text('Descrição: ${task.description}'),
        trailing: InkWell(
          onTap: () {
            FinishedTasksController.instance.removeFinishedTask(task);
          },
          child: const Icon(
            Icons.delete,
            color: Colors.red,
            size: 20,
          ),
        ),
      ),
    );
  }
}
