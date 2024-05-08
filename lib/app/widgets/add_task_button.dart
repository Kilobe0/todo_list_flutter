import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/widgets/add_task_alert_dialog.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(context: context, builder: (context) => const AddTaskAlertDialog());
      },
      child: const Icon(Icons.add),
    );
  }
}
