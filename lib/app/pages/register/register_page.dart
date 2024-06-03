import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_list_flutter/app/pages/register/register_controller.dart';
import 'package:todo_list_flutter/app/widgets/main_text_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 20, 18, 24), // Fundo roxo escuro
      body: Center(
        child: Container(
          width: 650,
          height: 650,
          decoration: BoxDecoration(
            color: const Color(0xFF210A3E), // Fundo do container
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.fromLTRB(32, 16, 32, 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      RegisterController.instance.clearControllers();
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    icon: const Icon(Icons.arrow_back)),
              ),
              const Gap(16.0),
              const Text(
                'Insira seus dados',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Gap(48.0),
              SizedBox(
                width: 400,
                height: 70,
                child: MainTextField(
                  label: 'Nome',
                  controller: RegisterController.instance.nameController,
                  isPassword: false,
                ),
              ),
              const Gap(16.0),
              SizedBox(
                width: 400,
                height: 70,
                child: MainTextField(
                  label: 'E-mail',
                  controller: RegisterController.instance.emailController,
                  isPassword: false,
                ),
              ),
              const Gap(16.0),
              SizedBox(
                width: 400,
                height: 70,
                child: MainTextField(
                  label: 'Senha',
                  controller: RegisterController.instance.passwordController,
                  isPassword: true,
                ),
              ),
              const Gap(16.0),
              SizedBox(
                width: 400,
                height: 70,
                child: MainTextField(
                  label: 'Confirmar senha',
                  controller:
                      RegisterController.instance.confirmPasswordController,
                  isPassword: true,
                ),
              ),
              const Gap(24.0),
              Center(
                child: SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: ()  async {
                      // TODO: Lógica de cadastro
                      await RegisterController.instance.registerUser(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF663AB8), // Fundo do botão
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text('Cadastre-se',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ),
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
