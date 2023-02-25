import 'package:flutter/material.dart';
import 'package:project_1/home/home_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
              child: Column(children: <Widget>[
        const Text("Username"),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const Text("Password"),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(25),
          child: ElevatedButton(
            child: const Text(
              'Login',
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage(
                          title: 'Home Page',
                        )),
              );
            },
          ),
        ),
        const Text("OR"),
        Container(
          margin: const EdgeInsets.all(25),
          child: ElevatedButton(
            child: const Text(
              'Signup',
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () {},
          ),
        ),
      ]))),
    );
  }
}
