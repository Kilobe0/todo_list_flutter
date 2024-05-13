import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/my_app_controller.dart';

import 'widgets/home_page/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: MyAppController.instance.isDark,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Todo-List',
          theme: ThemeData(
            brightness: MyAppController.instance.getIsDark
                ? Brightness.dark
                : Brightness.light,
          ),
          home: const HomePage(),
        );
      }
    );
  }
}
