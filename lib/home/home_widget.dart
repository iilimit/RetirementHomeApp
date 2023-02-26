import 'package:flutter/material.dart';
import 'package:project_1/messages/messages_widget.dart';
import '../navigation/navigationbar_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var buttonTextStyle = const TextStyle(fontSize: 20);
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
            ),
            drawer: const NavigationMenu(),
            body: Center(
              child: Column(children: <Widget>[
                const Text("Home"),
                Container(
                  margin: const EdgeInsets.all(25),
                  height: 50,
                  width: 250,
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          textStyle: buttonTextStyle),
                      icon: const Icon(Icons.home),
                      label: const Text('Request Nurse'),
                      onPressed: () {
                        requestNurseAlertDialog(context);
                      }),
                ),
                Container(
                    margin: const EdgeInsets.all(25),
                    height: 50,
                    width: 250,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(42, 178, 232, 1),
                            textStyle: buttonTextStyle),
                        icon: const Icon(Icons.food_bank),
                        label: const Text('Meal Plan'),
                        onPressed: () {
                          requestNurseAlertDialog(context);
                        })),
                Container(
                  margin: const EdgeInsets.all(25),
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                    child: const Text(
                      'Messages',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MessagesPage(
                                  title: 'Messages Page',
                                )),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 170, 32, 250),
                        textStyle: const TextStyle(fontSize: 20)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(25),
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                    child: const Text(
                      'Schedule',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 89, 255, 172),
                        textStyle: const TextStyle(fontSize: 20)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(25),
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                    child: const Text('Settings',
                        style: TextStyle(fontSize: 20.0)),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(205, 245, 237, 0),
                        textStyle: const TextStyle(fontSize: 20)),
                  ),
                )
              ]),
            )));
  }
}
