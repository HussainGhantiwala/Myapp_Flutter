// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/songs/slide4.dart';
import 'package:flutter_application_1/utilities/routes.dart';

import '../pages/songs/slide5.dart';

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
  List anime2 = [];
  loadData() async {
    await DefaultAssetBundle.of(context)
        .loadString("assets/files/anime.json")
        .then((a) {
      setState(() {
        anime = json.decode(a);
      });
    });
    await DefaultAssetBundle.of(context)
        .loadString("assets/files/anime2.json")
        .then((c) {
      setState(() {
        anime2 = json.decode(c);
      });
    });
  }

  @override
  void initState() {
    super.initState();

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
              SizedBox(
                height: 25,
              ),
              Expanded(
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: anime.length,
                    itemBuilder: (_, i) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AnimeSongsTwo(
                                      musicData: anime2, index: i)));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 2,
                                    offset: Offset(0, 0),
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                ]),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    width: 90,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image:
                                              NetworkImage(anime2[i]["image"]),
                                        )),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        anime2[i]["song"],
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "Avenir",
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(left: 175),
                                        width: 30,
                                        height: 30,
                                        child: ListTile(
                                          leading: Icon(
                                            CupertinoIcons.play_arrow,
                                            color: Color.fromARGB(
                                                255, 70, 174, 197),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        anime2[i]["singer"],
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: "Avenir",
                                            color: Color.fromARGB(
                                                255, 150, 148, 148)),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        width: 80,
                                        height: 30,
                                        child: Text(
                                          "Anime",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255)),
                                        ),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.topRight,
                                            // ignore: prefer_const_literals_to_create_immutables
                                            colors: [
                                              Color.fromARGB(255, 241, 70, 40),
                                              Color.fromARGB(255, 41, 36, 36),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ])));
  }
}
