import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/controllers/user_tasks.controller.dart';
import 'package:todo_list_flutter/app/models/task_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_list_flutter/app/widgets/add_task_alert_dialog.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const Card(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: BehindMotion(),
            ),
          ),
          extentRatio: 0.20,
          children: [
            SlidableAction(
              onPressed: (context) async {
                // TODO: Implement delete functionality here
                await UserTasksController.instance.deleteTask(context, task);
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Card(
          child: ListTile(
            onLongPress: () {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => AddTaskAlertDialog(task: task));
            },
            title: Text(task.title),
            subtitle: Text('Descrição: ${task.description}'),
            trailing: Text(task.date.day.toString()),
            leading: Checkbox(value: task.isDone, onChanged: (value) {}),
          ),
        ),
      ),
    );
  }
}
