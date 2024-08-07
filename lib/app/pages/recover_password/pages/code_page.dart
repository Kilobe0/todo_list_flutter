import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_list_flutter/app/pages/recover_password/controllers/code_controller.dart';
import 'package:todo_list_flutter/app/pages/recover_password/controllers/recover_password_controller.dart';
import 'package:todo_list_flutter/app/pages/recover_password/pages/recover_password_page.dart';
import 'package:todo_list_flutter/app/widgets/main_text_field.dart';

class CodePage extends StatelessWidget {
  const CodePage({super.key});

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
                    Color(0xFF210A3E),
                    Color(0xFF4F0A68),
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
                    'Informe o código',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Gap(16.0),
                  ValueListenableBuilder(
                      valueListenable:
                          RecoverPasswordController.instance.timeToExpireCode,
                      builder: (context, value, child) {
                        return Text(
                          value == 0
                              ? 'Código expirado'
                              : 'Verifique seu e-mail, código expira em $value segundos',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        );
                      }),
                  const Gap(16.0),
                  MainTextField(
                    label: 'Código',
                    controller: CodeController.instance.codeController,
                    isPassword: false,
                  ),
                  const Gap(30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RecoverPasswordPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        child: const Text('Voltar'),
                      ),
                      const Gap(16.0),
                      ElevatedButton(
                        onPressed: () {
                          CodeController.instance
                              .goToCreateNewPasswordPage(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        child: const Text('Criar nova senha'),
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
