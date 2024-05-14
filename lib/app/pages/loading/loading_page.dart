import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Lottie.network(
              'https://lottie.host/d3fc5b93-170f-4b1f-817c-db8a8db9a906/enoYGovoFA.json'),
        ),
      ),
    );
  }
}
