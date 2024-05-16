import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/widgets/add_task_alert_dialog.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => AddTaskAlertDialog(),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
