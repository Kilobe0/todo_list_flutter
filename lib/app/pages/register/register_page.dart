import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/widgets/main_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(32.0),
          decoration: BoxDecoration(
            color: Colors.deepPurple[800],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      // Navegar para a tela anterior
                      Navigator.pop(context);
                    },
                  ),
                  const Text(
                    'Cadastre-se',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              MainTextField(
                label: 'Nome',
                controller: nameController,
                icon: Icons.person,
                isPassword: false,
              ),
              const SizedBox(height: 16.0),
              MainTextField(
                label: 'E-mail',
                controller: emailController,
                icon: Icons.email,
                isPassword: false,
              ),
              const SizedBox(height: 16.0),
              MainTextField(
                label: 'Senha',
                controller: passwordController,
                icon: Icons.lock,
                isPassword: true,
              ),
              const SizedBox(height: 16.0),
              MainTextField(
                label: 'Confirmar senha',
                controller: confirmPasswordController,
                icon: Icons.lock,
                isPassword: true,
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple[600],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50.0,
                    vertical: 15.0,
                  ),
                ),
                onPressed: () {
                  // Implementar a lógica de cadastro
                  final name = nameController.text;
                  final email = emailController.text;
                  final password = passwordController.text;
                  final confirmPassword = confirmPasswordController.text;
                  print('Name: $name, Email: $email, Password: $password, Confirm Password: $confirmPassword');
                },
                child: const Text('Cadastre-se'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}