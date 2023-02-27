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
    return MaterialApp(
        home: Scaffold(
      appBar: Navigation_AppBar(),
      drawer: NavigationMenu(),
      body: Column(
        children: [
          Expanded(child: Container()),
          Container(
            color: Colors.grey,
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Type your message here.."),
            ),
          )
        ],
      ),
    ));
  }
}
