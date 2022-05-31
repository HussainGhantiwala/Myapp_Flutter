// ignore_for_file: prefer_const_constructors

import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/routes.dart';

class SongOne extends StatefulWidget {
  const SongOne({Key? key}) : super(key: key);

  @override
  State<SongOne> createState() => _SongOneState();
}

class _SongOneState extends State<SongOne> {
  bool playing = false; // at the begining we ain't playing any song
  IconData playBtn =
      Icons.play_arrow_rounded; //the main state of play button icon
  AudioCache cache = AudioCache(); // AudioCache
  AudioPlayer audioPlayer = AudioPlayer(); // AudioPlayer
  Duration position = Duration();
  Duration musicLength = Duration();
  //creating our custom slider

  Widget slider() {
    return Slider.adaptive(
        activeColor: Colors.white,
        inactiveColor: Colors.grey[350],
        value: position.inSeconds.toDouble(),
        max: musicLength.inSeconds.toDouble(),
        onChanged: (value) {
          seekToSec(value.toInt());
        });
  }

  //creating seek function to freely move the slider or controll the time of the music
  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    audioPlayer.seek(newPos);
  }

  //initializing the player
  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    cache = AudioCache(fixedPlayer: audioPlayer);

    //now handeling the audio player time
    //this will help to get the muusic duration
    audioPlayer.onDurationChanged.listen((Duration dd) {
      setState(() {
        musicLength = dd;
      });
    });
    //this function will allow us to move the slider accordingly
    audioPlayer.onAudioPositionChanged.listen((Duration dd) {
      setState(() {
        position = dd;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double _currentSliderValue = 20;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color.fromARGB(255, 28, 166, 113),
          ),
          SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.only(
                      right: 355,
                    ),
                    height: 15,
                    width: 15,
                    child: InkWell(
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, MyRoutes.navRoute);
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 40),
                    color: Colors.transparent,
                    child: Text(
                      "From Playlist",
                      style: TextStyle(color: Colors.white),
                    ),
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 900,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0.9),
                          Colors.black.withOpacity(1)
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Image(
                          image: NetworkImage(
                              "https://i.scdn.co/image/ab67616d0000b27387883ad849cb0602b6f36503"),
                          width: MediaQuery.of(context).size.width - 120,
                          height: MediaQuery.of(context).size.width - 120,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "Lagja Gale Se Phir",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Lata Mangeshkar",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: 500.0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${position.inMinutes}:${position.inSeconds.remainder(60)}",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        slider(),
                                        Text(
                                          "${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        iconSize: 45.0,
                                        color: Colors.white,
                                        onPressed: (() {}),
                                        icon: Icon(
                                          Icons.skip_previous_rounded,
                                        ),
                                      ),
                                      IconButton(
                                        iconSize: 52.0,
                                        color: Colors.white,
                                        onPressed: (() {
                                          if (!playing) {
                                            cache.play("Lagja.mp3");
                                            setState(() {
                                              playBtn = Icons.pause_rounded;
                                              playing = true;
                                            });
                                          } else {
                                            audioPlayer.pause();
                                            setState(() {
                                              playBtn =
                                                  Icons.play_arrow_rounded;
                                              playing = false;
                                            });
                                          }
                                        }),
                                        icon: Icon(playBtn),
                                      ),
                                      IconButton(
                                        iconSize: 45.0,
                                        color: Colors.white,
                                        onPressed: (() {}),
                                        icon: Icon(
                                          Icons.skip_next_rounded,
                                        ),
                                      )
                                    ],
                                  )
                                ],
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
          ),
        ],
      ),
    );
  }
}
