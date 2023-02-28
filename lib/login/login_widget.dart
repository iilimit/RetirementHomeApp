import 'package:flutter/material.dart';
import 'package:project_1/home/home_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
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
        const SizedBox(height: 30),
        // ignore: unnecessary_new
        new Image.asset(
          'assets/images/login page image.png',
          height: 190.0,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 20),
        const Text("Username"),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            ),
          ),
        ),
        const Text("Password"),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            ),
          ),
        ),
        Container(
          height: 50,
          width: 150,
          margin: const EdgeInsets.all(25),
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll<Color>(
                    Color.fromARGB(255, 91, 88, 255)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ))),
            child: const Text(
              'Login',
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () {
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
        const Text(
          "--------OR--------",
          style: TextStyle(fontSize: 16),
        ),
        Container(
          height: 50,
          width: 150,
          margin: const EdgeInsets.all(25),
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    const MaterialStatePropertyAll<Color>(Color(0xFFC331EB)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ))),
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
