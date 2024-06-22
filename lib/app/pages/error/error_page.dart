import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// Quando o lottie voltar a funcionar colocar essa animação
/*

Lottie.network(
              'https://lottie.host/63c5ec42-2836-4f70-b6c1-eb538701f269/L0gf1PXYFL.json',
              
            ),
*/

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo-List',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const Scaffold(
        body: Center(
          child: Text(
            'Algo deu errado, tente novamente mais tarde',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
