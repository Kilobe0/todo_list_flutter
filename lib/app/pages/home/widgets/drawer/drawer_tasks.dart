import 'dart:convert';

import 'package:todo_list_flutter/app/controllers/user_controller.dart';
import 'package:todo_list_flutter/app/controllers/user_tasks_controller.dart';
import 'package:todo_list_flutter/app/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'item_menu_drawer.dart';

class DrawerTasks extends StatelessWidget {
  const DrawerTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                HomeController.instance.setCurrentDrawer(0);
              },
            ),
            backgroundColor: Colors.transparent,
          ),
          AnimatedBuilder(
            animation: UserController.instance,
            builder: (context, child) {
              if (UserController.instance.userLogged!.imageBinary != null) {
                return CircleAvatar(
                  radius: 50,
                  backgroundImage: MemoryImage(
                    base64Decode(
                      UserController.instance.userLogged!.imageBinary!,
                    ),
                  ),
                );
              }
              return const CircleAvatar(
                radius: 50,
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              );
            },
          ),
          const Gap(10),
          Text(
            UserController.instance.userLogged!.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(10),
          Text(
            '${UserTasksController.instance.tasks.length.toString()} tarefas',
            style: const TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 132, 101, 185),
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          const Gap(10),
          ItemMenuDrawer(
            icone: Icons.delete_sweep_rounded,
            texto: 'Excluir tarefas',
            cor: Colors.deepPurple,
            onTap: () async {
              await UserTasksController.instance.deleteAllTasks(context);
            },
          ),
          const Gap(10),
          //Botão de restaurar tarefas excluidas
          ItemMenuDrawer(
            icone: Icons.restore_from_trash_rounded,
            texto: 'Restaurar tarefas',
            cor: Colors.deepPurple,
            onTap: () async {},
          ),
        ],
      ),
    );
  }
}
