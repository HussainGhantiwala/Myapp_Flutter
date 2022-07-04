// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/routes.dart';

class MyPlayList extends StatefulWidget {
  const MyPlayList({Key? key}) : super(key: key);

  @override
  State<MyPlayList> createState() => _MyPlayListState();
}

class _MyPlayListState extends State<MyPlayList>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.pushNamed(context, MyRoutes.navRoute),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              "My Playlists",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
              ),
            ),
          ),
          body: ListView(physics: BouncingScrollPhysics(), children: [
            InkWell(
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
                          margin: const EdgeInsets.only(right: 5),
                          width: 90,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://data.whicdn.com/images/340436503/original.jpg"),
                              )),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              "For Here",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Avenir",
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Playlist",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: "Avenir",
                                  color: Color.fromARGB(255, 150, 148, 148)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
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
                          margin: const EdgeInsets.only(right: 5),
                          width: 90,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://i1.sndcdn.com/artworks-000677841928-57e30m-t500x500.jpg"),
                              )),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              "Lazy Lo-Fi",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Avenir",
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Playlist",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: "Avenir",
                                  color: Color.fromARGB(255, 150, 148, 148)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.animeRoute);
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
                          margin: const EdgeInsets.only(right: 5),
                          width: 90,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://i.pinimg.com/originals/70/c1/8b/70c18baa8286e09a0eb865fc2817fd03.jpg"),
                              )),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              "Anime",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Avenir",
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Playlist",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: "Avenir",
                                  color: Color.fromARGB(255, 150, 148, 148)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.favRoute);
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
                          margin: const EdgeInsets.only(right: 5),
                          width: 90,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://i1.sndcdn.com/artworks-kj7uRaSs6KykH2Cf-SUDoBw-t500x500.jpg"),
                              )),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              "Op Songs",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Avenir",
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Playlist",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: "Avenir",
                                  color: Color.fromARGB(255, 150, 148, 148)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.nightRoute);
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
                          margin: const EdgeInsets.only(right: 5),
                          width: 90,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://unseen.photos/wp-content/uploads/2021/02/38831339_2188353518100850_7825663389518004224_n.jpg"),
                              )),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              "Late Night Vibe",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Avenir",
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Playlist",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: "Avenir",
                                  color: Color.fromARGB(255, 150, 148, 148)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
