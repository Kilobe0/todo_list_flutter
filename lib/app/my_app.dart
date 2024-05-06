import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/widgets/header/header.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo-List',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        appBar: header(),
        body: Center(
          child: Text('Hello, World!'),
        )
      ),
    );
  }
}
