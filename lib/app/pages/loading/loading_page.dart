import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo-List',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        body: Center(
          child: LottieBuilder.asset(
            'assets/lottie/loading.json',
          ),
        ),
      ),
    );
  }
}
