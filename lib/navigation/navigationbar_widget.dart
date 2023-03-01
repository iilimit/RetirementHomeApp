import 'package:flutter/material.dart';
import '../home/home_widget.dart';
import '../login/login_widget.dart';
import '../messages/messages_widget.dart';
import '../requestNurse/request_nurse_widget.dart';

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

class NavigationAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60.0);
  const NavigationAppBar({
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
