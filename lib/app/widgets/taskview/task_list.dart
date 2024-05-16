import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/models/task_model.dart';
import 'package:todo_list_flutter/app/widgets/taskview/task_card.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key, required this.tasks});
  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    return tasks.isEmpty
        ? const Center(
            child: Text(
              'Nenhuma tarefa encontrada',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Montserrat',
              ),
            ),
          )
        : ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              if (tasks.isEmpty) {
                return const Center(
                  child: Text(
                    'Nenhuma tarefa encontrada',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                );
              }
              return TaskCard(
                task: tasks[index],
              );
            },
          );
  }
}
