// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    num days = 10;
    String name = "Girlfriend";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Catalog app"),
      ),
      body: Center(
        child: Container(
          child: Text(
            "Yooooo suup, this will be my $days of me building an ui for my $name",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
