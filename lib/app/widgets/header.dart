import 'package:flutter/material.dart';

AppBar header() {
  return AppBar(
      toolbarHeight: 90.0,
      titleSpacing: 0,
      leadingWidth: 100.0,
      title: const Padding(
        padding: EdgeInsets.all(25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('../assets/images/profile_pic.jpeg'),
            ),
            Text(
              'Todo List',
              style: TextStyle(
                  fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
            ),
            Icon(Icons.notifications)
          ],
        ),
      ));
}
