// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text(
          "Login page",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 25,
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
