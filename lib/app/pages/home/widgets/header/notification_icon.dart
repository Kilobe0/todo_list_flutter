import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/controllers/finished_tasks_controller.dart';
import 'package:todo_list_flutter/app/widgets/taskview/task_listtile_on_notifications.dart';

import '../../../../models/task_model.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return List<PopupMenuEntry<int>>.generate(
          FinishedTasksController.instance.finishedTasks.length,
          (index) => PopupMenuItem(
            value: index,
            child: TaskListTileOnNotifications(
                task:
                    FinishedTasksController.instance.finishedTasks[index].task),
          ),
        );
      },
      offset: const Offset(0, 30),
      icon: SizedBox(
        width: 22,
        height: 25,
        child: Stack(
          fit: StackFit.expand,
          children: [
            const Icon(
              Icons.notifications,
              size: 22,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    FinishedTasksController.instance
                        .getNotViewedTasks()
                        .toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
