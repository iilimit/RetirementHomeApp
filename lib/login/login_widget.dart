import 'package:flutter/material.dart';
import 'package:project_1/home/home_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final successMsg = "Success";
  static const loginUsername = "test1234";
  static const loginPassword = "password123";

  //focuses
  final FocusNode _loginFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  _nextFocus(FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("", textAlign: TextAlign.center)),
      ),
      body: Center(
        child: _buildUI(context),
      ),
    );
  }

  _buildUI(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 30),
            Image.asset(
              'assets/images/login page image.png',
              height: 190.0,
              fit: BoxFit.cover,
            ),
            _getLoginField(),
            _getPasswordField(),
            ElevatedButton(
              onPressed: _submitLoginData,
              style: _buttonStyle(),
              child: const Text('Submit'),
            ),
          ],
        ));
  }

  _submitLoginData() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.reset();
      setState(() {});
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const MyHomePage(
                  title: 'Home Page',
                )),
      );
    }
  }

  _getLoginField() {
    return TextFormField(
      controller: _loginController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      focusNode: _loginFocusNode,
      onFieldSubmitted: (String value) {
        _nextFocus(_loginFocusNode);
      },
      validator: _validateUsername,
      decoration: const InputDecoration(
          hintText: 'Login is $loginUsername', labelText: "Login"),
    );
  }

  _getPasswordField() {
    return TextFormField(
      controller: _passwordController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      focusNode: _passwordFocusNode,
      onFieldSubmitted: (String value) {
        _nextFocus(_passwordFocusNode);
      },
      validator: _validatePassword,
      decoration: const InputDecoration(
          hintText: "Password is $loginPassword", labelText: "Password"),
    );
  }

  String? _validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Required!';
    }
    if (value != loginUsername) {
      return 'Incorrect username!';
    }

    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Required!';
    }
    if (value != loginPassword) {
      return 'Incorrect password!';
    }

    return null;
  }

  _buttonStyle() {
    return ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll<Color>(
            Color.fromARGB(255, 91, 88, 255)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))));
  }
}
