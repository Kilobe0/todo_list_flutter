import 'dart:convert';

import 'package:todo_list_flutter/app/controllers/user_controller.dart';
import 'package:todo_list_flutter/app/controllers/user_tasks.controller.dart';
import 'package:todo_list_flutter/app/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'item_menu_drawer.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(50),
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
            icone: Icons.edit_document,
            texto: 'Tarefas',
            cor: Colors.deepPurple,
            onTap: () {},
          ),
          const Gap(10),
          ItemMenuDrawer(
            icone: Icons.person,
            texto: 'Perfil',
            cor: Colors.deepPurple,
            onTap: () {
              HomeController.instance.setCurrentDrawer(1);
            },
          ),
        ],
      ),
    );
  }
}
