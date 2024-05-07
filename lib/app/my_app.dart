import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/widgets/header.dart';
import 'package:todo_list_flutter/app/models/task_model.dart';
import 'package:todo_list_flutter/app/widgets/task_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo-List',
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: Scaffold(
            appBar: header(),
            body: Center(
              child: TaskList(
                tasks: [
                  TaskModel(
                      title: 'Arrumar o quarto',
                      description: 'Tudo bonitinho certinho e organizado',
                      date: DateTime.now(),
                      isDone: false),
                  TaskModel(
                      title: 'Estudar Flutter',
                      description: 'Estudar Flutter para ficar craque',
                      date: DateTime.now(),
                      isDone: false),
                  TaskModel(
                      title: 'Estudar Flutter',
                      description: 'Estudar Flutter para ficar craque',
                      date: DateTime.now(),
                      isDone: false),
                ],
              ),
            )));
  }
}
