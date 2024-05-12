import 'package:flutter/material.dart';
import 'main_app.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscured = true;
  bool _keepSignedIn = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  void _login() {
    if (_studentIdController.text == 'student' && _passwordController.text == 'password') { //Conditions must be met in order to login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainApp()),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Invalid credentials'),
            actions: [
              TextButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _studentIdController,
              decoration: const InputDecoration(
                labelText: 'Student ID / OneID',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.account_circle),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
              obscureText: _isObscured,
              keyboardType: TextInputType.visiblePassword,
            ),
            Row(
              children: <Widget>[
                Checkbox(
                  value: _keepSignedIn,
                  onChanged: (bool? value) {
                    setState(() {
                      _keepSignedIn = value!;
                    });
                  },
                ),
                const Text('Keep me signed in'),
              ],
            ),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Sign in'),
            ),
          ],
        ),
      ),
    );
  }
}
