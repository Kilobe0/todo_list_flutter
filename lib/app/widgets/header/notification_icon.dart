import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/widgets/taskview/task_listtile_on_notifications.dart';

import '../../models/task_model.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    super.key,
    required this.notifications,
  });
  final List<TaskModel> notifications;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return List<PopupMenuEntry<int>>.generate(
          notifications.length,
          (index) => PopupMenuItem(
            value: index,
            child: TaskListTileOnNotifications(task: notifications[index]),
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
                child: Text(
                  notifications.length.toString(),
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
    );
  }
}
