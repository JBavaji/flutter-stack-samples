import 'package:flutter/material.dart';

class ToDoScreen extends StatelessWidget {
  static const routeName = "/to-do";
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('In Progress...'),
        actions: [Text('Home')],
      ),
      body: Expanded(
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              verticalDirection: VerticalDirection.up,
              children: [
                Icon(
                  Icons.construction,
                  size: 42,
                ),
                Text('Screen under development'),
              ]),
        ),
      ),
    );
  }
}
