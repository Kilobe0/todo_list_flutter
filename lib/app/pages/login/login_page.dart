import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_list_flutter/app/pages/login/login_controller.dart';
import 'package:todo_list_flutter/app/widgets/main_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 18, 24), // Fundo roxo escuro
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: 650,
            height: 650,
            decoration: BoxDecoration(
              color: const Color(0xFF210A3E), // Fundo do container
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/logo.png', width: 150),
                const Gap(16.0),
                const Text(
                  '2Do',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Gap(24.0),
                SizedBox(
                  width: 400,
                  height: 70,
                  child: MainTextField(
                    label: 'E-mail',
                    controller: LoginController.instance.emailController,
                    isPassword: false,
                  ),
                ),
                const Gap(16.0),
                SizedBox(
                  width: 400,
                  height: 70,
                  child: MainTextField(
                    label: 'Senha',
                    controller: LoginController.instance.passwordController,
                    isPassword: true,
                  ),
                ),
                const Gap(24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          LoginController.instance.clearControllers();
                          Navigator.pushReplacementNamed(context, '/register');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF210A3E), // Fundo do botão
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: const BorderSide(
                                color: Color(0xFFA484E3)), // Borda do botão
                          ),
                        ),
                        child: const Text('Cadastre-se',
                            style: TextStyle(
                                color: Color(0xFFA484E3), fontSize: 18)),
                      ),
                    ),
                    const Gap(20),
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Lógica de login
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF663AB8), // Fundo do botão
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text('Login',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
