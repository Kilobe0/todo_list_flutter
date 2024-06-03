import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/controllers/user_tasks.controller.dart';
import 'package:todo_list_flutter/app/models/task_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_list_flutter/app/src/date_operations.dart';
import 'package:todo_list_flutter/app/widgets/add_task_alert_dialog.dart';
import 'package:todo_list_flutter/app/widgets/taskview/task_visualizer.dart';

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
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => TaskVisualizer(
                  task: task,
                ),
              );
            },
            title: Text(
              task.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: task.isDone
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            subtitle: Text(
              'Descrição: ${task.description}',
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(
              '${DateOperations.instance.calculateDaysUntil(task.date)} d',
            ),
            leading: Checkbox(
              value: task.isDone,
              onChanged: (value) async {
                await UserTasksController.instance.changeIsDone(context, task);
              },
            ),
          ),
        ),
      ),
    );
  }
}
