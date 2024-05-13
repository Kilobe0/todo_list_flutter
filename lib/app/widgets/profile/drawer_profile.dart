import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_list_flutter/app/my_app_controller.dart';
import 'package:todo_list_flutter/app/widgets/home_page/home_controller.dart';

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
            'usuario@email.com',
            style: TextStyle(
              fontSize: 16,
              color: Colors.deepPurple,
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
          const Text('Sobre'),
          const Gap(5),
          const Text('Sair'),
        ],
      ),
    );
  }
}
