import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/controllers/finished_tasks_controller.dart';
import 'package:todo_list_flutter/app/models/finished_taks_model.dart';
import 'package:todo_list_flutter/app/widgets/taskview/task_listtile_on_notifications.dart';

import '../../../../models/task_model.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onOpened: () {
        FinishedTasksController.instance.notificationsOpened();
      },
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
      icon: Stack(
        children: [
          const Icon(
            Icons.notifications,
            size: 22,
          ),
          Positioned(
            right: 0,
            top: 0,
            left: 10,
            bottom: 6,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: ValueListenableBuilder(
                    valueListenable:
                        FinishedTasksController.instance.notViewedTasks,
                    builder: (context, value, child) {
                      return Text(
                        FinishedTasksController.instance.notViewedTasks.value
                            .toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          height: 0,
                        ),
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
