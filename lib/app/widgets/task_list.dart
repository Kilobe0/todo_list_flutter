import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/models/task_model.dart';
import 'package:todo_list_flutter/app/widgets/task.dart';

class TaskList extends StatelessWidget {
  final List<TaskModel> tasks;

  const TaskList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // TODO: Concertar a lógica da lista para que ele não repita as tarefas
        itemCount: 5,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Task(
                task: TaskModel(
                    title: 'Arrumar o quarto',
                    description: 'Tudo bonitinho certinho e organizado',
                    date: DateTime.now(),
                    isDone: false),
              ),
              Task(
                task: TaskModel(
                    title: 'Estudar Flutter',
                    description: 'Estudar Flutter para ficar craque',
                    date: DateTime.now(),
                    isDone: false),
              ),
              Task(
                task: TaskModel(
                    title: 'Estudar Flutter',
                    description: 'Estudar Flutter para ficar craque',
                    date: DateTime.now(),
                    isDone: false),
              ),
            ],
          );
        });
  }
}
