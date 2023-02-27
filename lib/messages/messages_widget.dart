import 'package:flutter/material.dart';
import '../navigation/navigationbar_widget.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key, required this.title});

  final String title;

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
      appBar: Navigation_AppBar(),
      drawer: NavigationMenu(),
      body: Center(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Send a message")),
      )),
    ));
  }
}
