import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/models/task_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
              onPressed: (context) {
                // TODO: Implement delete functionality here
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
            title: Text(task.title),
            subtitle: Text('Descrição: ${task.description}'),
            trailing: Text(task.date.day.toString()),
          ),
        ),
      ),
    );
  }
}
