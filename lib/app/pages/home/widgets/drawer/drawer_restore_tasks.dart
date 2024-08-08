import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_list_flutter/app/pages/home/home_controller.dart';
import 'package:todo_list_flutter/app/pages/home/widgets/drawer/controllers/restore_tasks_controller.dart';
import 'package:todo_list_flutter/app/pages/home/widgets/drawer/restorable_task_widget.dart';

class DrawerRestoreTasks extends StatefulWidget {
  const DrawerRestoreTasks({super.key});

  @override
  State<DrawerRestoreTasks> createState() => _DrawerRestoreTasksState();
}

class _DrawerRestoreTasksState extends State<DrawerRestoreTasks> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    RestoreTasksController.instance.getRestorableTasks();
  }

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
                HomeController.instance.setCurrentDrawer(1);
              },
            ),
            backgroundColor: Colors.transparent,
          ),
          const Text(
            'Restaurar tarefas',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          Gap(10),
          Expanded(
            child: AnimatedBuilder(
                animation: RestoreTasksController.instance,
                builder: (context, child) {
                  return ListView.builder(
                    itemCount:
                        RestoreTasksController.instance.restorableTasks.length,
                    itemBuilder: (context, index) {
                      return RestorableTaskWidget(
                        task: RestoreTasksController
                            .instance.restorableTasks[index],
                      );
                    },
                  );
                }),
          ),
          Gap(10),
        ],
      ),
    );
  }
}
