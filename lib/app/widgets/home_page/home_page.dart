import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/widgets/home_page/home_controller.dart';
import 'package:todo_list_flutter/app/widgets/profile/drawer_profile.dart';

import '../../models/task_model.dart';
import '../add_task_button.dart';
import '../drawer/drawer_widget.dart';
import '../header/header.dart';
import '../taskview/task_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
          child: TaskList(
            tasks: [
              TaskModel(
                  id: '1',
                  title: 'Arrumar o quarto',
                  description: 'Tudo bonitinho certinho e organizado',
                  date: DateTime.now(),
                  isDone: false),
              TaskModel(
                  id: '2',
                  title: 'Estudar Flutter',
                  description: 'Estudar Flutter para ficar craque',
                  date: DateTime.now(),
                  isDone: false),
              TaskModel(
                  id: '3',
                  title: 'Estudar Flutter',
                  description: 'Estudar Flutter para ficar craque',
                  date: DateTime.now(),
                  isDone: false),
            ],
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
