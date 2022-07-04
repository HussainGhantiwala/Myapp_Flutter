// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/songs/slide2.dart';
import 'package:flutter_application_1/pages/songs/slide3.dart';
import 'package:flutter_application_1/pages/songs/song1.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  var _currentIndex = 0;
  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List catalog = [];
  List images = [];
  List catalog2 = [];
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
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "Nirvana",
            style: TextStyle(color: Colors.black, fontSize: 25.0),
          ),
        ),
        body: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 45.0,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Text(
                    greeting(),
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 12.0,
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
                            itemCount: catalog.length,
                            itemBuilder: (_, i) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SlideThree(
                                              musicData: catalog, index: i)));
                                },
                                child: Container(
                                  height: 200,
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.only(right: 18),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          catalog[i]["image"],
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
            SizedBox(height: 25),
            Expanded(
              child: NestedScrollView(
                controller: _scrollController,
                headerSliverBuilder: (BuildContext context, bool isScroll) {
                  return [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.white,
                      elevation: 0.0,
                      pinned: true,
                      bottom: PreferredSize(
                        preferredSize: Size.fromHeight(20),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 20, left: 10),
                          child: TabBar(
                            indicatorPadding: const EdgeInsets.all(0),
                            indicatorSize: TabBarIndicatorSize.label,
                            labelPadding: const EdgeInsets.only(right: 10),
                            controller: _tabController,
                            isScrollable: true,
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 7,
                                  offset: Offset(0, 0),
                                )
                              ],
                            ),
                            tabs: [
                              Container(
                                width: 120,
                                height: 50,
                                child: Text(
                                  "Old Classic",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromARGB(255, 45, 150, 119),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 7,
                                      offset: Offset(0, 0),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 120,
                                height: 50,
                                child: Text(
                                  "20's Hit",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.topRight,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    colors: [
                                      Color.fromARGB(255, 115, 204, 220),
                                      Color.fromARGB(255, 37, 102, 241)
                                    ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 7,
                                      offset: Offset(0, 0),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 120,
                                height: 50,
                                child: Text(
                                  "New Classics",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [Colors.purple, Colors.blue],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 7,
                                      offset: Offset(0, 0),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: images.length,
                        itemBuilder: (_, i) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SongOne(
                                          musicData: images, index: i)));
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
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        width: 90,
                                        height: 120,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  images[i]["image"]),
                                            )),
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            images[i]["song"],
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: "Avenir",
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 175),
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
                                            images[i]["singer"],
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
                                            width: 100,
                                            height: 30,
                                            child: Text(
                                              "Old Classics",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255)),
                                            ),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                              color: Color.fromARGB(
                                                  255, 101, 174, 172),
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
                    ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: images.length,
                        itemBuilder: (_, i) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SlideTwo(
                                          musicData: catalog2, index: i)));
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
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        width: 90,
                                        height: 120,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  catalog2[i]["image"]),
                                            )),
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            catalog2[i]["song"],
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: "Avenir",
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 187),
                                            width: 30,
                                            height: 30,
                                            child: ListTile(
                                              leading: Icon(
                                                CupertinoIcons.play_arrow,
                                                color: Color.fromARGB(
                                                    255, 70, 174, 197),
                                              ),
                                              onTap: () {},
                                            ),
                                          ),
                                          Text(
                                            catalog2[i]["singer"],
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
                                            width: 100,
                                            height: 30,
                                            child: Text(
                                              "20's Hit",
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
                                                  Color.fromARGB(
                                                      255, 115, 204, 220),
                                                  Color.fromARGB(
                                                      255, 81, 114, 187)
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
                    Material(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                        ),
                        title: Text("Content"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
