// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/music/Playlist.dart';
import 'package:flutter_application_1/pages/slide4.dart';
import 'package:flutter_application_1/utilities/Navigation.dart';
import 'package:flutter_application_1/utilities/routes.dart';

import '../pages/songs/slide3.dart';

class Anime extends StatefulWidget {
  const Anime({Key? key}) : super(key: key);

  @override
  State<Anime> createState() => _AnimeState();
}

class _AnimeState extends State<Anime> with SingleTickerProviderStateMixin {
  var _currentIndex = 0;
  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List catalog = [];
  List images = [];
  List catalog2 = [];
  List anime = [];
  late ScrollController _scrollController;
  late TabController _tabController;
  loadData() async {
    await DefaultAssetBundle.of(context)
        .loadString("assets/files/catalog.json")
        .then((s) {
      setState(() {
        catalog = json.decode(s);
      });
    });
    await DefaultAssetBundle.of(context)
        .loadString("assets/files/images.json")
        .then((s) {
      setState(() {
        images = json.decode(s);
      });
    });
    await DefaultAssetBundle.of(context)
        .loadString("assets/files/catalog2.json")
        .then((p) {
      setState(() {
        catalog2 = json.decode(p);
      });
    });
    await DefaultAssetBundle.of(context)
        .loadString("assets/files/anime.json")
        .then((a) {
      setState(() {
        anime = json.decode(a);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        //it will not allow user to go back to page 1 after entering page two.
        onWillPop: () async => false,
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () =>
                    Navigator.pushNamed(context, MyRoutes.playlistRoute),
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              elevation: 0.0,
              centerTitle: true,
              title: Text(
                "Nirvana",
                style: TextStyle(color: Colors.black, fontSize: 25.0),
              ),
            ),
            body: Column(children: [
              Row(
                children: [
                  SizedBox(
                    height: 45.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Anime",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 200,
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        right: 0,
                        left: -10,
                        child: Container(
                          height: 200,
                          child: PageView.builder(
                              physics: BouncingScrollPhysics(),
                              controller: PageController(viewportFraction: 0.9),
                              itemCount: anime.length,
                              itemBuilder: (_, i) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AnimeSongs(
                                                musicData: anime, index: i)));
                                  },
                                  child: Container(
                                    height: 200,
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.only(right: 18),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            anime[i]["image"],
                                          ),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                );
                              }),
                        )),
                  ],
                ),
              ),
            ])));
  }
}
