import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/controllers/user_controller.dart';
import 'package:todo_list_flutter/app/controllers/user_tasks.controller.dart';
import 'package:todo_list_flutter/app/pages/home/home_controller.dart';
import 'package:todo_list_flutter/app/pages/login/login_page.dart';
import 'package:todo_list_flutter/app/widgets/profile/drawer_profile.dart';

import '../../widgets/add_task_button.dart';
import '../../widgets/drawer/drawer_widget.dart';
import '../../widgets/header/header.dart';
import '../../widgets/taskview/task_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Verificação de autenticação
    if (UserController.instance.userLogged == null) {
      // Redireciona para a página de login se não estiver logado
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      });
      return const SizedBox
          .shrink(); // Retorna um widget vazio enquanto redireciona
    }
    return Scaffold(
      
      appBar: header(context),
      drawer: AnimatedBuilder(
        animation: HomeController.instance,
        builder: (context, child) {
          switch (HomeController.instance.getCurrentDrawer) {
            case 0:
              return const DrawerWidget();
            case 1:
              return const DrawerProfile();
            default:
              return const DrawerWidget();
          }
        },
      ),
      body: Center(
        child: SizedBox(
          width: 500,
          child: AnimatedBuilder(
            animation: UserTasksController.instance,
            builder: (context, child) {
              return TaskList(
                tasks: UserTasksController.instance.tasks,
              );
            }
          ),
        ),
      ),
      floatingActionButton: const Padding(
        padding: EdgeInsets.only(bottom: 20.0),
        child: AddTaskButton(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
