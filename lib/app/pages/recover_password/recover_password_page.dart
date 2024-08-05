import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_list_flutter/app/pages/recover_password/recover_password_controller.dart';
import 'package:todo_list_flutter/app/widgets/main_text_field.dart';
import 'package:todo_list_flutter/app/widgets/second_text_field.dart';

class RecoverPasswordPage extends StatelessWidget {
  const RecoverPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 18, 24),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 400,
              height: 300,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 75, 51, 104),
                    Color.fromARGB(255, 128, 65, 151),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              padding:
                  const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Recuperar Senha',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Gap(16.0),
                  Text(
                    'Insira o seu e-mail para recuperar sua senha',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  const Gap(16.0),
                  SecondTextField(
                    label: 'E-mail',
                    controller:
                        RecoverPasswordController.instance.emailController,
                    isPassword: false,
                  ),
                  const Gap(30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Voltar'),
                      ),
                      const Gap(16.0),
                      ElevatedButton(
                        onPressed: () {
                          // TODO
                        },
                        child: const Text('Enviar código'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
