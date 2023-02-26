import 'package:flutter/material.dart';
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
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
            ),
            drawer: NavigationMenu(),
            body: Center(
              child: Column(children: <Widget>[
                const Text("Home"),
                Container(
                  margin: const EdgeInsets.all(25),
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                    child: const Text(
                      'Request Nurse',
                    ),
                    onPressed: () {
                      requestNurseAlertDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        textStyle: const TextStyle(fontSize: 20)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(25),
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                      child: const Text('Meal Plan',
                          style: TextStyle(fontSize: 20.0)),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(42, 178, 232, 1),
                          textStyle: const TextStyle(fontSize: 20))),
                ),
                Container(
                  margin: const EdgeInsets.all(25),
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                    child: const Text(
                      'Messages',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 170, 32, 250),
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
                        backgroundColor: Color.fromARGB(255, 89, 255, 172),
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
                        backgroundColor: Color.fromARGB(205, 245, 237, 0),
                        textStyle: const TextStyle(fontSize: 20)),
                  ),
                )
              ]),
            )));
  }
}


// class MenuBar extends StatefulWidget {
//   const MenuBar({Key? key}) : super(key: key);

//   @override
//   _MenuBarState createState() => _MenuBarState();
// }

// class _MenuBarState extends State<MenuBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Hello")),
//       body: const Center(
//         child: Text('My Page!'),
//       ),
//       drawer: Drawer(
//         // Add a ListView to the drawer. This ensures the user can scroll
//         // through the options in the drawer if there isn't enough vertical
//         // space to fit everything.
//         child: ListView(
//           // Important: Remove any padding from the ListView.
//           padding: EdgeInsets.zero,
//           children: [
//             const DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Text('Drawer Header'),
//             ),
//             ListTile(
//               title: const Text('Item 1'),
//               onTap: () {
//                 // Update the state of the app
//                 // ...
//                 // Then close the drawer
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               title: const Text('Item 2'),
//               onTap: () {
//                 // Update the state of the app
//                 // ...
//                 // Then close the drawer
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
  // }
// }
