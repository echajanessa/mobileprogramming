import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pertemuan3/stopwatch.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _foreKey = GlobalKey<FormState>();

  bool loggedIn = false;
  late String name;

  void _validate() {
    final form = _foreKey.currentState;
    if (!form!.validate()) {
      return;
    }

    final name = _nameController.text;
    final email = _emailController.text;

    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => StopWatch(name: name, email: email)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: _buildLoginForm(),
      ),
    );
  }

  Widget _buildSuccess() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.check, color: Colors.orangeAccent),
        Text('Hi $name!'),
      ],
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _foreKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Email'),
              validator: (text) {
                if (text!.isEmpty) {
                  return 'Enter Email.';
                }
                final regex = RegExp('[^@]+@[^\.]+\..+');
                if (!regex.hasMatch(text)) {
                  return 'Enter a valid email';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Runner'),
              validator: (text) => text!.isEmpty ? 'Enter the runner\'s name.' : null,
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: _validate,
                child: Text('Continue')
            )
          ],
        ),
      ),
    );
  }
}
