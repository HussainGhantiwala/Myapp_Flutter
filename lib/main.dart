// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_1/music/Playlist.dart';
import 'package:flutter_application_1/music/anime.dart';
import 'package:flutter_application_1/music/fav.dart';
import 'package:flutter_application_1/music/night.dart';
import 'package:flutter_application_1/pages/songs/slide4.dart';
import 'package:flutter_application_1/pages/songs/slide2.dart';
import 'package:flutter_application_1/pages/songs/slide3.dart';
import 'package:flutter_application_1/pages/songs/slide5.dart';
import 'package:flutter_application_1/pages/songs/slide6.dart';
import 'package:flutter_application_1/pages/songs/slide7.dart';
import 'package:flutter_application_1/pages/songs/slide8.dart';
import 'package:flutter_application_1/pages/songs/slide9.dart';
import 'package:flutter_application_1/pages/songs/song1.dart';
import 'package:flutter_application_1/pages/songs/song2.dart';
import 'package:flutter_application_1/pages/splash.dart';
import 'package:flutter_application_1/utilities/Navigation.dart';
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
        initialRoute: MyRoutes.splashRoute,
        routes: {
          MyRoutes.homeRoute: (context) => HomePage(),
          MyRoutes.loginRoute: (context) => LoginPage(),
          MyRoutes.navRoute: (context) => MainNav(),
          MyRoutes.playlistRoute: (context) => MyPlayList(),
          MyRoutes.songRoute: (context) => SongOne(
                index: 0,
              ),
          MyRoutes.twoRoute: (context) => SongTwo(
                index: 0,
              ),
          MyRoutes.splashRoute: (context) => Splash(),
          MyRoutes.slideRoute: (context) => SlideTwo(index: 0),
          MyRoutes.slide3: (context) => SlideThree(index: 0),
          MyRoutes.animeRoute: (context) => Anime(),
          MyRoutes.animeoneRoute: (context) => AnimeSongs(index: 0),
          MyRoutes.animetwoRoute: (context) => AnimeSongsTwo(index: 0),
          MyRoutes.favRoute: (context) => Fav(),
          MyRoutes.fav2Route: (context) => FavSongs(index: 0),
          MyRoutes.fav3Route: (context) => FavSongsTwo(index: 0),
          MyRoutes.nightRoute: (context) => Night(),
          MyRoutes.night2Route: (context) => NightSongs(index: 0),
          MyRoutes.night3Route: (context) => NightSongsTwo(index: 0),
        });
  }
}
