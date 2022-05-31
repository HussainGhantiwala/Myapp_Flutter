// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_1/music/Playlist.dart';
import 'package:flutter_application_1/pages/first_page.dart';
import 'package:flutter_application_1/pages/songs/song1.dart';
import 'package:flutter_application_1/utilities/Navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/pages/Login_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/utilities/routes.dart';
import 'package:flutter_application_1/widgets/theme.dart';

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
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: MyTheme.lightTheme(context),
        darkTheme: MyTheme.darkTheme(context),
        //"if the theme is light the app bar will turn purple"
        initialRoute: MyRoutes.songRoute,
        routes: {
          MyRoutes.homeRoute: (context) => HomePage(),
          MyRoutes.loginRoute: (context) => LoginPage(),
          MyRoutes.navRoute: (context) => MainNav(),
          MyRoutes.playlistRoute: (context) => MyPlayList(),
          MyRoutes.songRoute: (context) => SongOne(),
          MyRoutes.firstRoute: ((context) => FirstPage()),
        });
  }
}
