import 'package:flutter/material.dart';
import '../navigation/navigationbar_widget.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key, required this.title});

  final String title;

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

// import 'package:flutter/material.dart';

// class MessagesApp extends StatefulWidget {
//   @override
//   _MessagesPageState createState() => _MessagesPageState();
// }

class _MessagesPageState extends State<MessagesPage> {
  List<String> messages = [];
  TextEditingController messageController = TextEditingController();

  void sendMessage() {
    setState(() {
      messages.add(messageController.text);
      messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navigation_AppBar(),
      drawer: const NavigationMenu(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(messages[index]),
                );
              },
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 224, 224, 224),
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      hintText: "Type your message here..",
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                FloatingActionButton(
                  onPressed: sendMessage,
                  child: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class _MessagesPageState extends State<MessagesPage> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//       appBar: const Navigation_AppBar(),
//       drawer: const NavigationMenu(),
//       body: Column(
//         children: [
//           Expanded(child: Container()),
//           Container(
//             color: Colors.grey,
//             child: const TextField(
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: "Type your message here.."),
//             ),
//           )
//         ],
//       ),
//     ));
//   }
// }
