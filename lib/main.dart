// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Login_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //bool male= true; //bool means true aand false value like i am male then true if female false
    //var day=69; //var means any variable can be taken like String , double, int , bool
    //const pi=3.14; //const means "Value that doest change"
    return MaterialApp(
        themeMode: ThemeMode.light,
        theme: ThemeData(
            primarySwatch: Colors
                .deepPurple), //"if the theme is light the app bar will turn purple"
        darkTheme: ThemeData(brightness: Brightness.dark),
        initialRoute: "/home",
        routes: {
          "/": (context) => LoginPage(),
          "/home": (context) => HomePage(),
          "/login": (context) => LoginPage()
        });
  }
}
