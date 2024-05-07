import 'package:flutter/material.dart';

AppBar header(context) {
  return AppBar(
    toolbarHeight: 90.0,
    titleSpacing: 0,
    leadingWidth: 100.0,
    automaticallyImplyLeading: false,
    title: Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Builder(
            builder: (context) => InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              borderRadius: BorderRadius.circular(100),
              child: const CircleAvatar(
                backgroundImage: AssetImage('../assets/images/profile_pic.jpeg'),
              ),
            ),
          ),
          const Text(
            'Todo List',
            style: TextStyle(
                fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          ),
          const Icon(Icons.notifications)
        ],
      ),
    ),
  );
}
