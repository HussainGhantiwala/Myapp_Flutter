// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/Navigation.dart';

void main() {
  runApp(MaterialApp(
    home: Splash(),
  ));
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State {
  @override
  void initState() {
    super.initState();
    // ignore: unnecessary_new
    new Future.delayed(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainNav()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 150),
                width: MediaQuery.of(context).size.width - 120,
                height: MediaQuery.of(context).size.width - 80,
                child: Image.asset(
                  "assets/images/audio6.gif",
                  gaplessPlayback: true,
                  fit: BoxFit.fill,
                  alignment: Alignment.center,
                ),
              ),
            ),
            SizedBox(
              height: 200,
            ),
            Column(
              children: [
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      "assets/images/loading.gif",
                      alignment: Alignment.center,
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
