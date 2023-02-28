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
  final roundedRectShape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0));
  @override
  Widget build(BuildContext context) {
    var buttonTextStyle = const TextStyle(fontSize: 20);
    return MaterialApp(
        home: Scaffold(
            appBar: Navigation_AppBar(),
            drawer: const NavigationMenu(),
            body: Center(
              child: Column(children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(25),
                  height: 50,
                  width: 250,
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          shape: roundedRectShape,
                          backgroundColor: Colors.red,
                          textStyle: buttonTextStyle),
                      icon: const Icon(Icons.person),
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
                            shape: roundedRectShape,
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
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        shape: roundedRectShape,
                        backgroundColor:
                            const Color.fromARGB(255, 170, 32, 250),
                        textStyle: buttonTextStyle),
                    icon: const Icon(Icons.message),
                    label: const Text('Messages'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MessagesPage(
                                  title: 'Messages Page',
                                )),
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(25),
                  height: 50,
                  width: 250,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        shape: roundedRectShape,
                        backgroundColor:
                            const Color.fromARGB(255, 89, 255, 172),
                        textStyle: buttonTextStyle),
                    icon: const Icon(Icons.calendar_month),
                    label: const Text('Schedule'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MessagesPage(
                                  title: 'Schedule Page',
                                )),
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(25),
                  height: 50,
                  width: 250,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        shape: roundedRectShape,
                        backgroundColor: const Color.fromARGB(205, 245, 237, 0),
                        textStyle: buttonTextStyle),
                    icon: const Icon(Icons.settings),
                    label: const Text('Settings'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MessagesPage(
                                  title: 'Settings Page',
                                )),
                      );
                    },
                  ),
                )
              ]),
            )));
  }
}
