import 'package:flutter/material.dart';

AppBar header() {
  return AppBar(
    toolbarHeight: 90.0,
    leading: const Padding(
      padding: EdgeInsets.all(25.0),
      child: CircleAvatar(
        backgroundImage: AssetImage('../assets/images/profile_pic.jpeg'),
      ),
    ),
    leadingWidth: 100.0,
    title: const Padding(
      padding: EdgeInsets.all(25.0),
      child: Text('Todo List'),
    ),
    centerTitle: true,
    actions: const [
      Padding(
        padding: EdgeInsets.all(25.0),
        child: Icon(Icons.notifications),
      )
    ],
  );
}
