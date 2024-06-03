import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/controllers/user_controller.dart';
import 'package:todo_list_flutter/app/my_app_controller.dart';
import 'package:todo_list_flutter/app/pages/login/login_page.dart';
import 'package:todo_list_flutter/app/pages/register/register_page.dart';

import 'pages/home/home_page.dart';

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
              fontFamily: 'Montserrat',
              useMaterial3: true,
            ),
            onGenerateRoute: (settings) {
              bool isLoggedIn = UserController.instance.userLogged != null;
              if (settings.name == '/login' || settings.name == '/home') {
                return MaterialPageRoute(
                  builder: (context) =>
                      isLoggedIn ? const HomePage() : const LoginPage(),
                );
              }
              // Adicione outras rotas aqui
              return MaterialPageRoute(
                  builder: (context) => const RegisterPage());
            },
            routes: {
              '/login': (context) => const LoginPage(),
              '/register': (context) => const RegisterPage(),
              '/home': (context) => const HomePage(),
            },
            initialRoute:
                UserController.instance.userLogged != null ? '/home' : '/login',
          );
        });
  }
}
