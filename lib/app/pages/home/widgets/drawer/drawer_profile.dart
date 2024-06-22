import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_list_flutter/app/controllers/user_controller.dart';
import 'package:todo_list_flutter/app/my_app_controller.dart';
import 'package:todo_list_flutter/app/pages/home/home_controller.dart';

class DrawerProfile extends StatelessWidget {
  const DrawerProfile({super.key});

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
                return InkWell(
                  onTap: () async {
                    await UserController.instance.updateUserImage();
                  },
                  borderRadius: BorderRadius.circular(100),
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: MemoryImage(
                          base64Decode(
                            UserController.instance.userLogged!.imageBinary!,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 70,
                        right: 0,
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: const Icon(
                              Icons.edit,
                              color: Color.fromARGB(255, 94, 22, 107),
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return InkWell(
                onTap: () async {
                  await UserController.instance.updateUserImage();
                },
                borderRadius: BorderRadius.circular(100),
                child: Stack(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      child: Icon(
                        Icons.person,
                        size: 50,
                      ),
                    ),
                    Positioned(
                      bottom: 70,
                      right: 0,
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: const Icon(
                            Icons.edit,
                            color: Color.fromARGB(255, 94, 22, 107),
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const Gap(10),
          Text(
            UserController.instance.userLogged!.name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(10),
          Text(
            UserController.instance.userLogged!.email,
            style: const TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 132, 101, 185),
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Notificações'),
              Transform.scale(
                scale: 0.5,
                child: Switch(
                  value: true,
                  onChanged: (bool) {},
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Modo Escuro'),
              Transform.scale(
                scale: 0.5,
                child: ListenableBuilder(
                    listenable: MyAppController.instance.isDark,
                    builder: (context, child) {
                      return Switch(
                          value: MyAppController.instance.getIsDark,
                          onChanged: (value) {
                            MyAppController.instance.changeTheme();
                          });
                    }),
              )
            ],
          ),
          const Gap(5),
          InkWell(
            onTap: () async {
              HomeController.instance.setCurrentDrawer(0);
              await UserController.instance.logout(context);
            },
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Sair'),
                  Gap(10),
                  Icon(Icons.exit_to_app),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
