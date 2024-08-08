import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_list_flutter/app/models/task_model.dart';
import 'package:todo_list_flutter/app/pages/home/widgets/drawer/controllers/restore_tasks_controller.dart';
import 'package:todo_list_flutter/app/widgets/taskview/task_visualizer.dart';

class RestorableTaskWidget extends StatelessWidget {
  const RestorableTaskWidget({super.key, required this.task});
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => TaskVisualizer(task: task),
        );
      },
      child: Card(
        child: Container(
          width: 250,
          height: 50,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            shadows: const [
              BoxShadow(
                color: Color.fromARGB(85, 0, 0, 0),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 0),
              )
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                task.title,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      await RestoreTasksController.instance.restoreTask(task);
                    },
                    child: const Icon(
                      Icons.restore,
                      size: 20,
                    ),
                  ),
                  const Gap(10),
                  InkWell(
                    onTap: () async {
                      await RestoreTasksController.instance.deleteTask(task);
                    },
                    child: const Icon(
                      Icons.delete,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
