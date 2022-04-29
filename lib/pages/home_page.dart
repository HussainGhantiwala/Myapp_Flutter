// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Catalog app"),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset("Assets/images/design.png"),
            Text(
              "Hello!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}
