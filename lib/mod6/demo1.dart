import 'package:flutter/material.dart';

void main() {
  runApp(PasswordInput("Mot de passe"));
}

class PasswordInput extends StatefulWidget {
  String label;

  PasswordInput(this.label);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _isVisible = false;

  void changeVisibility(bool value) {
    setState(() {
      _isVisible = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Démo state",
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  obscureText: !_isVisible,
                  decoration: InputDecoration(labelText: widget.label),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(_isVisible ? Icons.lock_open : Icons.lock),
                    Switch(
                        value: _isVisible,
                        onChanged: changeVisibility
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
