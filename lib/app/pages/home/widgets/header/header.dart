import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/controllers/finished_tasks_controller.dart';
import 'package:todo_list_flutter/app/controllers/user_controller.dart';

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
              borderRadius: BorderRadius.circular(50),
              hoverColor: Color.fromARGB(52, 255, 255, 255),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: AnimatedBuilder(
                    animation: UserController.instance,
                    builder: (context, child) {
                      if (UserController.instance.userLogged!.imageBinary ==
                          null) {
                        return const CircleAvatar(
                          child: Icon(Icons.person),
                        );
                      }
                      return CircleAvatar(
                        backgroundImage: MemoryImage(
                          base64Decode(
                              UserController.instance.userLogged!.imageBinary!),
                        ),
                      );
                    }),
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
