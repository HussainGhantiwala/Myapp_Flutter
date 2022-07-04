// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/routes.dart';

import '../pages/songs/slide6.dart';
import '../pages/songs/slide7.dart';

class Fav extends StatefulWidget {
  const Fav({Key? key}) : super(key: key);

  @override
  State<Fav> createState() => _FavState();
}

class _FavState extends State<Fav> with SingleTickerProviderStateMixin {
  var _currentIndex = 0;
  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List fav = [];
  List fav2 = [];
  loadData() async {
    await DefaultAssetBundle.of(context)
        .loadString("assets/files/fav.json")
        .then((a) {
      setState(() {
        fav = json.decode(a);
      });
    });
    await DefaultAssetBundle.of(context)
        .loadString("assets/files/fav_2.json")
        .then((c) {
      setState(() {
        fav2 = json.decode(c);
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
                      "Op Songs",
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
                              itemCount: fav.length,
                              itemBuilder: (_, i) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => FavSongs(
                                                musicData: fav, index: i)));
                                  },
                                  child: Container(
                                    height: 200,
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.only(right: 18),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            fav[i]["image"],
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
                    itemCount: fav2.length,
                    itemBuilder: (_, i) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      FavSongsTwo(musicData: fav2, index: i)));
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
                                          image: NetworkImage(fav2[i]["image"]),
                                        )),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        fav2[i]["song"],
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
                                        fav2[i]["singer"],
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
                                          "Op Songs",
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
                                              Color.fromARGB(255, 73, 153, 224),
                                              Color.fromARGB(255, 8, 51, 82),
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
