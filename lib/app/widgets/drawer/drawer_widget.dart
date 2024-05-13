import 'package:todo_list_flutter/app/widgets/home_page/home_controller.dart';
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
          const CircleAvatar(
            radius: 50,
            // Aqui substituir pela imagem do usuario
            child: FlutterLogo(
              size: 50,
            ),
          ),
          const Gap(10),
          const Text(
            'Nome do Usuário',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(10),
          const Text(
            'N Tarefas',
            style: TextStyle(
              fontSize: 16,
              color: Colors.deepPurple,
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
