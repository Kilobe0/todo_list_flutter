import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/models/task_model.dart';
import 'package:todo_list_flutter/app/src/date_operations.dart';

class TaskVisualizer extends StatelessWidget {
  const TaskVisualizer({
    super.key,
    required this.task,
  });
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Align(
        alignment: Alignment.topLeft,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.arrow_back_rounded),
            ),
            Text(
              task.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 5,
            ),
          ],
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Descricão:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            constraints: const BoxConstraints(
              maxWidth: 450,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            alignment: Alignment.topLeft,
            child: Text(
              task.description,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Data:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            constraints: const BoxConstraints(
              maxWidth: 450,
            ),
            alignment: Alignment.topLeft,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Text(
              '${DateOperations.instance.formatDateBr(task.date)} - ${DateOperations.instance.calculateDaysUntil(task.date)} dias restantes',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Status:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            constraints: const BoxConstraints(
              maxWidth: 450,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            alignment: Alignment.topLeft,
            child: Text(
              task.isDone ? 'Concluída :)' : 'Pendente :O',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
