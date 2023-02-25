import 'package:flutter/material.dart';
import 'package:project_1/login/login_widget.dart';
import 'package:project_1/settings/settings_widget.dart';

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
            drawer: Drawer(
              // Add a ListView to the drawer. This ensures the user can scroll
              // through the options in the drawer if there isn't enough vertical
              // space to fit everything.
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text('Menu'),
                  ),
                  ListTile(
                    title: const Text('Home'),
                    onTap: () {
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
                  ListTile(
                    title: const Text('Request Nurse'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      requestNurseAlertDialog(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Meal Plan'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                    },
                  ),
                  ListTile(
                    title: const Text('Messages'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                    },
                  ),
                  ListTile(
                    title: const Text('Schedule'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                    },
                  ),
                  ListTile(
                    title: const Text('Settings'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Logout'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage(
                                  title: 'Logout',
                                )),
                      );
                    },
                  ),
                ],
              ),
            ),
            body: Center(
              child: Column(children: <Widget>[
                const Text("Home"),
                Container(
                  margin: const EdgeInsets.all(25),
                  child: ElevatedButton(
                    child: const Text(
                      'Request Nurse',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {
                      requestNurseAlertDialog(context);
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(25),
                  child: ElevatedButton(
                    child: const Text(
                      'Meal Plan',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(25),
                  child: ElevatedButton(
                    child: const Text(
                      'Messages',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(25),
                  child: ElevatedButton(
                    child: const Text(
                      'Schedule',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(25),
                  child: ElevatedButton(
                    child: const Text(
                      'Settings',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {},
                  ),
                )
              ]),
            )));
  }
}

requestNurseAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Yes"),
    onPressed: () {
      Navigator.of(context).pop();
      requestNurseEmergencyAlertDialog(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Request nurse"),
    content: const Text("Would you like to request a nurse?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

requestNurseEmergencyAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget noButton = TextButton(
    child: const Text("No"),
    onPressed: () {
      Navigator.of(context).pop();
      requestNurseConfirmationAlertDialog(context);
    },
  );
  Widget yesButton = TextButton(
    child: const Text("Yes"),
    onPressed: () {
      Navigator.of(context).pop();
      requestNurseConfirmationAlertDialog(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Confirm request..."),
    content: const Text("Is this an emergency?"),
    actions: [
      cancelButton,
      noButton,
      yesButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

requestNurseConfirmationAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Confirmed"),
    content: Text("A nurse will be with you shortly!"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
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
