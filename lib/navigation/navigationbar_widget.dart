import 'package:flutter/material.dart';
import '../home/home_widget.dart';
import '../login/login_widget.dart';
import '../messages/messages_widget.dart';

class NavigationMenu extends StatelessWidget implements PreferredSizeWidget {
  const NavigationMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(''),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
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
            leading: const Icon(Icons.person),
            title: const Text('Request Nurse'),
            onTap: () {
              requestNurseAlertDialog(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.food_bank),
            title: const Text('Meal Plan'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Messages'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MessagesPage(
                          title: 'Messages Page',
                        )),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month),
            title: const Text('Schedule'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}

class Navigation_AppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  const Navigation_AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: const Text(""),
      actions: [IconButton(icon: const Icon(Icons.person_4), onPressed: () {})],
    );
  }
}

requestNurseAlertDialog(BuildContext context) {
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

  AlertDialog alert = AlertDialog(
    title: const Text("Request nurse"),
    content: const Text("Would you like to request a nurse?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

requestNurseEmergencyAlertDialog(BuildContext context) {
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

  AlertDialog alert = AlertDialog(
    title: const Text("Confirm request..."),
    content: const Text("Is this an emergency?"),
    actions: [
      cancelButton,
      noButton,
      yesButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

requestNurseConfirmationAlertDialog(BuildContext context) {
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  AlertDialog alert = AlertDialog(
    title: const Text("Confirmed"),
    content: const Text("A nurse will be with you shortly!"),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
