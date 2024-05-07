import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/models/task_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Task extends StatelessWidget {
  const Task({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const BehindMotion(),
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
            margin: EdgeInsets.zero,
            child: ListTile(
              title: Text(task.title),
              subtitle: Text('Descrição: ${task.description}'),
              trailing: Text(task.date.day.toString()),
            ),
          ),
        ),
      ),
    );
  }
}
