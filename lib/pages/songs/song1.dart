// ignore_for_file: prefer_const_constructors
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/routes.dart';
import 'package:slimy_card/slimy_card.dart';

class SongOne extends StatefulWidget {
  final int index;
  final musicData;
  const SongOne({Key? key, this.musicData, required this.index})
      : super(key: key);

  @override
  State<SongOne> createState() => _SongOneState();
}

class _SongOneState extends State<SongOne> {
  bool repeat = false;
  bool playing = false;
  Color color = Colors.white; // at the begining we ain't playing any song
  IconData playBtn =
      Icons.play_arrow_rounded; //the main state of play button icon
  AudioPlayer audioPlayer = AudioPlayer(); // AudioPlayer
  Duration position = Duration();
  Duration musicLength = Duration();
  //creating our custom slider

  Widget slider() {
    return Slider.adaptive(
        activeColor: Colors.white,
        inactiveColor: Colors.grey[350],
        value: position.inSeconds.toDouble(),
        min: 0.0,
        max: musicLength.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            seekToSec(value.toInt());
            value = value;
          });
        });
  }

  //creating seek function to freely move the slider or control the time of the music
  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    audioPlayer.seek(newPos);
  }

  //initializing the player
  @override
  void initState() {
    super.initState();
    //convert ByteData to Uint8List
    //now handeling the audio player time
    //this will help to get the muusic duration
    audioPlayer.onDurationChanged.listen((Duration dd) {
      setState(() {
        musicLength = dd;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((p) {
      setState(() {
        position = p;
      });
    });
    //this function will allow us to move the slider accordingly
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double _currentSliderValue = 20;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color.fromARGB(255, 148, 200, 180),
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
                      child: Icon(Icons.arrow_back_ios_new_rounded,
                          color: Colors.white),
                      onTap: () {
                        audioPlayer.stop();
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
                    height: 1450,
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
                          height: 20,
                        ),
                        Image(
                          image: NetworkImage(
                              widget.musicData[widget.index]["image"]),
                          width: MediaQuery.of(context).size.width - 120,
                          height: MediaQuery.of(context).size.width - 80,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                widget.musicData[widget.index]["song"],
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
                                widget.musicData[widget.index]["singer"],
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
                                          iconSize: 32.0,
                                          color: color,
                                          onPressed: (() {
                                            if (repeat == false) {
                                              audioPlayer.setReleaseMode(
                                                  ReleaseMode.LOOP);
                                              setState(() {
                                                repeat = true;
                                                color = Colors.blue;
                                              });
                                            } else if (repeat == true) {
                                              audioPlayer.setReleaseMode(
                                                  ReleaseMode.RELEASE);
                                              color = Colors.white;
                                            }
                                          }),
                                          icon: Icon(Icons.loop_sharp)),
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
                                        onPressed: (() async {
                                          if (!playing) {
                                            await audioPlayer.play(
                                                widget.musicData[widget.index]
                                                    ["audio"]);

                                            setState(() {
                                              playBtn = Icons.pause_rounded;
                                              playing = true;
                                            });
                                          } else {
                                            await audioPlayer.pause();
                                            setState(() {
                                              playBtn =
                                                  Icons.play_arrow_rounded;
                                              playing = false;
                                            });
                                          }
                                          audioPlayer.onPlayerCompletion
                                              .listen((event) {
                                            setState(() {
                                              position = Duration(seconds: 0);
                                              playBtn =
                                                  Icons.play_arrow_rounded;
                                              playing = false;
                                              Navigator.pushNamed(
                                                  context, MyRoutes.navRoute);
                                            });
                                          });
                                        }),
                                        icon: Icon(playBtn),
                                      ),
                                      IconButton(
                                        iconSize: 45.0,
                                        color: Colors.white,
                                        onPressed: (() {
                                          if (playing) {
                                            audioPlayer.stop();
                                            setState(() {
                                              playing = false;
                                            });
                                          }
                                        }),
                                        icon: Icon(
                                          Icons.skip_next_rounded,
                                        ),
                                      ),
                                      IconButton(
                                          iconSize: 30.0,
                                          color: Colors.white,
                                          onPressed: (() {}),
                                          icon: Icon(Icons.repeat_rounded))
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Column(
                                children: [
                                  ListView(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    children: [
                                      SlimyCard(
                                        width: 350,
                                        topCardHeight: 200,
                                        slimeEnabled: true,
                                        color:
                                            Color.fromARGB(255, 148, 200, 180)
                                                .withOpacity(0.30),
                                        topCardWidget: Container(
                                          margin: EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          child: Text(
                                            "LYRICS",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        bottomCardWidget: SingleChildScrollView(
                                          physics: BouncingScrollPhysics(),
                                          child: Text(
                                              widget.musicData[widget.index]
                                                  ["lyrics"],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                              textAlign: TextAlign.center),
                                        ),
                                        bottomCardHeight: 350,
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
