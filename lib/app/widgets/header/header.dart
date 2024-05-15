import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/controllers/finished_tasks_controller.dart';
import 'package:todo_list_flutter/app/widgets/header/notification_icon.dart';

AppBar header(context) {
  return AppBar(
    toolbarHeight: 90.0,
    titleSpacing: 0,
    leadingWidth: 100.0,
    automaticallyImplyLeading: false,
    title: Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Builder(
            builder: (context) => InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              borderRadius: BorderRadius.circular(100),
              child: const CircleAvatar(
                backgroundImage:
                    AssetImage('../assets/images/profile_pic.jpeg'),
              ),
            ),
          ),
          const Text(
            'Todo List',
            style: TextStyle(
                fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          ),
          AnimatedBuilder(
              animation: FinishedTasksController.instance,
              builder: (context, child) {
                return Container();

                /*NotificationIcon(
                  notifications: FinishedTasksController.instance.finishedTasks,
                );*/
              }),
        ],
      ),
    ),
  );
}
