import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utilities/routes.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Image.asset("asset/images/HappyMusic.png"),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "Hey Welcome",
                      style: TextStyle(
                        fontFamily: GoogleFonts.lato().fontFamily,
                        fontSize: 28,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    child: Column(
                      children: [
                        Container(
                          width: 350,
                          height: 300,
                          alignment: Alignment.center,
                          child: Text(
                            "MY FIRST APP",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.deepPurple,
                                width: 4.0,
                                style: BorderStyle.solid,
                              ),
                              color: Colors.deepPurpleAccent,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.purpleAccent,
                                  offset: const Offset(5.0, 5.0),
                                  blurRadius: 20.0,
                                  spreadRadius: 2.0,
                                ),
                                BoxShadow(
                                  color: Colors.white,
                                  offset: const Offset(0.0, 0.0),
                                  blurRadius: 0.0,
                                  spreadRadius: 0.0,
                                )
                              ]),
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, MyRoutes.homeRoute);
                          },
                          child: Column(
                            children: [
                              Icon(
                                FeatherIcons.arrowRight,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
